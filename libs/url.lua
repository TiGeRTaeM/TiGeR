￼
- [[
کپی رایت 2004-2007 دیگو ناب. 
به این ترتیب اجازه به طور رایگان به هر فردی داده می شود
گرفتن یک کپی از این نرم افزار و مستندات مربوطه
فایل ها ("نرم افزار")، برای مقابله با نرم افزار بدون
محدودیت، از جمله بدون محدودیت حق استفاده،
کپی، اصلاح، ادغام، انتشار، توزیع، صدور مجوز و / یا فروش
کپی از نرم افزار و اجازه دادن به افرادی که به آن
نرم افزار برای انجام این کار مبادرت به انجام موارد زیر می شود
شرایط:
اطلاعیه کپی رایت بالا و این اطلاعیه مجوز باید باشد
شامل تمام نسخه ها یا بخش های قابل توجهی از نرم افزار می باشد.
SOFTWARE "AS IS" ارائه شده است، بدون هیچ گونه ضمانتی
اظهارنظر یا تصریح شده، از جمله، اما نه محدود به ضمانت
از قابلیت خرید و فروش، مناسب بودن برای یک هدف خاص و
عدم تعهد در هیچ شرایطی نویسندگان و یا حق نسخهبرداری نیستند
دارنده مسئول هر گونه تقاضای، ضرر و زیان و یا دیگر مسئولیت،
آیا در قبال قرارداد، عقد یا سایر موارد، مواجه می شوید
از، خارج از یا در ارتباط با نرم افزار و یا استفاده یا
مشاغل دیگر در این نرم افزار.
]]
- ------------------------------------------------ ---------------------------
- تجزیه و تحلیل URI، ترکیب و نسبی آدرس URL
- ابزارک LuaSocket.
- نویسنده: دیگو ناب
- RCS ID: $ Id: url.lua، v 1.38 2006/04/03 04:45:42 diego exp $
- ------------------------------------------------ ---------------------------
    
    
- به روز شده برای یک ماژول () - دنیای آزاد از 5.3 توسط slack


محلی رشته =  نیاز ( " رشته " )
پایگاه محلی =  _G
جدول محلی =  نیاز ( " جدول " )

محلی Url = {}
آدرس _VERSION  =  " URL 1.0.2 "

عملکرد Url.escape ( بازدید کنندگان )
    بازگشت  string.gsub (s، " ([^ A-Za-z0-9_]) " ، عملکرد ( c )
        بازگشت  string.format ( " 02X ٪٪٪ " ، string.byte (ج))
    پایان )
پایان

تابع محلی make_set ( t )
 محلی s = {}
 برای من، در پایه ipairs (t) انجام دهید
  s [t [i]] =  1
 پایان
 بازگشت s
پایان

local segment_set =  make_set {
    " - " ، " _ " ، " . " ، " ! " ، " ~ " ، " * " ، " ، " ، " ( " ،
 " ) " ، " : " ، " @ " ، " & " ، " = " ، " + " ، " $ " ، " ، " ،
}

تابع محلی protect_segment ( s )
 بازگشت  string.gsub (s، " ([^ A-Za-z0-9_]) " ، تابع ( c )
  اگر segment_set [c] سپس  c را برگرداند
  دیگری  بازگشت  string.format ( " 02X ٪٪٪ " ، string.byte (ج)) پایان
 پایان )
پایان

عملکرد Url.unescape ( بازدید کنندگان )
    return  string.gsub (s، " ٪٪ (٪ x٪ x) " ، function ( hex )
        بازگشت  string.char (پایه tonumber (hex، 16 ))
    پایان )
پایان

عملکرد محلی absolute_path ( base_path ، relative_path )
    if string.sub(relative_path, 1, 1) == "/" then return relative_path end
    local path = string.gsub(base_path, "[^/]*$", "")
    path = path .. relative_path
    path = string.gsub(path, "([^/]*%./)", function (s)
        if s ~= "./" then return s else return "" end
    end)
    path = string.gsub(path, "/%.$", "/")
    local reduced
    while reduced ~= path do
        reduced = path
        path = string.gsub(reduced, "([^/]*/%.%./)", function (s)
            if s ~= "../../" then return "" else return s end
        end)
    end
    path = string.gsub(reduced, "([^/]*/%.%.)$", function (s)
        if s ~= "../.." then return "" else return s end
    end)
    return path
end


-----------------------------------------------------------------------------
-- Parses a url and returns a table with all its parts according to RFC 2396
-- The following grammar describes the names given to the URL parts
-- <url> ::= <scheme>://<authority>/<path>;<params>?<query>#<fragment>
-- <authority> ::= <userinfo>@<host>:<port>
-- <userinfo> ::= <user>[:<password>]
-- <path> :: = {<segment>/}<segment>
-- Input
--   url: uniform resource locator of request
--   default: table with default values for each field
-- Returns
--   table with the following fields, where RFC naming conventions have
--   been preserved:
--     scheme, authority, userinfo, user, password, host, port,
--     path, params, query, fragment
-- Obs:
--   the leading '/' in {/<path>} is considered part of <path>
-----------------------------------------------------------------------------
function Url.parse(url, default)
    -- initialize default parameters
    local parsed = {}
    fo
    r i,v in base.pairs(default or parsed) do parsed[i] = v end
    -- empty url is parsed to nil
    if not url or url == "" then return nil, "invalid url" end
    -- remove whitespace
    -- url = string.gsub(url, "%s", "")
    -- get fragment
    url = string.gsub(url, "#(.*)$", function(f)
        parsed.fragment = f
        return ""
    end)
    -- get scheme
    url = string.gsub(url, "^([%w][%w%+%-%.]*)%:",
        function(s) parsed.scheme = s; return "" end)
    -- get authority
    url = string.gsub(url, "^//([^/]*)", function(n)
        parsed.authority = n
        return ""
    end)
    -- get query stringing
    url = string.gsub(url, "%?(.*)", function(q)
        parsed.query = q
        return ""
    end)
    -- get params
    url = string.gsub(url, "%;(.*)", function(p)
        parsed.params = p
        return ""
    end)
    -- path is whatever was left
    اگر آدرس ~ =  " "  و سپس تجزیه و تحلیل شده است. مسیر  = پایان URL
    مقام محلی = تجزیه شده. قدرت
    اگر  نمی اقتدار سپس  بازگشت تجزیه پایان
    authority =  string.gsub (authority، " ^ ([^ @] *) @ " ،
        تابع ( u ) تجزیه شد userinfo  = u؛ بازگشت  " "  پایان )
    authority =  string.gsub (authority، " : ([^:] *) $ " ،
        تابع ( p ) تجزیه شده است. بند  = P؛ بازگشت  " "  پایان )
    اگر مجوز ~ =  " "  پس از تجزیه و تحلیل. میزبان  = مجوز پایان
    userinfo = محلی تجزیه می شود اطلاعات کاربر
    اگر  نمی userinfo سپس  بازگشت تجزیه پایان
    userinfo =  string.gsub (userinfo، " : ([^:] *) $ " ،
        تابع ( p ) تجزیه شده است. password  = p؛ بازگشت  " "  پایان )
تجزیه شده user  = userinfo
    بازگشتی تجزیه شد
پایان

- ------------------------------------------------ ---------------------------
- یک URL تجزیه شده را از اجزای آن بازسازی می کند.
- اگر شخصیت های ذخیره شده یا غیرمجاز یافت می شوند، اجزاء محافظت می شوند
- ورودی
-    تجزیه شده: پارس URL، همانطور که توسط تجزیه و تحلیل بازگشته است
- بازگشت
-    یک رشته با URL مربوطه
- ------------------------------------------------ ---------------------------
عملکرد Url.build ( تجزیه و تحلیل شده )
    محلی ppath = آدرس parse_path ( parsed path  یا  " " )
    آدرس محلی = آدرس build_path (ppath)
    اگر تجزیه شود params  سپس url = url ..  " ؛ "  .. تجزیه شده. پارامترهای  پایان
    اگر تجزیه شود query  سپس url = url ..  " ؟ "  .. تجزیه شد پایان پرس و جو 
 مقام محلی = تجزیه شده. قدرت
 اگر تجزیه شود میزبان  پس از آن
  authority = تجزیه شده میزبان
  اگر تجزیه شود پورت  پس authority = authority ..  " : "  .. تجزیه شد پایان پورت 
  userinfo = محلی تجزیه می شود اطلاعات کاربر
  اگر تجزیه شود کاربر  پس از آن
   userinfo = تجزیه شده کاربر
   اگر تجزیه شود رمز عبور  پس از آن
    userinfo = userinfo ..  " : "  .. تجزیه شد کلمه عبور
   پایان
  پایان
  اگر userinfo then authority = userinfo ..  " @ "  .. authority end
 پایان
    اگر authority then url =  " // "  .. authority .. end url
    اگر تجزیه شود برنامه  سپس url = parsed. طرح  ..  " : "  .. آدرس پایان
    اگر تجزیه شود قطعه  سپس url = url ..  " # "  .. تجزیه شد پایان قطعه 
    - url = string.gsub (آدرس، "٪ s"، "")
    آدرس برگشت
پایان

- یک URL مطلق را از یک پایگاه و یک URL مربوطه مطابق با RFC 2396 ایجاد می کند
تابع Url.absolute ( BASE_URL ، relative_url )
    اگر پایه type (base_url) ==  " table "  سپس
        base_parsed = BASE_URL
        base_url = Url.build(base_parsed)
    else
        base_parsed = Url.parse(base_url)
    end
    local relative_parsed = Url.parse(relative_url)
    if not base_parsed then return relative_url
    elseif not relative_parsed then return base_url
    elseif relative_parsed.scheme then return relative_url
    else
        relative_parsed.scheme = base_parsed.scheme
        if not relative_parsed.authority then
            relative_parsed.authority = base_parsed.authority
            if not relative_parsed.path then
                relative_parsed.path = base_parsed.path
                if not relative_parsed.params then
                    relative_parsed.params = base_parsed.params
                    if not relative_parsed.query then
                        relative_parsed.query = base_parsed.query
                    end
                    end
            else    
                relative_parsed.path = absolute_path(base_parsed.path or "",
                    relative_parsed.path)
            end
        end
        return Url.build(relative_parsed)
    end
end

-- Breaks a path into its segments, unescaping the segments
function Url.parse_path(path)
 local parsed = {}
 path = path or ""
 --path = string.gsub(path, "%s", "")
 string.gsub(path, "([^/]+)", function (s) table.insert(parsed, s) end)
 for i = 1, #parsed do
  parsed[i] = Url.unescape(parsed[i])
 end
 if string.sub(path, 1, 1) == "/" then parsed.is_absolute = 1 end
 اگر  string.sub (مسیر، - 1 ، - 1 ) ==  " / "  سپس تجزیه می شود. is_directory  =  1  پایان است
 بازگشتی تجزیه شد
پایان

- کامپوننت مسیر را از بخش های آن ساخته و از کاراکترهای محافظت شده جلوگیری می کند.
عملکرد Url.build_path ( تجزیه و تحلیل ، ناامن )
 مسیر محلی =  " "
 محلی n =  # تجزیه
 اگر ناامن باشد
  برای i =  1 ، n - 1  انجام می شود
   path = path ... parsed [i]
   مسیر = راه ..  " / "
  پایان
  اگر n >  0  آنگاه
   path = path .. parsed [n]
   اگر تجزیه شود is_directory  سپس path = مسیر ..  " / "  پایان
  پایان
 چیز دیگری
  برای i =  1 ، n - 1  انجام می شود
   path = path ..  protect_segment ( parsed [i])
   مسیر = راه ..  " / "
  پایان
  اگر n >  0  آنگاه
   path = path ..  protect_segment ( parsed [n])
   اگر تجزیه شود is_directory  سپس path = مسیر ..  " / "  پایان
  پایان
 پایان
 اگر تجزیه شود is_absolute  پس مسیر =  " / "  .. پایان مسیر
 مسیر بازگشت
پایان

آدرس برگشت
