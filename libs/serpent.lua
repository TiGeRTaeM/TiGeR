￼
محلی n، v =  " مار " ، 0.28  - (C) 2012-15 Paul Kulchenko؛ مجوز MIT
محلی c، d =  " Paul Kulchenko " ، " Lua serializer و چاپگر زیبا "
محلی SNUM = {[ متد toString ( 1 / 0 )] = ' 1/0 - [[math.huge]] ، [ متد toString ( - 1 / 0 )] = ' -1/0 - [[- ریاضی. بزرگ]] ، [ متد toString ( 0 / 0 )] = ' 0/0 ، }
badtype محلی = {thread =  true ، userdata =  true ، cdata =  true }
محلی کلمه کلیدی، global دربرمیگیرد، G = {}، {}، ( _G  یا _ENV)
برای _، K در  ipairs ({ " و " ، " استراحت " ، " انجام " ، " دیگری " ، " ELSEIF ، ، ، پایان ، ، ، نادرست ، ،
  ، برای ، ، ، تابع ، ، ، رفتن ، ، ، اگر ، ، ، در ، ، ، محلی ، ، ، صفر ، ، ، نمی ، ، ، یا ، ، ، تکرار ، ،
  ' return ' ، ' then ' ، ' true ' ، ' until ' ، ' while ' }) انجام کلید واژه [k] =  end true 
برای k، v در  جفت (G) انجام globals [v] = k end  - ساخت func برای نامگذاری نقشه برداری
برای _، g در  ipairs ({ ' coroutine ' ، ' debug ' ، ' io ' ، ' ریاضی ' ، ' رشته ' ، ' table ' ، ' os ' }) do
  برای k، v در  جفت (G [g] یا {}) انجام globals [v] = g .. ' . : .. ک پایان  پایان

تابع محلی s ( t ، opts )
  نام محلی ، عقب نشینی، مرگ و میر، maxnum = opts. نام ، انتخاب می کند عقب نشینی ، انتخاب می کند مرگبار است ، انتخاب می کند حداکثر
  محلی اسپرد، سفارشی، بزرگ = انتخاب می کند. پراکنده ، انتخاب می کند سفارشی ، انتخاب نمی کند خیر
  محلی فضا، maxl = (موارد برگزیده. جمع و جور  و  ، ،  یا  ،  ، )، (موارد برگزیده. maxlevel  یا  math.huge )
  ورودی محلی ، comm =  ' _ ' .. (نام یا  ' ' )، انتخاب می کند. نظر  و ( tonumber (موارد برگزیده. نظر ) یا  math.huge )
  محلی دیده می شود، sref، syms، symn = {}، { ' محلی ' .. iname .. ' = {} ' }، {}، 0
  محلی تابع gensym ( وال ) بازگشت  ، _ ، .. ( متد toString ( متد toString (VAL)): gsub ( " [^٪ W] " ، " " ): gsub ( " (از٪ d٪ W +) " ،
    - tostring (val) مورد نیاز است زیرا __tostring ممکن است مقدار غیر رشته را بازگرداند
    تابع ( ها ) اگر  نه syms [s] سپس symn = symn + 1 ؛ syms [S] = symn پایان  بازگشت  متد toString (syms [S]) پایان )) پایان
  تابع محلی safesr ( s ) return  type (s) ==  " number "  و  tostring (بزرگ و snum [ tostring (s)] یا s)
    یا  نوع (ها) ~ =  " رشته "  و  tostring (s) - escape NEWLINE / 010 و EOF / 026
    یا ( " ٪ q " ): فرمت (های): gsub ( " \ 010 " ، " n " ): gsub ( " \ 026 " ، " \\ 026 " ) پایان
  محلی تابع نظر ( بازدید کنندگان ، L ) بازگشت COMM و (L یا  0 ) < هش و  ، - [[ : .. متد toString (بازدید کنندگان) .. : ]] ،  یا  ، ،  پایان
  تابع محلی globerr ( s ، l ) بازگشت globals [s] و globals [s] .. comment (s، l) یا  نه کشنده
    و  safestr ( انتخاب کنید ( 2 ، pcall (tostring، s))) یا  خطا ( " Can not serialize " .. tostring (s)) end
  محلی تابع safename ( مسیر ، نام و نام خانوادگی ) - تولید foo.bar، تولی [3]، و یا تولی [ 'BA R']
    محلی n = نام ==  nil  و  ' '  یا نام
    دشت محلی =  نوع (n) ==  " رشته "  و n: مسابقه ( " ^ [٪ l٪ u _] [٪ w _] * $ " ) و  نه کلمه کلیدی [n]
    ایمن محلی = ساده و n یا  ' [ ' .. safestr (n) .. ' ] '
    بازگشت (مسیر یا  ' ' ) .. (ساده و مسیر و  ' . '  یا  ' ' ) .. امن، پایان امن
  local alphanumsort =  type ( opt . sortkeys ) ==  ' function '  و انتخاب می کند. sortkeys  یا  function ( k ، o ، n ) - k = keys، o = originaltable، n = padding
    محلی maxn، به =  tonumber (N) و یا  12 ، {تعداد =  " ، ، رشته =  ' ب ' }
    تابع محلی padnum ( d ) بازگشت ( " ٪ 0 " .. rstring (maxn) .. " d " ): format ( tonumber (d)) end
    table.sort (k، تابع ( a ، b )
      - ابتدا کلید های عددی را مرتب کنید: کلید [K] برای کلیدهای عددی صفر نیست
      بازگشت (k [a] ~ =  nil  و  0  یا به [ نوع (a)] یا  ' z ' ) .. ( tostring (a): gsub ( " ٪ d + " ، padnum))
           < (k [b] ~ =  nil  و  0  یا به نوع (b)] یا  ' z ' ) .. ( tostring (b): gsub ( " ٪ d + " ، padnum)) end ) end
  محلی تابع val2str ( تی ، نام ، دندانه دار ، insref ، مسیر ، plainindex ، سطح )
    ttype محلی ، سطح، mt =  نوع (t)، (سطح یا  0 )، getmetatable (t)
    spath محلی ، sname =  safename (مسیر، نام)
    برچسب محلی = plainindex و
      (( نوع (نام) ==  " شماره " ) و  ' '  یا نام .. فضا .. ' = ' .. فضا) یا
      (نام ~ =  nil  و sname .. فضا .. ' = ' .. فضا یا  ' ' )
    اگر دیده [T] پس از آن  - در حال حا
    ضر دیده این عنصر
      sref [ # sref + 1 ] = spath .. فضا .. ' = ' .. فضا .. دیده شده [t]
      بازگشت برچسب .. ' nil ' .. comment ( ' ref ' ، level) end
    اگر  نوع (mt) ==  ' table '  و (mt. __serialize  یا mt. __tostring ) پس از آن  - می داند که چگونه خود را سریال کنید
      دیده شده [t] = insref یا spath
      اگر mt __Serialize  سپس t = mt. __serialize (T) دیگری تی =  متد toString (T) پایان
      ttype =  type (t) end  - مقدار جدید از بین می رود تا serialized شود
    اگر ttype ==  " table "  then
      اگر سطح > = maxl و سپس  برچسب را برگرداند .. ' {} ' .. نظر ( ' حداکثر ' ، سطح) پایان
      دیده شده [t] = insref یا spath
      اگر  بعد (t) ==  nil  سپس  برچسب را برگرداند .. ' {} ' .. comment (t، level) end  - table empty
      محلی maxn، ای، خارج =  math.min ( # T، maxnum یا  # T)، {}، {}
      برای کلید =  1 ، maxn do o [کلید] = پایان کلید
      اگر  نه maxnum یا  # o < maxnum پس از آن
        محلی n =  # o - n = n + 1؛ o [n] خیلی سریعتر از o [# o + 1] در جداول بزرگ است
        برای کلید در  جفت ها (t) انجام دهید  اگر o [کلید] ~ = کلید سپس n = n +  1 ؛ O [نفر] = کلیدی پایان  پایان  پایان
      اگر maxnum و  # o > maxnum و سپس o [maxnum + 1 ] =  پایان نیل 
      اگر انتخاب شود sorkeys  و  # o > maxn سپس  alphanumsort (o، t، opt، sortkeys ) end
      local sparse = sparse و  # o > maxn - غیرفعال کردن sparsness اگر فقط کلید های عددی (خروجی کوتاه تر)
      برای N، کلید در  ipairs (O) انجام
        محلی ارزش، ktype، plainindex = T [کلید]، نوع (کلید)، N <= maxn و  نه پراکنده
        اگر انتخاب شود valignore  و انتخاب می کند valignore [value] - ارزشهای نادیده گرفته شده را از بین ببرید ؛ انجام ندادن
        یا انتخاب می کند keyallow  و  انتخاب نیست keyallow [کلید]
        یا انتخاب می کند valtypeignore  و انتخاب می کند. valtypeignore [ type (value)] - صرفه جویی در انواع ارزش نادیده گرفته شده
        یا ضعیف و ارزش ==  نیل  پس از آن  - پرش نیل ؛ انجام ندادن
        elseif ktype ==  ' table '  یا ktype ==  ' function '  یا badtype [ktype] سپس
          اگر  نمی دیده می شود [کلید] و  نه GLOBALS [کلید] پس از آن
            sref [ # sref + 1 ] =  ' placeholder '
            sname محلی =  safename (iname، gensym (key)) - iname برای متغیرهای محلی جدول است
            sref [ # sref] =  val2str (key، sname، indent، sname، iname، true ) پایان
          sref [ # sref + 1 ] =  ' placeholder '
          [ مسیر] محلی = دیده شده [t] .. ' [ ' .. tostring (دیده می شود [کلید] یا globals [کلید] یا  gensym (کلید)) .. ' ] '
          sref [ # sref] = مسیر .. فضای .. ' = ' .. فضای .. tostring (دیده می شود [ارزش] یا  val2str (ارزش، صفر ، عقب ، مسیر))
        چیز دیگری
          خارج [ # out + 1 ] =  val2str (مقدار، کلید، indent، insref، دیده شده [t]، index plain، سطح + 1 )
        پایان
      پایان
      پیشوند محلی =  string.rep (indent یا  ' ' ، سطح)
      محلی head = indent و  ' { \ n ' .. پیشوند .. indent یا  ' { '
      محلی بدن =  table.concat (از، ، ، ، .. (تورفتگی و  ، است \ n " .. پیشوند .. تورفتگی یا فضا))
      محلی دم = تورفتگی و  " را \ n " .. پیشوند .. ، } ،  یا  ، } ،
      بازگشت (سفارشی و  سفارشی (برچسب، سر، بدن، دم) یا برچسب .. سر .. بدن .. دم) .. نظر (t، سطح)
    ELSEIF badtype [ttype] پس از آن
      دیده شده [t] = insref یا spath
      بازگشت برچسب .. globerr (t، سطح)
    elseif ttype ==  ' function '  سپس
      دیده شده [t] = insref یا spath
      محلی ok، res =  pcall (رشته. dump ، t)
      محلی func = ok و ((opts. nocode  و  " function () - [[..  skipped ..]] end " یا
        " ((loadstring یا بار) ( " .. safestr (res) .. " ، '@ serialized')) " ) .. نظر (t، سطح))
      بازگشت برچسب .. (func یا  globerr (t، سطح))
    دیگری  بازگشت تگ .. safestr (T) پایان  - مسئولیت رسیدگی به تمام انواع دیگر
  پایان
  local sepr = indent و  " \ n "  یا  " ؛ " .. فضای
  local body =  val2str (t، name، indent) - این تماس همچنین sref را پر می کند
  محلی دم =  # sref > 1  و  table.concat (sref، sepr) .. sepr یا  ، ،
  هشدار محلی = انتخاب می کند. نظر  و  # sref > 1  و فضای .. " - [[خروجی ناقص با به اشتراک گذاشته / خود مراجع قلم]] "  و یا  " "
  بازگشت  نیست نام و بدن .. هشدار می دهند و یا  " انجام محلی " .. بدن .. sepr .. دم .. " بازگشت " .. نا
  م .. sepr .. " پایان "
پایان

عملکرد محلی deserialize ( data ، opts )
  env = محلی (opts و opts. safe  ==  false ) و G
    یا  setmetatable ({}، {
        __index =  تابع ( تی ، K ) بازگشت تی پایان ،
        __call =  تابع ( t ، ...) خطا ( " نمی تواند توابع را فراخوانی کند " ) پایان
      })
  محلی f، res = (loadstring یا بار) ( ' return ' .. data، nil ، nil ، env)
  اگر  نمی ج پس از آن F، وضوح = (loadstring یا بار) (داده ها، صفر ، صفر ، پاکت) پایان
  اگر  نمی ج پس از آن  بازگشت F، RES پایان
  اگر setfenv then  setfenv (f، env) پایان
  بازگشت  pcall (f)
پایان

تابع محلی ادغام ( a ، b ) اگر b سپس  برای k، v در  جفت (b) انجام [k] = v end  end ؛ بازگشت A؛ پایان
بازگشت {_NAME = n، _COPYRIGHT = c، _DESCRIPTION = d، _VERSION  = v، serialize = s،
  بار = deserialize
  dump =  function ( a ، opts ) return  s (a، merge ({name =  ' _ ' ، compact =  true ، sparse =  true }، opts)) end ،
  line =  function ( a ، opts ) return  s (a، merge ({sortkeys =  true ، comment =  true }، opts)) end ،
  block =  function ( a ، opts ) return  s (a، merge ({indent =  '   ' ، sortkeys =  true ، comment =  true }، opts)) end }
