￼
difftime محلی ، زمان، تاریخ = است . difftime ، os. زمان ، اس. تاریخ
فرمت محلی = رشته فرمت
لرزش محلی ، tinsert = جدول. حذف میز قرار دادن
pcall محلی ، جفت، ipairs، tostring، تونumber، نوع، setmetatable = pcall، جفت، ipairs، tostring، تونumber، نوع، setmetatable

local dateparser = {}

- ما باید از امکانات میزبانی OS برای تبدیل زمان استفاده کنیم. برخورد با این همه جهش در ثانیه با دست می تواند چنین خمیده ای باشد.
Unix_timestamp محلی
انجام دادن
 local now =  زمان ()
 محلی local_UTC_offset_sec =  difftime ( زمان ( تاریخ ( " ! * t " ، در حال حاضر))، زمان ( تاریخ ( " * t " ، در حال حاضر)))
 unix_timestamp =  function ( t ، offset_sec )
  موفقیت محلی ، نامعتبر =  زمانبندی (زمان، t)
  اگر  نمی موفقیت یا  نه improper_time سپس  بازگشت  صفر ، " تاریخ نامعتبر os.time می گوید: "  .. (improper_time یا  " هیچ چیز " ) پایان
  بازگشت improper_time - local_UTC_offset_sec - offset_sec
 پایان
پایان

فرمت های محلی = {} - نام فرمت ها
local format_func =  setmetatable ({}، {__mode = ' v ' })   - توابع فرمت

- - ثبت یک فرمت تاریخ تجزیه و تحلیل عملکرد
function dateparser.register_format ( format_name ، format_function )
 اگر  نوع (format_name) ~ = " رشته "  یا  نوع (format_function) ~ = " تابع ،  پس از آن  بازگشت  صفر ، " استدلال نادرست، می توانید فرمت کنترل ثبت نام کنید "  پایان

 محلی یافت شده است
 برای i، f در  ipairs (format_func) انجام می شود  - برای سفارش
  اگر f == format_function پس از آن
   یافت = درست است
   زنگ تفريح
  پایان
 پایان
 اگر  نمی یافت پس از آن
  tinsert (format_func، format_function)
 پایان
 فرمت [format_name] = format_function
 بازگشت  درست است
پایان

- - ثبت یک فرمت تاریخ تجزیه و تحلیل عملکرد
function dateparser.unregister_format ( format_name )
 اگر  نوع (format_name) ~ = " رشته "  پس از آن  بازگشت  صفر ، " نام و نام خانوادگی فرمت باید یک رشته باشد "  پایان
 فرمت [format_name] = nil
پایان

- - تابع مسئول بازگرداندن رشته format_name را بازگرداند
function dateparser.get_format_function ( format_name )
 فرمت های بازگشتی [format_name] یا  nil ( " format٪ s not registered " ): format (format_name)
پایان

- تلاش برای تجزیه رشته تاریخ
- رشتهparam تاریخ STR
- param DATE_FORMAT اختیاری نام فرمت تاریخ، اگر شناخته شده
- زمان بازگردانی یونیکس اگر str را می توان تجزیه کرد؛ نزولی، خطا در غیر این صورت.
function dateparser.parse ( str ، date_format )
 موفقیت محلی ، res، err
 اگر date_format سپس 
  اگر  نمی فرمت [DATE_FORMAT] سپس  بازگشت  ، فرمت تاریخ ناشناخته: «  ..  متد toString (DATE_FORMAT) پایان
  موفقیت، res =  pcall (فرمت [date_format]، str)
 چیز دیگری
  برای من، func در  ipairs (format_func) انجام می شود
   موفقیت، res =  pcall (func، str)
   اگر موفقیت و وضوح سپس  بازگشت وضوح پایان
  پایان
 پایان
 موفقیت و رفع بازگشت
پایان

dateparser register_format ( ' W3CDTF ' ، عملکرد ( استراحت )

 سال محلی ، روز روز_ماه، ماه، روز، هفته
 ساعت محلی ، دقیقه، ثانیه، ثانیه دوم، offset_hours

 alt_rest محلی

 سال، استراحت = استراحت: مسابقه ( " ^ (٪ d٪ d٪ d٪ d)٪ - ((*) $ " )

 day_of_year، alt_rest = استراحت: مسابقه ( " ^ (٪ d٪ d٪ d)٪ - ((*) $ " )

 اگر day_of_year then rest = end alt_rest

 ماه، استراحت = استراحت: مسابقه ( " ^ (٪ d٪ d)٪ -؟ (. *) $ " )

 روز، استراحت = استراحت: مسابقه ( " ^ (٪ d٪ d) (. *) $ " )
 اگر  # استراحت > 0  سپس
  استراحت = استراحت: مطابقت ( " ^ T (. *) $ " )
  ساعت، بقیه = بقیه: بازی ( " ^ ([0-2] [0-9]):. (*) $ " )
  دقیقه، استراحت = استراحت: مسابقه ( " ^ ((0-6] [0-9]): ((*) $ " )
  دوم، استراحت = استراحت: مسابقه ( " ^ ((0-6] [0-9]) (. *) $ " )
  second_fraction، alt_rest = استراحت: مسابقه ( " ^٪. (٪ d +) (. *) $ " )
  اگر second_fraction سپس 
   استراحت = alt_rest
  پایان
  اگر بقیه == " Z "  سپس 
   استراحت = " "
   offset_hours = 0
  چیز دیگری
   نشانه محلی ، offset_h، offset_m
   sign (offset_h)، rest = rest: match ( " ^ ((+ -]) (٪ d٪ d)٪: ((*) $ " )
   local offset_m، alt_rest = استراحت: بازی ( " ^ (٪ d٪ d) (. *) $ " )
   اگر offset_m then rest = end alt_rest
   offset_hours =  tonumber (علامت .. offset_h) + ( tonumber (offset_m) یا  0 ) / 60
  پایان
  اگر  # بقیه > 0  پس از آن  بازگشت  صفر  پایان
 پایان

 year =  tonumber (سال)
 محلی d = {
  سال =
  سال و (سال >  100  و سال و یا (سال <  50  و (سال +  2000 ) و یا (سال +  1900 )))،
  month =  tonumber (month) یا  1 ،
  day =  tonumber (روز) یا  1 ،
  ساعت =  tonumber (ساعت) یا  0 ،
  min =  tonumber (دقیقه) یا  0 ،
  sec =  tonumber (دوم) یا  0 ،
  isdst =  اشتباه است
 }
 محلی t =  unix_timestamp (d، (offset_hours یا  0 ) *  3600 )
 اگر second_fraction سپس
  بازگشت t +  tonumber ( " 0. " .. second_fraction)
 چیز دیگری
  بازگشت t
 پایان
پایان )


انجام دادن
 local tz_table = { --taken from http://www.timeanddate.com/library/abbreviations/timezones/
  A = 1,  B = 2, C = 3, D = 4,  E=5, F = 6, G = 7, H = 8, I = 9, 
  K = 10, L = 11, M = 12, N = -1, O = -2, P = -3, Q = -4, R = -5, 
  S = -6, T = -7, U = -8, V = -9, W = -10, X = -11, Y = -12, 
  Z = 0,

  EST =  - 5 ، EDT =  - 4 ، CST =  - 6 ، CDT =  - 5 ،
  MST =  - 7 ، MDT =  - 6 ، PST =  - 8 ، PDT =  - 7 ، 

  GMT =  0 ، UT =  0 ، UTC =  0
 }

 محلی ماه_val = {Jan = 1 ، Feb = 2 ، Mar = 3 ، Apr = 4 ، May = 5 ، Jun = 6 ، Jul = 7 ، Aug = 8 ، Sep = 9 ، Oct = 10 ، Nov = 11 ، Dec. = 12 }

dateparser register_format ( ' RFC2822 ' ، عملکرد ( استراحت )

  سال محلی ، ماه، روز، روز روز_فرهنگ، هفته_فریح، روز هفته
  ساعت محلی ، دقیقه، ثانیه، ثانیه دوم، offset_hours

  alt_rest محلی

  روز هفته، alt_rest = استراحت: مسابقه ( " ^ (٪ w٪ w٪ w)،٪ s + (. *) $ " )
  اگر روز هفتگی باشد، استراحت کنید = alt_rest end
  روز، استراحت = استراحت: مسابقه ( " ^ (٪ d٪ d؟)٪ s + (. *) $ " )
  ماه، استراحت = استراحت: مسابقه ( " ^ (٪ w٪ w٪ w)٪ s + (. *) $ " )
  month = month_val [month]
  سال، استراحت = استراحت: بازی ( " ^ (٪ d٪ d٪ d؟٪ d؟)٪ s + (. *) $ " )
  ساعت، استراحت = استراحت: مسابقه ( " ^ (٪ d٪ d؟): (. *) $ " )
  دقیقه، استراحت = استراحت: مسابقه ( " ^ (٪ d٪ d؟) (. *) $ " )
  دوم، alt_rest = استراحت: مسابقه ( " ^: (٪ d٪ d) (. *) $ " )
  اگر بعد دوم استراحت کنید = alt_rest end
  tz محلی ، offset_sign، offset_h، offset_m
  tz alt_rest = استراحت: مسابقه ( " ^٪ s + (٪ u +) (. *) $ " )
  اگر tz سپس
   استراحت = alt_rest
   offset_hours = tz_table [tz]
  چیز دیگری
   offset_sign offset_h offset_m rest = rest: match ( " ^٪ s + ((+ -]) (٪ d٪ d) (٪ d٪ d)٪ s * (. *) $ " )
   offset_hours =  tonumber (offset_sign .. offset_h) + ( tonumber (offset_m) یا  0 ) / 60
  پایان

  اگر  # استراحت > 0  یا  نه (سال و روز و ماه و ساعت و دقیقه) پس از آن 
   بازگشت  نزولی 
  پایان

  year =  tonumber (سال)
  محلی d = {
   سال = سال و (سال >  100 ) و سال یا سال (سال <  50  و (سال +  2000 ) یا (سال +  1900 )))
   ماه = ماه
   day =  tonumber (روز)،

   ساعت =  tonumber (ساعت) یا  0 ،
   min =  tonumber (دقیقه) یا  0 ،
   sec =  tonumber (دوم) یا  0 ،
   isdst   =  اشتباه است
  } 
  بازگشت  unix_timestamp (d، offset_hours *  3600 )
 پایان )
پایان

dateparser register_format ( ' RFC822 ' ، فرمت های RFC2822 ) - 2822 supercedes 822، اما سوپرست قوی نیست. برای اهداف و اهداف ما هر چند، این کاملا به اندازه کافی خوب است
dateparser register_format ( ' RFC3339 ' ، فرمت های W3CDTF ) - RFC3339 یک زیر مجموعه از W3CDTF است


بازگشت dateparser
