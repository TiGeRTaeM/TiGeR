￼
محلی ردیس = ( loadfile  " ./libs/lua-redis.lua " ) ()
محلی FakeRedis = ( loadfile  " ./libs/fakeredis.lua " ) ()

پارامترهای محلی = {
  میزبانی =  " 127.0.0.1 " ،
  پورت =  6379 ،
}

- HGETALL را بازنویسی کنید
ردیس دستورات . hgetall  = Redis. فرمان ( ' hgetall ' ، {
  response =  function ( پاسخ ، دستور ، ...)
    محلی new_reply = {}
    برای i =  1 ، # پاسخ، 2  do new_reply [reply [i]] = reply [i +  1 ] end
    بازگشت new_reply
  پایان
})

redis محلی =  nil

- خطایی در صورت شکست انجام نمی شود
محلی ok =  pcall ( function ()
  ردیس = ردیس. اتصال (params)
پایان )

اگر  خوب نیست پس

  محلی fake_func =  function ()
    چاپ ( ، \ 27 [31mCan \ ' t با ردیس اتصال، نصب / پیکربندی آن! \ 27 [39M ، )
  پایان
  fake_func ()
  جعلی = FakeRedis جدید ()

  چاپ ( ' \ 27 [31mRedis addr: ' .. params میزبان .. ' \ 27 [39m ' ]
  چاپ ( ' \ 27 [port 31mRedis: ' .. params. port .. ' \ 27 [39m ' ]

  redis =  setmetatable ({fakeredis = true }، {
  __index =  عملکرد ( a ، b )
    اگر b ~ =  ' داده '  و جعلی [b] سپس
      fake_func (ب)
    پایان
    بازگشت جعلی [b] یا fake_func
  پایان })

پایان


دوباره سرخ کن
