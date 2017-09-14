
￼
local redis = {
    _VERSION     = 'redis-lua 2.0.4',
    _DESCRIPTION = 'A Lua client library for the redis key value storage system.',
    _COPYRIGHT   = 'Copyright (C) 2009-2012 Daniele Alessandri',
}

-- The following line is used for backwards compatibility in order to keep the Redis
-- global module name. Using Redis is now deprecated so you should explicitly assign
-- the module to a local variable when requiring it: local redis = require('redis').
Redis = redis

local unpack = _G.unpack or table.unpack
local network, request, response = {}, {}, {}

local defaults = {
    host        = '127.0.0.1',
    port        = 6379,
    tcp_nodelay = true,
    path        = nil
}

local function merge_defaults(parameters)
    if parameters == nil then
        parameters = {}
    end
    for k, v in pairs(defaults) do
        if parameters[k] == nil then
            parameters[k] = defaults[k]
        end
    end
    return parameters
end

local function parse_boolean(v)
    if v == '1' or v == 'true' or v == 'TRUE' then
        return true
    elseif v == '0' or v == 'false' or v == 'FALSE' then
        return false
    else
        return nil
    end
end

local function toboolean(value) return value == 1 end

local function sort_request(client, command, key, params)
    --[[ params = {
        by    = 'weight_*',
        get   = 'object_*',
        limit = { 0, 10 },
        sort  = 'desc',
        alpha = true,
    } ]]
    local query = { key }

    if params then
        if params.by then
            table.insert(query, 'BY')
            table.insert(query, params.by)
        end

        if type(params.limit) == 'table' then
            -- TODO: check for lower and upper limits
            table.insert(query, 'LIMIT')
            table.insert(query, params.limit[1])
            table.insert(query, params.limit[2])
        end

        if params.get then
            if (type(params.get) == 'table') then
                برای _، getarg در  جفت (params دریافت کنید ) انجام دهید
                    table.insert (پرس و جو، ' GET ' )
                    table.insert (query، getarg)
                پایان
            چیز دیگری
                table.insert (پرس و جو، ' GET ' )
                table.insert (query، params دریافت کنید )
            پایان
        پایان

        اگر پارامز سپس مرتب کن 
            table.insert (query، params مرتب کردن بر اساس )
        پایان

        اگر پارامز آلفا  ==  درست  پس از آن
            table.insert (پرس و جو، ، ALPHA ، )
        پایان

        اگر پارامز سپس ذخیره کنید 
            table.insert (پرس و جو، ، فروشگاه ، )
            table.insert (پرس و جو، پارامترهای فروشگاه )
        پایان
    پایان

    درخواست. multibulk (مشتری، فرمان، پرس و جو)
پایان

تابع محلی zset_range_request ( client ، command ، ...)
    args محلی ، opts = { ... }، {}

    اگر  # args > =  1  و  type (args [ # args]) ==  ' table '  then
        گزینه های محلی =  table.remove (args، # args)
        اگر گزینه ها withscores  سپس
            table.insert (انتخاب، ' WITHSCORES ' )
        پایان
    پایان

    برای _، v در  جفت (opts) do  table.insert (args، v) end
    درخواست. multibulk (client، command، args)
پایان

تابع محلی zset_range_byscore_request ( client ، command ، ...)
    args محلی ، opts = { ... }، {}

    اگر  # args > =  1  و  type (args [ # args]) ==  ' table '  then
        گزینه های محلی =  table.remove (args، # args)
        اگر گزینه ها محدود کردن  پس از آن
            table.insert (موارد برگزیده، ، LIMIT : )
            table.insert (مردد، گزینه. حد . جبران  و یا گزینه. محدود کردن [ 1 ])
            table.insert (مردد، گزینه. حد . شمارش  و یا گزینه. محدود [ 2 ])
        پایان
        اگر گزینه ها withscores  سپس
            table.insert (انتخاب، ' WITHSCORES ' )
        پایان
    پایان

    برای _، v در  جفت (opts) do  table.insert (args، v) end
    درخواست. multibulk (client، command، args)
پایان

تابع محلی zset_range_reply ( پاسخ ، دستور ، ...)
    args محلی = { ... }
    محلی opts = args [ 4 ]
    اگر گزینه ها را انتخاب می کند و (
    نتیجه گیری می کند. scores  یا  string.lower ( tostring (opts) ==  ' scores ' ) سپس
        محلی new_reply = {}
        برای i =  1 ، # پاسخ، 2  انجام می شود
            table.insert (new_reply، {reply [i]، پاسخ [i +  1 ]})
        پایان
        بازگشت new_reply
    چیز دیگری
        بازگشت پاسخ
    پایان
پایان

تابع محلی zset_store_request ( client ، command ، ...)
    args محلی ، opts = { ... }، {}

    اگر  # args > =  1  و  type (args [ # args]) ==  ' table '  then
        گزینه های محلی =  table.remove (args، # args)
        اگر گزینه ها وزن  و  نوع (گزینه ها. وزن ها ) ==  ' جدول '  سپس
            table.insert (موارد برگزیده، ، وزن ، )
            برای _ وزن در  ipairs (گزینه های وزن ) انجام دهید
                table.insert (انتخاب، وزن)
            پایان
        پایان
        اگر گزینه ها جمع آوری  سپس
            table.insert (انتخاب، ' AGGREGATE ' )
            table.insert (opts، options. aggregate )
        پایان
    پایان

    برای _، v در  جفت (opts) do  table.insert (args، v) end
    درخواست. multibulk (client، command، args)
پایان

تابع محلی mset_filter_args ( client ، command ، ...)
    args محلی ، arguments = { ... }، {}
    اگر ( # args ==  1  و  type (args [ 1 ]) ==  ' table ' ) پس از آن
        برای k، v در  جفت (args [ 1 ]) انجام دهید
            table.insert (arguments، k)
            table.insert (arguments، v)
        پایان
    چیز دیگری
        arguments = args
    پایان
    درخواست. multibulk (مشتری، دستور، استدلال)
پایان

تابع محلی hash_multi_request_builder ( builder_callback )
     تابع بازگشتی ( client ، command ، ...)
        args محلی ، arguments = { ... }، {}
        اگر  # args ==  2  پس از آن
            table.insert (arguments، args [ 1 ])
            برای k، v در  جفت (args [ 2 ]) انجام دهید
                builder_callback (arguments، k، v)
            پایان
        چیز دیگری
            arguments = args
        پایان
        درخواست. multibulk (مشتری، دستور، استدلال)
    پایان
پایان

تابع محلی parse_info ( پاسخ )
    اطلاعات محلی = {}
    محلی فعلی = اطلاعات

    پاسخ: gsub ( ' ([^ \ r \ n ] *) \ r \ n ' ، تابع ( kv )
        اگر kv ==  ' '  سپس  بازگشت به  پایان می رسد

        بخش محلی = kv: match ( ' ^ # (٪ w +) $ ' )
        اگر بخش بعد
            current = {}
            info [بخش: lower ()] = current
            برگشت
        پایان

        محلی k، v = kv: match (( ' ([^:] *): ([^:] *) ' ): rep ( 1 ))
        اگر k: match ( ' db٪ d + ' ) سپس
            فعلی [k] = {}
            v: gsub ( ' ، ' ، function ( dbkv )
                dbk محلی ، dbv = kv: match ( ' ([^:] *) = ([^:] *) ' )
                فعلی [k] [dbk] = dbv
            پایان )
        چیز دیگری
            فعلی [k] = v
        پایان
    پایان )

    اطلاعات برگشت
پایان

تابع محلی load_methods ( پروتکل ، دستورات )
    مشتری محلی =  setmetatable ({}، getmetatable (پروتو))

    برای cmd، fn در  جفت ها (دستورات) انجام می شود
        اگر  نوع (fn) ~ =  ' function '  باشد ، سپس
قرمز خطا ( ' نامعتبر برای دستور '  .. cmd ..  ' (باید یک تابع باشد) ' )
        پایان
        client [cmd] = fn
    پایان

    برای من، v در  جفت (proto) انجام دهید
        مشتری [i] = v
    پایان

    مشتری برگشت
پایان

تابع محلی create_client ( proto ، client_socket ، دستورات )
    محلی client =  load_methods (پروتکل، دستورات)
    مشتری. خطا  = قرمز خطا
    مشتری. network  = {
        socket = client_socket
        خواندن    = شبکه به عنوان خوانده شده ،
        نوشتن   = شبکه ارسال ،
    }
    مشتری. requests  = {
        multibulk = درخواست multibulk ،
    }
    مشتری برگشت
پایان

- ################################################ ############################

تابع network.write ( مشتری ، بافر )
    محلی _، err = مشتری. شبکه . سوکت : ارسال (بافر)
    اگر اشتباه است پس مشتری. خطا (اشتباه) پایان
پایان

تابع network.read ( client ، len )
    اگر len ==  nil،  then len =  ' * l '  end
    خط محلی ، err = client. شبکه . سوکت : دریافت (len)
    اگر  نه اشتباه است و سپس  بازگشت خط دیگر مشتری. خطا ( ' خطای اتصال: '  .. err) پایان
پایان

- ################################################ ############################

عملکرد response.read ( مشتری )
loadload محلی = مشتری. شبکه . خواندن (مشتری)
    پیشوند محلی ، data = payload: sub ( 1 ، - # payload)، payload: sub ( 2 )

    - پاسخ وضعیت
    اگر پیشوند ==  ' + '  سپس
        اگر داده ها ==  ' OK '  پس از آن
            بازگشت  درست است
        elseif data ==  ' QUEUED '  سپس
            return {queued =  true }
        چیز دیگری
            داده های بازگشت
        پایان

   - پاسخ خطا
    prefix elseif ==  ' - '  سپس
        مشتری برگشت خطا ( ' خطای redis: '  .. داده ها)

   - پاسخ صحیح
    prefix elseif ==  ' : '  سپس
        محلی تعداد =  tonumber (داده)

        اگر  نه شماره پس از آن
            اگر res ==  ' nil '  پس از آن
                بازگشت  نزولی
            پایان
            مشتری. خطا ( ' نمی تواند تجزیه ' .. res .. ' به عنوان یک پاسخ عددی. ' )
        پایان

        شماره بازگشت

   - پاسخ فله
    elsef prefix ==  ' $ '  سپس
        طول محلی =  تونumber (data)

        اگر  نه طول و سپس
            مشتری. خطا ( ' نمی تواند تجزیه '  .. طول ..  ' به عنوان طول داده ها ' )
        پایان

        اگر طول ==  - 1  سپس
            بازگشت  نزولی
        پایان

        محلی nextchunk = مشتری. شبکه . خواندن (مشتری، طول +  2 )

        بازگشت nextchunk: sub ( 1 ، - 3 )

   - پاسخ چندگانه
    elsef prefix ==  ' * '  سپس
        local count =  tonumber (داده ها)

        اگر تعداد ==  - 1  پس از آن
            بازگشت  نزولی
        پایان

        لیست محلی = {}
        اگر تعداد >  0 باشد،  سپس
            خواننده محلی = پاسخ. خواندن
            برای من =  1 ، تعداد انجام دهید
                لیست [i] =  خواننده (مشتری)
            پایان
        پایان
        لیست بازگشت

   - نوع ناشناخته پاسخ
    چیز دیگری
        مشتری برگشت خطا ( ، ناشناخته پیشوند پاسخ: :  .. پیشوند)
    پایان
پایان

- ################################################ ############################

function request.raw ( client ، buffer )
    محلی bufferType =  نوع (بافر)

    اگر bufferType ==  ' table '  then
        مشتری. شبکه . نوشتن (client، table.concat (buffer))
    elseif bufferType ==  ' string '  پس از آن
        مشتری. شبکه . نوشتن (مشتری، بافر)
    چیز دیگری
        مشتری. خطا ( ' argument argument: '  .. bufferType)
    پایان
پایان

function request.multibulk ( client ، command ، ...)
    args محلی = { ... }
    محلی argsn =  # استدلال
    بافر محلی = { درست ، درست }

    اگر argsn ==  1  و  type (args [ 1 ]) ==  ' table '  then
        argsn، args =  # args [ 1 ]، args [ 1 ]
    پایان

    بافر [ 1 ] =  ' * '  ..  tostring (argsn +  1 ) ..  " \ r \ n "
    بافر [ 2 ] =  ' $ '  ..  # دستور ..  " \ r \ n "  .. دستور ..  " \ r \ n "

    table_insert = جدول جدول محلی قرار دادن
    برای _، بحث در  جفت (args) انجام می شود
        s_argument محلی =  tostring (argument)
        table_insert (بافر، ، $ ،  ..  # s_argument ..  " \ r \ n و "  .. s_argument ..  " \ r \ n و " )
    پایان

    مشتری. شبکه . نوشتن (client، table.concat (buffer))
پایان

- ################################################ ############################

تابع محلی سفارشی ( فرمان ، ارسال ، تجزیه )
    command =  string.upper (فرمان)
     تابع بازگشت ( مشتری ، ...)
        ارسال (مشتری، فرمان، ... )
        پاسخ محلی = پاسخ خواندن (مشتری)

        اگر  نوع (پاسخ) ==  ' جدول '  و پاسخ. صفوف  سپس
            پاسخ. تجزیه  = تجزیه
            بازگشت پاسخ
        چیز دیگری
            اگر بعدا تجزیه شود
                 تجزیه بازگشت (پاسخ، فرمان، ... )
            پایان
            بازگشت پاسخ
        پایان
    پایان
پایان

محلی تابع فرمان ( فرمان ، مردد )
    اگر opts ==  nil  یا  type (opts) ==  ' function '  then
         سفارشی بازگشت (فرمان، درخواست چندگانه ، انتخاب می کند)
    چیز دیگری
        بازگشت به صورت  سفارشی (فرمان، انتخاب درخواست  یا درخواست ، چندگانه ، گزینه پاسخ )
    پایان
پایان

local define_command_impl =  function ( هدف ، نام ، انتخاب )
    محلی opts = opts یا {}
    target [ string.lower (name)] =  custom (
انتخاب می کند فرمان  یا  string.upper (نام)
انتخاب می کند درخواست  یا درخواست multibulk ،
انتخاب می کند پاسخ  یا  نزولی
    )
پایان

محلی undefine_command_impl =  تابع ( هدف ، نام )
    هدف [ string.lower (name)] =  nil
پایان

- ###################
############################# ############################

local client_prototype = {}

client_prototype raw_cmd  =  تابع ( client ، buffer )
    درخواست. خام (مشتری، بافر ..  " \ r \ n " )
    پاسخ بازگشت خواندن (مشتری)
پایان

- منسوخ شده
client_prototype define_command  =  تابع ( client ، name ، opts )
    define_command_impl (client، name، opts)
پایان

- منسوخ شده
client_prototype undefine_command  =  تابع ( client ، name )
    undefine_command_impl (مشتری، نام)
پایان

client_prototype quit  =  function ( client )
    درخواست. چندگانه (مشتری، ' QUIT ' )
    مشتری. شبکه . سوکت : خاموش ()
    بازگشت  درست است
پایان

client_prototype shutdown  =  function ( client )
    درخواست. چندگانه (مشتری، ' SHUTDOWN ' )
    مشتری. شبکه . سوکت : خاموش ()
پایان

- دستورالعمل خط لوله

client_prototype خط لوله  =  عملکرد ( مشتری ، بلوک )
    درخواست های محلی ، پاسخ ها، تجزیه کننده ها = {}، {}، {}
    table_insert = جدول جدول محلی قرار دادن
    socket_write محلی ، socket_read = client. شبکه . نوشتن ، مشتری شبکه . خواندن

    مشتری. شبکه . write  =  function ( _ ، buffer )
        table_insert (درخواست، بافر)
    پایان

    - TODO: این هک لازم است تا به صورت موقت استفاده مجدد از جریان
    -        درخواست -> پاسخ دست زدن پیاده سازی redis-lua
    -        بدون تغییر بیشتر در کد، اما قطعا آن را
    -        ناپدید می شوند که زیرساخت فرمان تعریف جدید
    -        در نهایت در جای خود قرار خواهد گرفت.
    مشتری. شبکه . read  =  function () بازگشت  ' + QUEUED '  پایان

    خط لوله محلی =  setmetatable ({}، {
        __index =  function ( env ، name )
            local cmd = client [name]
            اگر  نه CMD پس از آن
                مشتری. خطا ( ' فرمان ناشناخته redis: '  .. نام، 2 )
            پایان
             عملکرد بازگشت ( خود ، ...)
                پاسخ محلی =  cmd (مشتری، ... )
                table_insert (تجزیه کننده، # درخواست، پاسخ. parser )
                بازگشت پاسخ
            پایان
        پایان
    })

    موفقیت محلی ، retval =  pcall (بلوک، خط لوله)

    مشتری. شبکه . نوشتن ، مشتری شبکه . خواندن  = socket_write، socket_read
    اگر  نه موفقیت و سپس مشتری. خطا (retval، 0 ) پایان

    مشتری. شبکه . بنویسید (client، table.concat (requests، ' ' ))

    برای i =  1 ، درخواست # انجام می شود
        پاسخ محلی ، تجزیه = پاسخ خواندن (مشتری)، تجزیه کننده ها [i]
        اگر تجزیه کننده پس از آن
            reply =  parser (پاسخ)
        پایان
        table_insert (پاسخ ها، من، پاسخ)
    پایان

    پاسخهای بازگشت ، درخواست #
پایان

- انتشار / اشتراک

انجام دادن
    کانال های محلی =  عملکرد ( کانال ها )
        اگر  نوع (کانالها) ==  ' string '  باشد ، سپس
            کانال ها = {کانال ها}
        پایان
        کانال های بازگشت
    پایان

    مشترک اشتراک =  تابع محلی ( مشتری ، ...)
        درخواست. multibulk (مشتری، ، اشتراک ، ، ... )
    پایان
    psubscribe محلی =  عملکرد ( مشتری ، ...)
        درخواست. multibulk (مشتری، ' psubscribe ' ، ... )
    پایان
    لغو مشترک محلی =  تابع ( مشتری ، ...)
        درخواست. multibulk (مشتری، ، لغو اشتراک ، )
    پایان
    محلی punsubscribe =  تابع ( مشتری ، ...)
        درخواست. چندگانه (مشتری، ' punsubscribe ' )
    پایان

    local consumer_loop =  تابع ( مشتری )
        aborting local ، subscriptions =  false ، 0

        محلی abort =  function ()
            اگر  بعد از آن سقط نکنید
                لغو اشتراک (مشتری)
                punsubscribe (مشتری)
                aborting =  درست است
            پایان
        پایان

        بازگشت  coroutine.wrap ( function ()
            در حالی که  درست  انجام می شود
                پیام محلی
                پاسخ محلی = پاسخ خواندن (مشتری)

                اگر پاسخ [ 1 ] ==  ' pmessage '  سپس
                    message = {
                        نوع     = پاسخ [ 1 ]،
                        الگو = پاسخ [ 2 ]،
                        کانال = پاسخ [ 3 ]،
                        loadload = response [ 4 ]
                    }
                چیز دیگری
                    message = {
                        نوع     = پاسخ [ 1 ]،
                        کانال = پاسخ [ 2 ]،
                        loadload = response [ 3 ]
                    }
                    پایان

                اگر  string.match (message. kind ، ' ^ p $ subscribe $ ' ) سپس
                    اشتراک ها = اشتراک ها +  1
                پایان
                اگر  string.match (پیام. نوع ، ' ^ P $ لغو اشتراک $ " ) سپس
                    اشتراک ها = اشتراک ها -  1
                پایان

                اگر سقط جنین و اشتراک ==  0  سپس
                    زنگ تفريح
                پایان
                coroutine.yield (پیام، قطع)
            پایان
        پایان )
    پایان

client_prototype pubsub  =  تابع ( مشتری ، اشتراک )
        اگر  نوع (اشتراک) ==  ' جدول ' باشد،  سپس
            اگر اشتراک پس از آن مشترک شوید 
                اشتراک (مشتری، کانال ها (اشتراک ها، اشتراک ها ))
            پایان
            اگر اشتراک psubscribe  سپس
                psubscribe (مشتری، کانال (اشتراک psubscribe ))
            پایان
        پایان
        بازگشت  consumer_loop (مشتری)
    پایان
پایان

- معاملات Redis (MULTI / EXEC)

انجام دادن
    هویت تابع محلی (...) بازگشت ... پایان  
    محلی emptytable = {}

    تابع محلی initialize_transaction ( client ، options ، block ، queued_parsers )
        table_insert = جدول جدول محلی قرار دادن
        محلی coro =  coroutine.create (بلوک)

        اگر گزینه ها سپس تماشا کنید 
            watch_keys محلی = {}
            برای _، کلید در  جفت (گزینه های تماشا ) انجام دهید
                table_insert (watch_keys، کلید)
            پایان
            اگر  # watch_keys >  0  سپس
                مشتری: تماشای ( باز کردن (watch_keys))
            پایان
        پایان

        transaction_client محلی =  setmetatable ({}، {__index = client})
transaction_client. exec   =  تابع (...)
            مشتری. خطا ( ' نمیتوان از EXEC داخل یک معامله استفاده کرد ' )
        پایان
transaction_client. چند  =  عملکرد (...)
            coroutine.yield ()
        پایان
transaction_client. commands_queued  =  function ()
            بازگشت  # queued_parsers
        پایان

        ادعا ( coroutine.resume (کورو، transaction_client))

transaction_client. چند  =  نیل
transaction_client. دور انداختن  =  عملکرد (...)
            پاسخ محلی = مشتری: دور انداختن ()
            برای من، v در  جفت (queued_parsers) انجام می شود
                queued_parsers [i] = nil
            پایان
            coro =  initialize_transaction (client، options، block، queued_parsers)
            بازگشت پاسخ
        پایان
transaction_client. watch  =  function (...)
            مشتری. خطا ( ' WATCH داخل MULTI مجاز نیست ' )
        پایان
        setmetatable (transaction_client، {__index =  function ( t ، k )
                محلی cmd = مشتری [k]
                اگر  نوع (cmd) ==  " function "  then then
                    تابع محلی صفوف ( خود ، ...)
                        پاسخ محلی =  cmd (مشتری، ... )
                        ادعا ((پاسخ یا emptytable). صف  ==  درست ، " یک پاسخ در صف انتظار می رفت ، )
                        table_insert (queued_parsers، پاسخ. تجزیه کننده  یا هویت)
                        بازگشت پاسخ
                    پایان
                    t [k] = queuey
                    بازگشت به صف
                چیز دیگری
                    بازگشت cmd
                پایان
            پایان
        })
        مشتری: چند ()
        بازگشت coro
    پایان

    معامله تابع محلی ( مشتری ، گزینه ، coroutine_block ، تلاش )
        queued_parsers محلی ، پاسخ = {}، {}
        محلی سعی مجدد =  tonumber (تلاش) و یا  tonumber (گزینه. دوباره سعی کنید ) و یا  2
        محلی coro =  initialize_transaction (client، options، coroutine_block، queued_parsers)

        موفقیت محلی ، بازآفرینی
        اگر  coroutine.status (coro) ==  ' تعلیق '  سپس
            موفقیت، retval =  coroutine.resume (coro)
        چیز دیگری
            - اگر تقسیم بندی نشده (از دست رفته t: multi () با CAS صورت نگرفت
            موفقیت، retval =  درست ، ' معامله خالی '
        پایان
        اگر  # queued_parsers ==  0  یا  نه موفقیت پس از آن
            مشتری: دور انداختن ()
            ادعا كردن (موفقیت، جاذبه)
            پاسخ های بازگشت ، 0
        پایان

        local raw_replies = client: exec ()
        اگر  نه raw_replies سپس
            اگر (دوبا
            ره امتحان کنید یا  0 ) <=  0  سپس
                مشتری. خطا ( " تراکنش MULTI / EXEC توسط سرور خاتمه یافته " )
            چیز دیگری
                - ما هنوز کاملا انجام نشده است
                 معامله برگشت (client، options، coroutine_block، retry -  1 )
            پایان
        پایان

        table_insert = جدول جدول محلی قرار دادن
        برای من، تجزیه کننده در  جفت (queued_parsers) انجام دهید
            table_insert (پاسخ ها، من، تجزیه کننده (raw_replies [i]))
        پایان

        بازگشت پاسخ # queued_parsers
    پایان

client_prototype transaction  =  function ( client ، arg1 ، arg2 )
        گزینه های محلی ، بلوک
        اگر  نه arg2 سپس
            options، block = {}، arg1
        elseif arg1 سپس  - و arg2، به صورت ضمنی
            گزینه ها، بلوک =  نوع (arg1) == " جدول "  و arg1 یا {arg1}، arg2
        چیز دیگری
            مشتری. خطا ( " پارامترهای نامعتبر برای transaction redis " )
        پایان

        اگر  گزینه نیست سپس تماشا کنید 
            watch_keys = {}
            برای من، v در  جفت (گزینه ها) انجام دهید
                اگر  tonumber (i) سپس
                    table.insert (watch_keys، v)
                    گزینه [i] =  nil
                پایان
            پایان
            گزینه ها. watch  = watch_keys
        ELSEIF  نیست ( نوع (گزینه. تماشای ) ==  " جدول " ) پس از آن
            گزینه ها. watch  = {options. تماشای }
        پایان

        اگر  گزینه نیست سپس قضاوت کن 
            محلی tx_block = بلوک
            block =  function ( client ، ...)
                مشتری: چند ()
                بازگشت  tx_block (مشتری، ... ) - نمی توان این را در pcall بسته بندی کرد، زیرا ما در یک مقدمه ای هستیم.
            پایان
        پایان

         معامله بازگشت (مشتری، گزینه ها، بلوک)
    پایان
پایان

- زمینه MONITOR

انجام دادن
    local monitor_loop =  تابع ( مشتری )
        نظارت محلی =  درست است

        - از زمان فرمت بارگیری از Radis 2.6 تغییر یافته است.
        محلی الگوی =  " ^ (٪ D +٪.٪ D +) (؟ .-.)؟» (٪ A +) "(.-) $ ،

        محلی abort =  function ()
            نظارت =  اشتباه
        پایان

        بازگشت  coroutine.wrap ( function ()
            مشتری: مانیتور ()

            در حالی که نظارت انجام می شود
                پیام محلی ، همسان
                پاسخ محلی = پاسخ خواندن (مشتری)

                محلی ok = response: gsub (الگوی، عملکرد ( زمان ، اطلاعات ، cmd ، args )
                    message = {
                        timestamp =  tonumber (زمان)
                        client     = info: match ( ' ٪ d +.٪ d +.٪ d +.٪ d +:٪ d + ' )،
                        database   =  tonumber (info: match ( ' ٪ d + ' )) یا  0 ،
                        command    = cmd،
                        arguments = args: match ( ' . + ' )
                    }
                    همسان =  درست است
                پایان )

                اگر  نمی همسان پس از آن
                    مشتری. خطا ( ' قادر به مطابقت با بارگیری مانیتور: ' پاسخ .. )
                پایان

                coroutine.yield (پیام، قطع)
            پایان
        پایان )
    پایان

client_prototype monitor_messages  =  تابع ( مشتری )
        بازگشت  monitor_loop (مشتری)
    پایان
پایان

- ################################################ ############################

تابع محلی connect_tcp ( سوکت ، پارامترها )
    میزبان محلی ، پورت = پارامترها. host ، tonumber (پارامترها، پورت )
    محلی ok، err = سوکت: اتصال (میزبان، پورت)
    اگر  خوب نیست پس
قرمز خطا ( ' نمیتوانست به ' .. میزبان .. 'وصل شود : ' .. port .. ' [ ' .. err .. ' ] ' )
    پایان
    سوکت: setoption ( ' tcp-nodelay ' ، پارامتر tcp_nodelay )
    سوکت برگشت
پایان

عملکرد محلی connect_unix ( سوکت ، پارامترها )
    محلی ok، err = سوکت: اتصال (پارامترها مسیر )
    اگر  خوب نیست پس
قرمز خطا ( ' نمیتوانست به ' .. پارامترها مسیر ... وصل شود ' [ ' .. err .. ' ] ' )
    پایان
    سوکت برگشت
پایان

عملکرد محلی create_connection ( پارامترها )
    اگر پارامترها سوکت  سپس
        پارامترهای بازگشت سوکت
    پایان

    اجرای محلی اتصال سوکت

    اگر پارامترها طرح  ==  ' یونیکس '  سپس
        perform_connection، socket = connect_unix، require ( ' socket.unix ' )
       ادعا (سوکت، " ساخ
       ت شما از LuaSocket از سوکت های دامنه یونیکس پشتیبانی نمی کند " )
    چیز دیگری
        اگر پارامترها طرح  سپس
            طرح محلی = پارامترها. طرح
            تکرار (طرح ==  ' redis '  یا طرح ==  ' tcp ' ، ' طرح نامعتبر: ' .. طرح)
        پایان
        perform_connection، socket = connect_tcp، require ( ' socket ' ). tcp
    پایان

    return  perform_connection ( سوکت ()، پارامترها)
پایان

- ################################################ ############################

تابع redis.error ( پیام ، سطح )
    خطا (پیام (سطح یا  1 ) +  1 )
پایان

تابع redis.connect (...)
    args محلی ، پارامترها = { ... }، صفر است

    اگر  # args ==  1  پس از آن
        اگر  نوع (args [ 1 ]) ==  ' جدول '،  پس از آن
            پارامترها = args [ 1 ]
        چیز دیگری
            محلی uri =  require ( ' socket.url ' )
            پارامتر = uri. تجزیه ( انتخاب کنید ( 1 ، ... ))
            اگر پارامترها طرح  سپس
                اگر پارامترها پرس  و جو بعد
                    برای k، v در پارامترها. پرس و جو : gmatch ( ' ([-_٪ w] +) = ([-_٪ w] +) ' ) انجام دهید
                        اگر k ==  ' tcp_nodelay '  یا k ==  ' tcp-nodelay '  سپس
پارامترها tcp_nodelay  =  parse_boolean (v)
                        پایان
                    پایان
                پایان
            چیز دیگری
پارامترها host  = پارامترها مسیر
            پایان
        پایان
    elseif  # args >  1  سپس
        میزبان محلی ، port =  unpack (args)
        پارامترها = {host = میزبان، پورت = پورت}
    پایان

    دستورات محلی = redis دستورات  یا {}
    اگر  نوع (دستورات) ~ =  ' جدول ' باشد،  سپس
قرمز خطا ( ' نوع نامعتبر برای جدول دستورات ' )
    پایان

    socket محلی =  create_connection ( merge_defaults (پارامترها))
    محلی client =  create_client (client_prototype، socket، دستورات)

    مشتری برگشت
پایان

تابع redis.command ( cmd ، opts )
     دستور return (cmd، opts)
پایان

- منسوخ شده
تابع redis.define_command ( نام ، انتخاب )
    define_command_impl ( فرماندهی فرماندهی ، نام، گزینه)
پایان

- منسوخ شده
تابع redis.undefine_command ( نام )
    undefine_command_impl ( فرماندهی فرماندهی ، نام)
پایان

- ################################################ ############################

- دستورات تعریف شده در این جدول اولویت را به دست نمی آورند
- روش های تعریف شده در جدول نمونه مشتری.

قرمز دستورات  = {
    - دستوراتی که در فضای کلیدی عمل می کنند
    وجود دارد            =  دستور ( ' EXISTS ' ، {
        پاسخ = toboolean
    })،
    del               =  command ( ' DEL ' )،
    type              =  command ( ' TYPE ' )
    rename            =  دستور ( ' RENAME ' )،
    renamenx          =  command ( ' RENAMENX ' ، {
        پاسخ = toboolean
    })،
    expire            =  command ( ' EXPIRE ' ، {
        پاسخ = toboolean
    })،
    pexpire           =  command ( ' PEXPIRE ' ، {      - > = 2.6
        پاسخ = toboolean
    })،
    expireat          =  command ( ' EXPIREAT ' ، {
        پاسخ = toboolean
    })،
    pexpireat         =  command ( ' PEXPIREAT ' ، {    - > = 2.6
        پاسخ = toboolean
    })،
    ttl               =  command ( ' TTL ' )،
    pttl              =  command ( ' PTTL ' )،          - > = 2.6
    move              =  command ( ' حرکت ' ، {
        پاسخ = toboolean
    })،
    dbsize            =  command ( ' DBSIZE ' )،
    persist           =  command ( ' PERSIST ' ، {      - > = 2.2
        پاسخ = toboolean
    })،
    keys              =  command ( ' KEYS ' ، {
        پاسخ =  عملکرد ( پاسخ )
            اگر  نوع (پاسخ) ==  ' رشته '  پس از آن
                - مسیر سازگاری عقب برای Redis <2.0
                کلید های محلی = {}
                پاسخ: gsub ( ' [^٪ s] + ' ، function ( key )
                    table.insert (کلید، کلید)
                پایان )
                پاسخ = کلید
            پایان
            پاسخ بازگشت
        پایان
    })،
    randomkey         =  command ( ' RANDOMKEY ' ، {
        پاسخ =  عملکرد ( پاسخ )
            اگر پاسخ ==  ' '  پس از آن
                بازگشت  نزولی
            چیز دیگری
                پاسخ بازگشت
            پایان
        پایان
    })،
    sort              =  command ( ' SORT ' ، {
        request = sor
        t_request
    })،

    - دستوراتی که روی مقادیر رشته عمل می کنند
    set               =  command ( ' SET ' )،
    setnx             =  command ( ' SETNX ' ، {
        پاسخ = toboolean
    })،
    setex             =  command ( ' SETEX ' )،         - > = 2.0
    psetex            =  command ( ' PSETEX ' )،        - > = 2.6
    mset              =  command ( ' MSET ' ، {
        درخواست = mset_filter_args
    })،
    msetnx            =  command ( ' MSETNX ' ، {
        درخواست   = mset_filter_args
        پاسخ = toboolean
    })،
    دریافت               =  دستور ( ' GET ' )،
    mget              =  دستور ( ' MGET ' )،
    getet            =  command ( ' GETSET ' )
    incr              =  دستور ( ' INCR ' )،
    incrby            =  دستور ( ' INCRBY ' )،
    incrbyfloat       =  command ( ' INCRBYFLOAT ' ، { - > = 2.6
        response =  function ( پاسخ ، دستور ، ...)
            return  tonumber (پاسخ)
        پایان ،
    })،
    decr              =  command ( ' DECR ' )،
    decrby            =  command ( ' DECRBY ' )
    append            =  command ( ' APPEND ' )،        - > = 2.0
    substr            =  دستور ( " SUBSTR ، )،        - > = 2.0
    strlen            =  command ( ' STRLEN ' )،        - > = 2.2
    setrange          =  command ( ' SETRANGE ' )،      - > = 2.2
    مرتب کردن          =  command ( ' GETRANGE ' )،      - > = 2.2
    setbit            =  command ( ' SETBIT ' )،        - > = 2.2
    getbit            =  command ( ' GETBIT ' )،        - > = 2.2

    - دستوراتی که بر روی لیست ها کار می کنند
    rpush             =  دستور ( ' RPUSH ' )،
    lpush             =  command ( ' LPUSH ' )،
    llen              =  دستور ( " LLEN ، )،
    لندن            =  command ( ' LRANGE ' )
    ltrim             =  دستور ( ' LTRIM ' )،
    lindex            =  دستور ( ' LINDEX ' )،
    lset              =  command ( ' LSET ' )،
    lrem              =  command ( ' LREM ' )،
    lpop              =  command ( ' LPOP ' )،
    rpop              =  دستور ( ' RPOP ' )،
    rpoplpush         =  command ( ' RPOPLPUSH ' )،
    blpop             =  command ( ' BLPOP ' )،         - > = 2.0
    brpop             =  دستور ( ' BRPOP ' )،         - > = 2.0
    rpushx            =  command ( ' RPUSHX ' )،        - > = 2.2
    lpushx            =  command ( ' LPUSHX ' )،        - > = 2.2
    linsert           =  command ( ' LINSERT ' )،       - > = 2.2
    brpoplpush        =  command ( ' BRPOPLPUSH ' )،    - > = 2.2

    - دستورات عملیاتی بر روی مجموعه
    sadd              =  command ( ' SADD ' )
    سرم              =  دستور ( " SREM ، )،
    SPOP              =  دستور ( " SPOP ، )،
    smove             =  دستور ( " SMOVE ، ، {
        پاسخ = toboolean
    })،
    scard             =  دستور ( " SCARD ، )،
    sismember         =  command ( ' SISMEMBER ' ، {
        واکنش = toboolean
    })،
    sinter            =  command ( ' SINTER ' )،
    sinterstore       =  command ( ' SINTERSTORE ' )،
    sunion            =  command ( ' SUNION ' )،
    sunionstore       =  command ( ' SUNIONSTORE ' )،
    sdiff             =  command ( ' SDIFF ' )،
    sdiffstore        =  command ( ' SDIFFSTORE ' )،
    smembers          =  command ( ' SMEMBERS ' )،
    srandmember       =  command ( ' SRANDMEMBER ' )،

    - دستوراتی که بر روی مجموعه های مرتب شده عمل می کنند
    zadd              =  command ( ' ZADD ' )،
    zincrby           =  command ( ' ZINCRBY ' )،
    zrem              =  command ( ' ZREM ' )،
    zrange            =  command ( ' ZRANGE ' ، {
        درخواست   = zset_range_request
        پاسخ = zset_range_reply
    })،
    zrevrange         =  command ( ' ZREVRANGE ' ، {
        درخواست   = zset_range_request
        پاسخ = zset_range_reply
    })،
    zrangebyscore     =  command ( ' ZRANGEBYSCORE ' ، {
        درخواست   = zset_range_byscore_request
        پاسخ = zset_range_reply
    })،
    zrevrangebyscore =  command ( ' ZREVRANGEBYSCORE ' ، {     - > = 2.2
        درخواست   = zset_range_byscore_request
        پاسخ = zset_range_reply
    })،
    zunionstore       =  command ( ' ZUNIONSTORE ' ، {          - > = 2.0
    درخواست = zset_store_request
    })،
    zinterstore       =  command ( ' ZINTERSTORE ' ، {          - > = 2.0
        درخواست = zset_store_request
    })،
    zcount            =  command ( ' ZCOUNT ' )،
    zcard             =  command ( ' ZCARD ' )،
    zscore            =  command ( ' ZSCORE ' )،
    zremrangebyscore =  command ( ' ZREMRANGEBYSCORE ' )،
    zrank             =  command ( ' ZRANK ' )،                 - > = 2.0
    zrevrank          =  command ( ' ZREVRANK ' )،              - > = 2.0
    zremrangebyrank   =  command ( ' ZREMRANGEBYRANK ' )،       - > = 2.0

    - دستوراتی که در هش ها عمل می کنند
    hset              =  command ( ' HSET ' ، {         - > = 2.0
        پاسخ = toboolean
    })،
    hsetnx            =  command ( ' HSETNX ' ، {       - > = 2.0
        پاسخ = toboolean
    })،
    hmset             =  command ( ' HMSET ' ، {        - > = 2.0
        request   =  hash_multi_request_builder ( function ( args ، k ، v )
            table.insert (args، k)
            table.insert (args، v)
        پایان )
    })،
    hincrby           =  command ( ' HINCRBY ' )،       - > = 2.0
    hincrbyfloat      =  command ( ' HINCRBYFLOAT ' ، { - > = 2.6
        response =  function ( پاسخ ، دستور ، ...)
            return  tonumber (پاسخ)
        پایان ،
    })،
    hget              =  command ( ' HGET ' )،          - > = 2.0
    hmget             =  command ( ' HMGET ' ، {        - > = 2.0
        request   =  hash_multi_request_builder ( function ( args ، k ، v )
            table.insert (args، v)
        پایان )
    })،
    hdel              =  command ( ' HDEL ' )،         - > = 2.0
    hexists           =  command ( ' HEXISTS ' ، {      - > = 2.0
        پاسخ = toboolean
    })،
    hlen              =  command ( ' HLEN ' )،          - > = 2.0
    hkeys             =  command ( ' HKEYS ' )،         - > = 2.0
    hvals             =  command ( ' HVALS ' )،         - > = 2.0
    hgetall           =  command ( ' HGETALL ' ، {      - > = 2.0
        response =  function ( پاسخ ، دستور ، ...)
            محلی new_reply = {}
            برای i =  1 ، # پاسخ، 2  do new_reply [reply [i]] = reply [i +  1 ] end
            بازگشت new_reply
        پایان
    })،

    - دستورات مربوط به ارتباط
    پینگ              =  دستور ( ' PING ' ، {
        پاسخ =  عملکرد ( پاسخ ) پاسخ بازگشت ==  ' PONG '  پایان
    })،
    echo              =  command ( ' ECHO ' )،
    auth              =  دستور ( ' AUTH ' )،
    انتخاب            =  دستور ( ' SELECT ' )،

    - معاملات
    multi             =  command ( ' MULTI ' )،         - > = 2.0
    exec              =  command ( ' EXEC ' )،          - > = 2.0
    discard           =  command ( ' DISCARD ' )،       - > = 2.0
    watch             =  command ( ' WATCH ' )،         - > = 2.2
    unwatch           =  command ( ' UNWATCH ' )،       - > = 2.2

    - انتشار - اشتراک
    subscribe         =  command ( ' SUBSCRIBE ' )،     - > = 2.0
    unsubscribe       =  command ( ' UNSUBSCRIBE ' )،   - > = 2.0
    psubscribe        =  command ( ' PSUBSCRIBE ' )،    - > = 2.0
    punsubscribe      =  command ( ' PUNSUBSCRIBE ' )، - > = 2.0
    publish           =  command ( ' PUBLISH ' )،       - > = 2.0

    - برنامه نویسی سرخ مایل به قرمز
    eval              =  command ( ' EVAL ' )،          - > = 2.6
    evalsha           =  command ( ' EVALSHA ' )،       - > = 2.6
    script            =  command ( ' SCRIPT ' )،        - > = 2.6

    - دستورات کنترل از راه دور سرور
    bgrewriteaof      =  command ( ' BGREWRITEAOF ' )،
    config            =  command ( ' CONFIG ' ، {      - > = 2.0
        response =  function ( پاسخ ، دستور ، ...)
            اگر ( نوع (پاسخ) ==  ' جدول ' ) پس از آن
                محلی new_reply = {}
                برای i =  1 ، # پاسخ، 2  do new_reply [reply [i]] = reply [i +  1 ] end
                بازگشت new_reply
            پایان

            بازگشت پاسخ
        پایان
    })،
    client            =  command ( ' CLIENT ' )،        - > = 2.4
    slaveof           =  command ( ' SLAVEOF ' )،
    save              =  command ( ' ذخیره کردن ' )،
    bgs
    ave            =  command ( ' BGSAVE ' )،
    lastsave          =  command ( ' LASTSAVE ' )،
    flushdb           =  دستور ( ' FLUSHDB ' )،
    flushall          =  command ( ' فلشال ' )،
    monitor           =  command ( ' MONITOR ' )،
    time              =  command ( ' TIME ' )،          - > = 2.6
    slowlog           =  command ( ' SLOWLOG ' ، {      - > = 2.2.13
        response =  function ( پاسخ ، دستور ، ...)
            اگر ( نوع (پاسخ) ==  ' جدول ' ) پس از آن
                محلی structured = {}
                برای شاخص، ورود به  ipairs (پاسخ) انجام دهید
                    structured [index] = {
                        id =  tonumber (ورود [ 1 ])،
                        timestamp =  tonumber (ورود [ 2 ])،
                        مدت زمان =  tonumber (ورود [ 3 ])،
                        command = entry [ 4 ]
                    }
                پایان
                بازگشت ساختار یافته
            پایان

            بازگشت پاسخ
        پایان
    })،
    info              =  command ( ' INFO ' ، {
        پاسخ = parse_info،
    })،
}

- ################################################ ############################

دوباره سرخ کن
