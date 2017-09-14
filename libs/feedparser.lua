￼
local LOM =  assert ( require ( " lxp.lom " )، " LuaExpat به نظر نمی رسد نصب شود. نوع feedparser نیاز به کار دارد ... " )
محلی XMLElement = ( loadfile  " ./libs/XMLElement.lua " ) ()
محلی dateparser = ( loadfile  " ./libs/dateparser.lua " ) ()
URL محلی = ( loadfile  " ./libs/url.lua " ) ()
tinsert محلی ، tremove، tconcat = جدول. قرار دادن ، جدول حذف میز کنکات
جفت های محلی ، ipairs = جفت، ipairs

- feedparser، مشابه Parser Feed Feed برای پایتون، اما یک معامله خوب ضعیف است.
- برای اطلاعات بیشتر در مورد Parser Feed Feed به http://feedparser.org مراجعه کنید
feed feeder محلی = {
 _description =  " RSS و Atom تجزیه کننده خوراک " ،
 _VERSION  =  " feedparser 0.71 "
}

محلی blanky = XMLElement. new () - در مجموعهای از مکانها مفید است

تابع محلی حل می شود ( url ، base_url )
 URL بازگشت مطلق (base_url، url)
پایان

تابع rebase محلی ( el ، base_uri )
 local xml_base = el: getAttr ( ' xml: base ' )
 اگر  xml_base نیست، سپس  end base_uri را باز کنید
  حل و فصل بازگشت (xml_base، base_uri)
پایان

محلی تابع parse_entries ( entries_el ، format_str ، پایه )
 نوشته های محلی = {}
 برای من، entry_el در  ipairs (entries_el) انجام دهید
  ورودی محلی = {enclosures = {}، links = {}، contributors = {}}
  entry_base =  rebase محلی (entry_el، base)
  برای من، ال در  ipairs (entry_el: getChildren ( ، * ، )) انجام
   برچسب محلی = el: getTag ()
   محلی el_base =  rebase (el، entry_base)
   - عنوان
   اگر tag ==  ' title '  یا tag ==  ' dc: title '  یا tag == ' rdf: title '  پس از آن  - 'dc: title' در فید ات اتخاذ نمی شود، اما هر چه باشد.
ورودی title = el: getText ()

   - لینک (ها)
   elseif format_str ==  ' rss '  و tag == ' link '  سپس
ورودی لینک = عزم (EL: گتکس ()، el_base)
    tinsert (ورودی لینک ها ، {href = ورودی لینک })

   elseif  (format_str == ' atom '  و tag ==  ' link ' ) یا
     (format_str ==  ' rss '  و tag == ' atom: link ' ) سپس
    لینک محلی = {}
    برای من attr در  ipairs { ' rel ' ، ' type ' ، ' href ' ، ' title ' } انجام دهید
     لینک [attr] = (attr == ' href ' ) و  حل کردن (el: getAttr (attr)، el_base) یا el: getAttr (attr) - uri
    پایان
    tinsert (ورود لینک ها ، لینک)
    اگر پیوند نگارش == ، محوطه ،  پس از آن
     tinsert (ورودی محوطه ، {
      href = لینک عکاس هنگام عکسبرداری ،
      طول = el: getAttr ( ' طول ' )،
      type = el: getAttr ( ' type ' )
     })
    پایان

   - محوطه RSS
   elseif format_str ==  ' rss '  و tag == ' enclosure '  سپس
    tinsert (ورودی محوطه ، {
     url = el: getAttr ( ' url ' )،
     طول = el: getAttr ( ' طول ' )،
     type = el: getAttr ( ' type ' )
    })

   - خلاصه
   elseif  (format_str == ' atom '  و tag == ' خلاصه ' ) یا
     (format_str == ' rss '  و (tag == ' description '  یا tag == ' dc: description '  یا tag == ' rdf: description ' )) سپس
ورودی summary = el: getText ()
    - TODO: summary_detail

   - محتوا
   elseif  (format_str == ' اتم '  و tag == ' محتوا ' ) یا
     (format_str == ' rss '  و (برچسب == ' body '  یا tag == ' xhtml: body '  یا tag ==  ' fullitem '  یا tag == ' content: encoded ' )) سپس
ورودی content = el: getText ()
    - TODO: content_detail

   - منتشر شده است
   elseif  (format_str ==  ' atom '  و (tag == ' published '  or tag == ' issued ' )) یا
     (format_str ==  ' rss '  و (tag == ' dcterms: issued '  یا tag == ' atom: published '  or tag == ' atom: issued ' )) سپس
ورودی published  = el: getText ()
ورودی published_parsed = dateparser تجزیه (ورود منتشر شده )

   - به روز شد
   elseif  (format_str == ' atom '  و (tag == ' updated '  یا tag == ' modified ' )) یا
     (format_str == ' rss '  و (tag == ' dc: date '  یا tag == ' pubDate '  یا tag == ' dcterms: modified ' )) سپس
ورودی updated = el: getText ()
ورودی updated_parsed = dateparser تجزیه (ورود به روز شده )

   elseif tag == ' ایجاد شده '  یا tag == ' atom: created '  یا tag == ' dcterms: created '  سپس
ورودی ایجاد = el: getText ()
ورودی created_parsed = dateparser. تجزیه (ورودی ایجاد شده )

   - شناسه
   elseif  (format_str == ' atom '  و tag == ' id ' ) یا
     (format_str == ' rss '  و tag == ' guid ' ) سپس
ورودی شناسه = عزم (EL
: گتکس ()، el_base)   - این یک URI است، درست است؟

   - نویسنده
   elseif format_str == ' rss '  و (tag == ' author '  یا tag == ' dc: creator ' ) سپس  - برچسب نویسنده باید ایمیل نویسنده باشد. آیا باید به این موضوع احترام گذاشت؟
ورودی author = (el: getChild ( ' name ' ) یا el): getText ()
ورودی author_detail = {
     نام = ورود نویسنده
    }
   elseif format_str == ' atom '  و tag == ' author '  سپس
ورودی author = (el: getChild ( ' name ' ) یا el): getText ()
ورودی author_detail  = {
     نام = ورود نویسنده ،
     email = (el: getChild ( ' email ' ) یا blanky): getText ()
    }
    محلی author_url = (EL: getChild ( ، آدرس ، ) و یا blanky): گتکس ()
    اگر author_url و author_url ~ =  " "  پس وارد شوید. author_detail . عکاس هنگام عکسبرداری = عزم (author_url، REBASE (EL: getChild ( ، آدرس ، )، el_base)) پایان

   elseif برچسب == ' category '  یا tag == ' dc: subject '  سپس
    - انجام کار

   elseify برچسب == ' منبع '  سپس
    - انجام کار
   پایان
  پایان

  - راهنمای ردیف را بسته بندی کنید
  اگر format_str ==  ' rss '  و ( not entry id ) و entry_el: getAttr ( ' rdf: about ' ) سپس
ورودی id = resolve (entry_el: getAttr ( ' rdf: about ' )، entry_base) - uri
  پایان

  - بسته بندی کردن entry.link
  برای من، لینک در  جفت (ورود لینک ها ) انجام دهید
   اگر پیوند rel == " جایگزین "  یا ( link not rel ) یا link. REL == " "  پس از آن
ورودی لینک = لینک href  - در حال حاضر حل شده است
    زنگ تفريح
   پایان
  پایان
  اگر  ورودی نباشد لینک  و format_str == ' rss '  سپس
ورودی لینک = ورود شناسه
  پایان
  tinsert (ورودی، ورودی)
 پایان
 ورودی بازگشت
پایان

تابع محلی atom_person_construct ( person_el ، base_uri )
 شخص محلی = {
  نام = (person_el: getChild ( ، نام ، )   و یا blanky): گتکس ()،
  ایمیل = (person_el: getChild ( ، ایمیل ، ) و یا blanky): گتکس ()
 }
 محلی url_el = person_el: getChild ( ، آدرس ، )
 اگر url_el پس شخص عکاس هنگام عکسبرداری = عزم (url_el: گتکس ()، REBASE (url_el، base_uri)) پایان
 بازگشت شخص
پایان

تابع محلی parse_atom ( root ، base_uri )
 محلی res = {}
 خوراک محلی = {
  لینک ها = {}
  همکاران = {}
  language = root: getAttr ( ' lang ' ) یا root: getAttr ( ' xml: lang ' )
 }
 محلی root_base =  rebase (root، base_uri)
رز تغذیه = تغذیه
رز format = ' atom '
 local version = (root: getAttr ( ' version ' ) یا  ' ' ): lower ()
 اگر   نسخه == " 1.0 "  یا ریشه: getAttr ( ' xmlns ' ) == ' http://www.w3.org/2005/Atom '  سپس res. version = ' atom10 '
 elseif  version == " 0.3 "  سپس res. version = ' atom03 '
 جای دیگری       است version = ' اتم '  پایان

 برای من، ال در  ipairs (ریشه: getChildren ( ، * ، )) انجام
  برچسب محلی = el: getTag ()
  محلی el_base = rebase (el، root_base)
  اگر تگ ==  ، عنوان ،  و یا تگ ==  ، DC: عنوان :  یا برچسب ==  ، atom10: عنوان :  یا برچسب ==  ، atom03: عنوان :  پس از آن
   خوراک. title = el: getText () - sanitize!
   - todo: feed.title_detail

  - موضوعات مرتبط
  elseif برچسب == ' لینک '  پس از آن
   لینک محلی = {}
   برای من attr در  ipairs { ' rel ' ، ' type ' ، ' href ' ، ' title ' } انجام دهید
    لینک [attr] = (attr == ' href ' ) و  حل کردن (el: getAttr (attr)، el_base) یا el: getAttr (attr)
   پایان
   tinsert (خوراک لینک ، لینک)

  - زیرنویس
  elseif برچسب ==  ' زیرنویس '  سپس
   خوراک. زیرنویس = el: getText () - تصفیه!
  ELSEIF  نمی تغذیه می کنند. زیرنویس  و (tag ==  ' tagline '  یا tag == ' atom03: tagline '  یا tag == ' dc: description ' ) سپس
   خوراک. زیرنویس = el: getText () - تصفیه!

  - حقوق
  elseif tag ==  ' copyright '  یا tag ==  ' rights '  پس از آن
   خوراک. rights = el: getText () - تصفیه کردن!

  - ژنراتور
  elseify برچسب ==  ' ژنراتور '  سپس
   خوراک. generator = el: getText () - تصفیه!
  elseif برچسب ==  ' admin: generatorAgent '  سپس
   خوراک. ژنراتور  = خوراک ژنراتور  یا el: getAttr ( ' rdf: منابع ' )

  - اطلاعات
  elseif tag ==  ' info '  سپس  - به هر حال، هیچ کس مراقبت، به هر حال.
   خوراک. info  = el: getText ()

  - شناسه
  elseif برچسب == ' id '  سپس
   خوراک. شناسه = عزم (EL: گتکس ()، el_base) - این یک آدرس است، درست است ،،،؟

  - به روز شد
  elseif tag ==  ' updated '  یا tag ==  ' dc: date '  یا tag ==  ' modified '  یا tag == ' rss: pubDate '  سپس
   خوراک. up
   dated  = el: getText ()
   خوراک. updated_parsed = dateparser تجزیه (خوراک به روز شده )

  - نویسنده
  elseif برچسب == ' نویسنده '  یا برچسب == ' اتم: نویسنده '  سپس
   خوراک. author_detail = atom_person_construct (el، el_base)
   خوراک. نویسنده = خوراک author_detail . نام

  - همکاران
  elseif برچسب == ' contributor '  یا tag == ' atom: contributor '  سپس
   tinsert (اشتراک کنندگان ، atom_person_construct (el، el_base))

  - آیکون
  elseif برچسب == ' آیکون '  سپس
   خوراک. آیکون = عزم (EL: گتکس ()، el_base)

  - آرم
  elseif برچسب == ' آرم '  سپس
   خوراک. آرم = عزم (EL: گتکس ()، el_base)

  - زبان
  elseif برچسب == ' language '  یا tag == ' dc: language '  سپس
   feed.language=feed.language or el:getText()

  --licence
  end
 end
 --feed.link (already resolved)
 for i, link in pairs(feed.links) do
  if link.rel=='alternate' or not link.rel or link.rel=='' then
   feed.link=link.href
   break
  end
 end

رز نوشته = parse_entries (ریشه: getChildren ( ، ورود ، )، ، اتم ، ، root_base)
 بازگشت RES
پایان

تابع محلی parse_rss ( root ، base_uri )

 کانال محلی = ریشه: getChild ({ ' کانال ' ، ' rdf: کانال ' })
 کانال local_base =  rebase محلی (کانال، base_uri)
 اگر  نه کانال و سپس  بازگشت  صفر ، " می تواند آن را تجزیه نیست. "  پایان

 محلی feed = {links = {}، contributors = {}}
 محلی res = {
  خوراک = خوراک
  فرمت = " RSS " ،
  نوشته ها = {}
 }

 - این کاملا درست نیست.
 اگر ریشه: getTag (): lower () == ' rdf: rdf '  سپس
رز version = ' rss10 '
 چیز دیگری
رز version = ' rss20 '
 پایان

 برای من، ال در  ipairs (کانال: getChildren ( ، * ، )) انجام
  محلی el_base = rebase (el، channel_base)
  برچسب محلی = el: getTag ()

  اگر برچسب == ' لینک '  سپس
   خوراک. لینک = عزم (EL: گتکس ()، el_base)
   tinsert (خوراک لینک ها ، {href = خوراک لینک })

  - عنوان
  elseif برچسب ==  ' title '  یا tag ==  ' dc: title '  سپس
   خوراک. title = el: getText () - sanitize!

  - زیرنویس
  elseif برچسب ==  ' توضیحات '  یا برچسب == ' dc: description '  یا tag == ' itunes: subtitle '  سپس
   خوراک. زیرنویس = el: getText () - تصفیه!

  - حقوق
  elseif tag ==  ' copyright '  یا tag ==  ' dc: rights '  سپس
   خوراک. rights = el: getText () - تصفیه کردن!

  - ژنراتور
  elseify برچسب ==  ' ژنراتور '  سپس
   خوراک. generator = el: getText ()
  elseif برچسب ==  ' admin: generatorAgent '  سپس
   خوراک. ژنراتور  = خوراک ژنراتور  یا el: getAttr ( ' rdf: منابع ' )

  - اطلاعات (هیچ کس نگران ...)
  elseif برچسب ==  ' feedburner: browserFriendly '  سپس
   خوراک. info  = el: getText ()

  - به روز شد
  elseif برچسب ==  ' pubDate '  یا tag ==  ' dc: date '  یا tag ==  ' dcterms: modified '  سپس
   خوراک. updated  = el: getText ()
   خوراک. updated_parsed  = dateparser تجزیه (خوراک به روز شده )

  - نویسنده
  elseif برچسب == ' managerEditor '  یا tag == ' dc: creator '  یا برچسب == ' itunes: author '  یا tag == ' dc: creator '  یا tag == ' dc: author '  سپس
   خوراک. نویسنده = tconcat (EL: getChildren ( ، متن () ، ))
   خوراک. author_details = {name = خوراک. نویسنده }
  elseif برچسب == ' اتم: نویسنده '  سپس
   خوراک. author_details  =  atom_person_construct (el، el_base)
   خوراک. نویسنده  = خوراک author_details . نام

  - همکاران
  elseif برچسب ==  ' dc: contributor '  سپس
   tinsert (خوراک. همکاران ، {name = el: getText ()})
  elseif برچسب ==  ' atom: contributor '  سپس
   tinsert (اشتراک کنندگان ، atom_person_construct (el، el_base))

  - تصویر
  elseif برچسب == ' image '  یا tag == ' rdf: image '  سپس
   خوراک. image = {
    title = el: getChild ( ' title ' ): getText ()،
    link = (el: getChild ( ' link ' ) یا blanky): getText ()،
    width = (el: getChild ( ' width ' ) یا blanky): getText ()،
    height = (el: getChild ( ' height ' ) یا blanky): getText ()
   }
   محلی url_el = ال: getChild ( ، آدرس ، )
   اگر url_el سپس تغذیه تصویر . عکاس هنگام عکسبرداری  =  عزم (url_el: گتکس ()، REBASE (url_el، el_base)) پایان

  - زبان
  elseif برچسب == ' language '  یا tag == ' dc: language '  سپس
   خوراک. language = el: getText ()

  - مجوز
  - ناشر
  - برچسب ها
  پایان
 پایان

رز نوشته = parse_entries (کانال: getChildren ( ، مورد ، )، ، اس، اس ، ، channel_base)
 بازگشت RES
پ
ایان


- - تجزیه خوراک xml
- XMLparam خوراک xml_string، به عنوان یک رشته
- منبع param base_url (اختیاری) منبع خوراک. هنگام حل و فصل لینک های نسبی موجود در محتویات خوراک مفید است
- @ عقب میز با اطلاعات خوراک تجزیه شده، یا صفر، error_message در خطا.
-   فرمت جدول برگشتی بسیار شبیه به آن در http://feedparser.org است، با تفاوت عمده آن
-   تاریخ ها به unixtime تجزیه می شوند. اکثر زمینه های دیگر بسیار مشابه هستند.
تابع feedparser.parse ( xml_string ، BASE_URL )
 لوم محلی ، err = LOM. تجزیه (xml_string)
 اگر  نه لوم و سپس  بازگشت به  صفر ، " نمی تواند تجزیه XML. LXP می گوید: "  .. اشتباه و یا  " هیچ چیز "  پایان
 rootElement محلی = XMLElement جدید (لوم)
 محلی root_tag = rootElement: getTag (): lower ()
 اگر root_tag == ' rdf: rdf '  یا root_tag == ' rss '  پس از آن
  بازگشت  parse_rss (rootElement، base_url)
 elseif root_tag == ' feed '  سپس
  return  parse_atom (rootElement، base_url)
 چیز دیگری
  بازگشت  صفر ، " فرمت فید ناشناخته "
 پایان
پایان

- به خاطر سازگاری عقب مانده، feedparser مرجع جهانی برای lua <5.3 را صادر می کند
اگر  _VERSION : sub ( - 3 ) <  " 5.3 "  سپس
 _G . feedparser = feedparser
پایان


بازگشت feedparser
