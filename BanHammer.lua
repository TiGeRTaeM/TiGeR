￼
- شروع BanHammer.lua توسطArashwolf1
تابع محلی pre_process ( msg )
   اگر MSG. به . تایپ کنید  ~ =  ' pv '  سپس
chat = msg به . شناسه
user = msg از . شناسه
 تابع محلی check_newmember ( arg ، data )
  آزمون =  load_data (_config. اعتدال . داده )
  lock_bots = تست [arg. chat_id ] [ ' تنظیمات ' ] [ ' lock_bots ' ]
هش محلی =  " gp_lang: " .. arg. chat_id
local lang = redis: get (hash)
    اگر داده type_ . ID  ==  " UserTypeBot "  سپس
      اگر  نه  is_owner (arg. msg ) و lock_bots ==  ' yes '،  پس از آن
kick_user ( data.id_ ، arg. chat_id )
پایان
پایان
اگر داده username_  سپس
user_name =  ' @ ' .. check_markdown (داده. username_ )
چیز دیگری
USER_NAME =  check_markdown (داده ها. first_name_ )
پایان
اگر  is_banned ( data.id_ ، arg. chat_id ) باشد، سپس
   اگر  نه lang سپس
  tdcli sendMessage (ارگ. chat_id ، ارگ. msg_id ، 0 ، " _User_ " .. USER_NAME .. " * [ " .. داده ها. id_ .. " ] * _is banned_ " ، 0 ، " MD " )
   چیز دیگری
  tdcli sendMessage (ارگ. chat_id ، ارگ. msg_id ، 0 ، " _کاربر_ " .. USER_NAME .. " * [ " .. داده ها. id_ .. " ] * _از گروه محروم است_ " ، 0 ، " MD " )
پایان
kick_user ( data.id_ ، arg. chat_id )
پایان
اگر  is_gbanned (داده. id_ ) باشد، سپس
     اگر  نه lang سپس
  tdcli sendMessage (ارگ. chat_id ، ارگ. msg_id ، 0 ، " _User_ " .. USER_NAME .. " * [ " .. داده ها. id_ .. " ] * _is در سطح جهانی banned_ " ، 0 ، " MD " )
    چیز دیگری
  tdcli sendMessage (ارگ. chat_id ، ارگ. msg_id ، 0 ، " _کاربر_ " .. USER_NAME .. " * [ " .. داده ها. id_ .. " ] * _از تمام گروه های ربات محروم است_ " ، 0 ، " MD " )
   پایان
kick_user ( data.id_ ، arg. chat_id )
     پایان
 پایان
 اگر MSG. adduser  سپس
   tdcli_function ({
       ID =  " GetUser " ،
       user_id_ = msg adduser
     }، check_newmember، {chat_id = chat، msg_id = msg. id ، user_id = کاربر، msg = msg})
 پایان
 اگر MSG. joinuser  سپس
   tdcli_function ({
       ID =  " GetUser " ،
       user_id_ = msg عضو پیوست
     }، check_newmember، {chat_id = chat، msg_id = msg. id ، user_id = کاربر، msg = msg})
 پایان
اگر  is_silent_user (کاربر، چت) then است
del_msg (MSG. به . شناسه ، MSG. شناسه )
پایان
اگر  is_banned (کاربر، چت) پس از آن است
del_msg (MSG. به . شناسه ، tonumber (MSG. شناسه ))
    kick_user (کاربر، چت)
   پایان
اگر  is_gbanned (کاربر) است، سپس
del_msg (MSG. به . شناسه ، tonumber (MSG. شناسه ))
    kick_user (کاربر، چت)
      پایان
   پایان
پایان
عملکرد محلی action_by_reply ( arg ، data )
هش محلی =  " gp_lang: " .. داده. chat_id_
local lang = redis: get (hash)
  محلی cmd = arg. cmd
اگر  نمی  tonumber (داده ها. sender_user_id_ ) پس از آن  بازگشت  کاذب  پایان
اگر داده sender_user_id_  سپس
  اگر cmd ==  " ممنوعیت "  سپس
تابع محلی ban_cb ( arg ، data )
هش محلی =  " gp_lang: " .. arg. chat_id
local lang = redis: get (hash)
    محلی دولت =  load_data (_config. اعتدال . داده )
اگر داده username_  سپس
user_name =  ' @ ' .. check_markdown (داده. username_ )
چیز دیگری
USER_NAME =  check_markdown (داده ها. first_name_ )
پایان
   اگر  ismod1 (arg. chat_id ، data. id_ ) باشد، سپس
  اگر  نه lang سپس
  بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _You می توانید مدها *، صاحبان و مدیران ربات * ban_ نیست " ، 0 ، " MD " )
   چیز دیگری
  بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " * شما نمیتوانید مدیران، صاحبان گروه، و ادمین های ربات رو از گروه محروم کنید * " ، 0 ، " MD " )
         پایان
     پایان
اگر دولت [ متد toString (ارگ. chat_id )] [ ، ممنوع ، ] [ متد toString (داده ها. id_ )] پس از آن
    اگر  نه lang سپس
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _User_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * _is already_ * ممنوع * " ، 0 ، " MD " )
   چیز دیگری
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _کاربر_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * * * * از گروه محروم بود * " ، 0 ، " MD " )
      پایان
   پایان
دولت [ متد toString (ارگ. chat_id )] [ ، ممنوع ، ] [ متد toString (داده ها. id_ )] = USER_NAME
    save_data (_config. اعتدال . داده ، مدیریت)
   kick_user ( data.id_ ، arg. chat_id )
    اگر  نه lang سپس
    بازگشت tdcli sendMessage (ارگ. chat_id ، "
    " ، 0 ، " _User_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * _has been_ * ممنوع * " ، 0 ، " MD " )
    چیز دیگری
    بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _کاربر_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * * * * از گروه محروم شد * " ، 0 ، " MD " )
   پایان
پایان
tdcli_function ({
    ID =  " GetUser " ،
    user_id_ = داده ها sender_user_id_
  }، ban_cb، {chat_id = data. chat_id_ ، user_id = data sender_user_id_ })
  پایان
   اگر cmd ==  " unban "  سپس
تابع محلی unban_cb ( arg ، data )
هش محلی =  " gp_lang: " .. arg. chat_id
local lang = redis: get (hash)
    محلی دولت =  load_data (_config. اعتدال . داده )
اگر داده username_  سپس
user_name =  ' @ ' .. check_markdown (داده. username_ )
چیز دیگری
USER_NAME =  check_markdown (داده ها. first_name_ )
پایان
اگر  نمی دولت [ متد toString (ارگ. chat_id )] [ ، ممنوع ، ] [ متد toString (داده ها. id_ )] پس از آن
    اگر  نه lang سپس
    بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _User_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * _is not_ * ممنوع * " ، 0 ، " MD " )
   چیز دیگری
    بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _کاربر_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * * * * از گروه محروم نبود * " ، 0 ، " MD " )
      پایان
   پایان
دولت [ متد toString (ارگ. chat_id )] [ ، ممنوع ، ] [ متد toString (داده ها. id_ )] =  صفر
    save_data (_config. اعتدال . داده ، مدیریت)
   اگر  نه lang سپس
    بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _User_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * _has been_ * از تحریم * " ، 0 ، " MD " )
   چیز دیگری
    بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _کاربر_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * * * * از محرومیت گروه خارج شد * " ، 0 ، " MD " )
   پایان
پایان
tdcli_function ({
    ID =  " GetUser " ،
    user_id_ = داده ها sender_user_id_
  }، unban_cb، {chat_id = data. chat_id_ ، user_id = data sender_user_id_ })
  پایان
  اگر cmd ==  " سکوت "  سپس
تابع محلی silent_cb ( arg ، data )
هش محلی =  " gp_lang: " .. arg. chat_id
local lang = redis: get (hash)
    محلی دولت =  load_data (_config. اعتدال . داده )
اگر داده username_  سپس
user_name =  ' @ ' .. check_markdown (داده. username_ )
چیز دیگری
USER_NAME =  check_markdown (داده ها. first_name_ )
پایان
   اگر  ismod1 (arg. chat_id ، data. id_ ) باشد، سپس
  اگر  نه lang سپس
  بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _You می توانید مدها *، صاحبان و مدیران ربات * silent_ نیست " ، 0 ، " MD " )
    چیز دیگری
  بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " * شما نمیتوانید توانایی چت کردن رو از مدیران، صاحبان گروه، و ادمین های ربات بگیرید * " ، 0 ، " MD " )
       پایان
     پایان
اگر مدیریت [ tostring (arg. chat_id )] [ ' is_silent_users ' ] [ tostring ( data.id_ )] سپس
    اگر  نه lang سپس
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _User_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * _is already_ * سکوت * " ، 0 ، " MD " )
  چیز دیگری
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _کاربر_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * * * * از قبل توانایی چت کردن رو نداشت * " ، 0 ، " MD " )
     پایان
   پایان
دولت [ متد toString (ارگ. chat_id )] [ . is_silent_users ، ] [ متد toString (داده ها. id_ )] = USER_NAME
    save_data (_config. اعتدال . داده ، مدیریت)
  اگر  نه lang سپس
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _User_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * _added to_ فهرست * کاربران سکوت * " ، 0 ، " MD " )
  چیز دیگری
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _کاربر_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * * * * توانایی چت کردن رو از دست داد * " ، 0 ، " MD " )
   پایان
پایان
tdcli_function ({
    ID =  " GetUser " ،
    user_id_ = داده ها sender_user_id_
  }، silent_cb، {chat_id = data. chat_id_ ، user_id = data sender_user_id_ })
  پایان
  اگر cmd ==  " unsilent "  سپس
تابع محلی unsilent_cb ( arg ، data )
هش محلی =  " gp_lang: " .. arg. chat_id
local lang = redis: get (hash)
    محلی دولت =  load_data (_config. اعتدال . داده )
اگر داده username_  سپس
user_name =  ' @ ' .. check_markdown (داده. username_ )
چیز دیگری
USER_NAM
E =  check_markdown (داده ها. first_name_ )
پایان
اگر  نمی دولت [ متد toString (ارگ. chat_id )] [ . is_silent_users ، ] [ متد toString (داده ها. id_ )] پس از آن
   اگر  نه lang سپس
    بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _User_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * _is not_ * سکوت * " ، 0 ، " MD " )
   چیز دیگری
    بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _کاربر_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * * * * از قبل توانایی چت کردن را داشت * " ، 0 ، " MD " )
      پایان
   پایان
administration [ tostring (arg. chat_id )] [ ' is_silent_users ' ] [ tostring ( data.id_ )] =  nil
    save_data (_config. اعتدال . داده ، مدیریت)
    اگر  نه lang سپس
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _User_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * _removed from_ * کاربران سکوت فهرست * " ، 0 ، " MD " )
  چیز دیگری
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _کاربر_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * * * * توانایی چت کردن رو به دست آورد * " ، 0 ، " MD " )
   پایان
پایان
tdcli_function ({
    ID =  " GetUser " ،
    user_id_ = داده ها sender_user_id_
  }, unsilent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "banall" then
local function gban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't_ *globally ban* _other admins_", 0, "md")
  else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید ادمین های ربات رو از تمامی گروه های ربات محروم کنید*", 0, "md")
        end
     end
if is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already_ *globally banned*", 0, "md")
    else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از گروه های ربات محروم بود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از تمام گروه های ربات محروم شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, gban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "unbanall" then
local function ungban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از گروه های ربات محروم نبود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *globally unbanned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_..
     "* *از محرومیت گروه های ربات خارج شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }، ungban_cb، {chat_id = data. chat_id_ ، user_id = data sender_user_id_ })
  پایان
  اگر cmd ==  " kick "  سپس
   اگر  ismod1 ( data.chat_id_ ، data. sender_user_id_ ) باشد، پس وجود دارد
   اگر  نه lang سپس
  بازگشت tdcli sendMessage (داده ها. chat_id_ ، " " ، 0 ، " _You می توانید مدها *، صاحبان و مدیران ربات * kick_ نیست " ، 0 ، " MD " )
    elseif lang سپس
  بازگشت tdcli sendMessage (داده ها. chat_id_ ، " " ، 0 ، " * شما نمیتوانید مدیران، صاحبان گروه و ادمین های ربات رو اخراج کنید * " ، 0 ، " MD " )
   پایان
  چیز دیگری
     kick_user (data. sender_user_id_ ، data. chat_id_ )
     پایان
  پایان
  اگر cmd ==  " delall "  سپس
   اگر  ismod1 ( data.chat_id_ ، data. sender_user_id_ ) باشد، پس وجود دارد
   اگر  نه lang سپس
  بازگشت tdcli sendMessage (داده ها. chat_id_ ، " " ، 0 ، " _You نمی توانید حذف messages_ * مدها، صاحبان و مدیران ربات * " ، 0 ، " MD " )
   elseif lang سپس
  بازگشت tdcli sendMessage (داده ها. chat_id_ ، " " ، 0 ، " * شما نمیتوانید پیام های مدیران، صاحبان گروه و ادمین های ربات رو پاک کنید * " ، 0 ، " MD " )
   پایان
  چیز دیگری
tdcli deleteMessagesFromUser ( data.chat_id_ ، data. sender_user_id_ ، dl_cb، nil )
   اگر  نه lang سپس
  بازگشت tdcli sendMessage (داده ها. chat_id_ ، " " ، 0 ، " _All_ * پیام * _of_ * [ " .. داده ها. sender_user_id_ .. " ] * _has been_ * حذف * " ، 0 ، " MD " )
      elseif lang سپس
  بازگشت tdcli sendMessage (داده ها. chat_id_ ، " " ، 0 ، " * تمام پیام های * * [ " .. داده ها. sender_user_id_ .. " ] * * * * * پاک شد " ، 0 ، " MD " )
       پایان
    پایان
  پایان
چیز دیگری
    اگر آن را بنویسید
  بازگشت tdcli sendMessage (داده ها. chat_id_ ، " " ، 0 ، " _کاربر یافت نشد_ " ، 0 ، " MD " )
   چیز دیگری
  بازگشت tdcli sendMessage (داده ها. chat_id_ ، " " ، 0 ، " * کاربر یافت نشد * " ، 0 ، " MD " )
      پایان
   پایان
پایان
عملکرد محلی action_by_username ( arg ، data )
هش محلی =  " gp_lang: " .. arg. chat_id
local lang = redis: get (hash)
  محلی cmd = arg. cmd
    محلی دولت =  load_data (_config. اعتدال . داده )
اگر  نه argeg نام کاربری  پس از آن  بازگشت  کاذب  پایان
    اگر داده id_  سپس
اگر داده type_ . کاربر_ . username_  سپس
user_name =  ' @ ' .. check_markdown (data type_ . user_ . username_ )
چیز دیگری
user_name =  check_markdown (data title_ )
پایان
  اگر cmd ==  " ممنوعیت "  سپس
   اگر  ismod1 (arg. chat_id ، data. id_ ) باشد، سپس
  اگر  نه lang سپس
  بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _You می توانید مدها *، صاحبان و مدیران ربات * ban_ نیست " ، 0 ، " MD " )
   چیز دیگری
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید مدیران،صاحبان گروه، و ادمین های ربات رو از گروه محروم کنید*", 0, "md")
         end
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already_ *banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* * از گروه محروم بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *banned*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از گروه محروم شد*", 0, "md")
   end
end
   if cmd == "unban" then
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not_ *banned*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از گروه محروم نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.d
    ata, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *unbanned*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از محرومیت گروه خارج شد*", 0, "md")
   end
end
  if cmd == "silent" then
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't silent_ *mods,owners and bot admins*", 0, "md")
    else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید توانایی چت کردن رو از مدیران،صاحبان گروه، و ادمین های ربات بگیرید*", 0, "md")
       end
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already_ *silent*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل توانایی چت کردن رو نداشت*", 0, "md")
     end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _added to_ *silent users list*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *توانایی چت کردن رو از دست داد*", 0, "md")
   end
end
  if cmd == "unsilent" then
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not_ *silent*", 0, "md")
   else
    بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _کاربر_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * * * * از قبل توانایی چت کردن را داشت * " ، 0 ، " MD " )
      پایان
   پایان
administration [ tostring (arg. chat_id )] [ ' is_silent_users ' ] [ tostring ( data.id_ )] =  nil
    save_data (_config. اعتدال . داده ، مدیریت)
    اگر  نه lang سپس
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _User_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * _removed from_ * کاربران سکوت فهرست * " ، 0 ، " MD " )
  چیز دیگری
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *توانایی چت کردن رو به دست آورد*", 0, "md")
   end
end
  if cmd == "banall" then
  if not administration['gban_users'] then
    administration [ ' gban_users ' ] = {}
    save_data (_config. اعتدال . داده ، مدیریت)
    پایان
   اگر  is_admin1 ( data.id_ ) باشد، سپس
  اگر  نه lang سپس
  بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _You can't_ * در سطح جهانی ممنوع * admins_ همهی پروندهها " ، 0 ، " MD " )
  چیز دیگری
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید ادمین های ربات رو از تمامی گروه های ربات محروم کنید*", 0, "md")
        end
     end
if is_gbanned(data.id_) then
   if not lang then
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _User_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * _is already_ * در سطح جهانی ممنوع * " ، 0 ، " MD " )
    چیز دیگری
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از گروه های ربات محروم بود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *globally banned*", 0, "md")
   else
     بازگشت tdcli sendMessage (ارگ. chat_id ، " " ، 0 ، " _کاربر_ " .. USER_NAME .. " * " .. داده ها. id_ .. " * * * * از تمام گروه های ربات محروم شد * " ، 0 ، " MD " )
   پایان
پایان
  اگر cmd ==  " unbanall "  سپس
  اگر  نمی دولت [ ، gban_users ، ] پس از آن
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
     if not lang then
     ret
     urn tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از گروه های ربات محروم نبود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been_ *globally unbanned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از محرومیت گروه های ربات خارج شد*", 0, "md")
   end
end
  if cmd == "kick" then
   if is_mod1(arg.chat_id, data.id_) then
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't kick_ *mods,owners and bot admins*", 0, "md")
    elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید مدیران،صاحبان گروه و ادمین های ربات رو اخراج کنید*", 0, "md")
   end
  else
     kick_user(data.id_, arg.chat_id)
     end
  end
  if cmd == "delall" then
   if is_mod1(arg.chat_id, data.id_) then
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't delete messages_ *mods,owners and bot admins*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*شما نمیتوانید پیام های مدیران،صاحبان گروه و ادمین های ربات رو پاک کنید*", 0, "md")
   end
  else
tdcli.deleteMessagesFromUser(arg.chat_id, data.id_, dl_cb, nil)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_All_ *messages* _of_ "..user_name.." *[ "..data.id_.." ]* _has been_ *deleted*", 0, "md")
      elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*تمام پیام های* "..user_name.." *[ "..data.id_.." ]* *پاک شد*", 0, "md")
       end
    end
  end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر یافت نشد_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*User Not Found*", 0, "md")
      end
   end
end
local function run(msg, matches)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
chat = msg.to.id
user = msg.from.id
   if msg.to.type ~= 'pv' then
 if matches[1] == "kick" and is_mod(msg) or matches[1] == "Kick" and is_mod(msg) or matches[1] == "کیک" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="kick"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, matches[2]) then
   if not lang then
     tdcli.sendMessage(msg.to.id, "", 0, "_You can't kick mods,owners or bot admins_", 0, "md")
   elseif lang then
     tdcli.sendMessage(msg.to.id, "", 0, "*شما نمیتوانید مدیران،صاحبان گروه و ادمین های ربات رو اخراج کنید*", 0, "md")
         end
     else
kick_user(matches[2], msg.to.id)
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="kick"})
         end
      end
 if matches[1] == "delall" and is_mod(msg) or matches[1] == "Delall" and is_mod(msg) or matches[1] == "حذف همه" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="delall"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, matches[2]) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "_You can't delete messages mods,owners or bot admins_", 0, "md")
     elseif lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "*شما نمیتوانید پیام های مدیران،صاحبان گروه و ادمین های ربات رو پاک کنید*", 0, "md")
   end
     else
tdcli.deleteMessagesFromUser(msg.to.id, matches[2], dl_cb,
nil)
    if not lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "_All_ *messages* _of_ *[ "..matches[2].." ]* _has been_ *deleted*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "*تمامی پیام های* *[ "..matches[2].." ]* *پاک شد*", 0, "md")
         end
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="delall"})
         end
      end
   end
 if matches[1] == "banall" and is_admin(msg) or matches[1] == "Banall" and is_admin(msg) or matches[1] == "بنگلوبال" and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="banall"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_admin1(matches[2]) then
   if not lang then
    return tdcli.sendMessage(msg.to.id, "", 0, "_You can't globally ban other admins_", 0, "md")
else
    return tdcli.sendMessage(msg.to.id, "", 0, "*شما نمیتوانید ادمین های ربات رو از گروه های ربات محروم کنید*", 0, "md")
        end
     end
   if is_gbanned(matches[2]) then
   if not lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "*User "..matches[2].." is already globally banned*", 0, "md")
    else
  return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از گروه های ربات محروم بود*", 0, "md")
        end
     end
  data['gban_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.to.id)
   if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "*User "..matches[2].." has been globally banned*", 0, "md")
    else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." از تمام گروه هار ربات محروم شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="banall"})
      end
   end
 if matches[1] == "unbanall" and is_admin(msg) or  matches[1] == "Unbanall" and is_admin(msg) or  matches[1] == "ان گلوبال" and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="unbanall"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_gbanned(matches[2]) then
     if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "*User "..matches[2].." is not globally banned*", 0, "md")
    else
   return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از گروه های ربات محروم نبود*", 0, "md")
        end
     end
  data['gban_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
return tdcli.sendMessage(msg.to.id, msg.id, 0, "*User "..matches[2].." has been globally unbanned*", 0, "md")
   else
return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." از محرومیت گروه های ربات خارج شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unbanall"})
      end
   end
   if msg.to.type ~= 'pv' then
 if matches[1] == "ban" and is_mod(msg) or matches[1] == "Ban" and is_mod(msg) or matches[1] == "بن" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="ban"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, matches[2]) then
     if not lang then
    return tdcli.sendMessage(msg.to.id, "", 0, "_You can't ban mods,o
    wners or bot admins_", 0, "md")
    else
    return tdcli.sendMessage(msg.to.id, "", 0, "*شما نمیتوانید مدیران،صاحبان گروه و ادمین های ربات رو از گروه محروم کنید*", 0, "md")
        end
     end
   if is_banned(matches[2], msg.to.id) then
   if not lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "_User "..matches[2].." is already banned_", 0, "md")
  else
  return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از گروه محروم بود*", 0, "md")
        end
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.to.id)
   if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "_User "..matches[2].." has been banned_", 0, "md")
  else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." از گروه محروم شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
     tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="ban"})
      end
   end
 if matches[1] == "unban" and is_mod(msg) or matches[1] == "Unban" and is_mod(msg) or matches[1] == "ان بن" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="unban"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_banned(matches[2], msg.to.id) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "_User "..matches[2].." is not banned_", 0, "md")
  else
   return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از گروه محروم نبود*", 0, "md")
        end
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
return tdcli.sendMessage(msg.to.id, msg.id, 0, "_User "..matches[2].." has been unbanned_", 0, "md")
   else
return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." از محرومیت گروه خارج شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unban"})
      end
   end
 if matches[1] == "silent" and is_mod(msg) or  matches[1] == "Silent" and is_mod(msg) or  matches[1] == "خفه" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="silent"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, matches[2]) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "_You can't silent mods,leaders or bot admins_", 0, "md")
 else
   return tdcli.sendMessage(msg.to.id, "", 0, "*شما نمیتوانید توانایی چت کردن رو از مدیران،صاحبان گروه و ادمین های ربات بگیرید*", 0, "md")
        end
     end
   if is_silent_user(matches[2], chat) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "_User "..matches[2].." is already silent_", 0, "md")
   else
   return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از قبل توانایی چت کردن رو نداشت*", 0, "md")
        end
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
    if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "_User "..matches[2].." added to silent users list_", 0, "md")
  else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." توانایی چت کردن رو از دست داد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="silent"})
      end
   end
 if matches[1] == "unsilent" a
 nd is_mod(msg) or  matches[1] == "Unsilent" and is_mod(msg) or  matches[1] == "ان خفه" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="unsilent"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_silent_user(matches[2], chat) then
     if not lang then
     return tdcli.sendMessage(msg.to.id, "", 0, "_User "..matches[2].." is not silent_", 0, "md")
   else
     return tdcli.sendMessage(msg.to.id, "", 0, "*کاربر "..matches[2].." از قبل توانایی چت کردن رو داشت*", 0, "md")
        end
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "_User "..matches[2].." removed from silent users list_", 0, "md")
  else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "*کاربر "..matches[2].." توانایی چت کردن رو به دست آورد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unsilent"})
      end
   end
  if matches[1]:lower() == 'clean' and is_owner(msg) or matches[1]:lower() == 'Clean' and is_owner(msg) or matches[1]:lower() == 'پاک کردن' and is_owner(msg) then
   if matches[2] == 'bans' then
    if next(data[tostring(chat)]['banned']) == nil then
     if not lang then
     return "_No_ *banned* _users in this group_"
   else
     return "*هیچ کاربری از این گروه محروم نشده*"
              end
    end
    for k,v in pairs(data[tostring(chat)]['banned']) do
     data[tostring(chat)]['banned'][tostring(k)] = nil
     save_data(_config.moderation.data, data)
    end
     if not lang then
    return "_All_ *banned* _users has been unbanned_"
    else
    return "*تمام کاربران محروم شده از گروه از محرومیت خارج شدند*"
           end
   end
   if matches[2] == 'silentlist' or matches[2] == 'Silentlist' or matches[2] == 'لیست خفه' then
    if next(data[tostring(chat)]['is_silent_users']) == nil then
        if not lang then
     return "_No_ *silent* _users in this group_"
   else
     return "*لیست کاربران سایلنت شده خالی است*"
             end
    end
    for k,v in pairs(data[tostring(chat)]['is_silent_users']) do
     data[tostring(chat)]['is_silent_users'][tostring(k)] = nil
     save_data(_config.moderation.data, data)
        end
       if not lang then
    return "*Silent list* _has been cleaned_"
   else
    return "*لیست کاربران سایلنت شده پاک شد*"
               end
       end
        end
     end
  if matches[1]:lower() == 'clean' and is_sudo(msg) or  matches[1]:lower() == 'Clean' and is_sudo(msg) or  matches[1]:lower() == 'پاک کردن' and is_sudo(msg) then
   if matches[2] == 'gbans' then
    if next(data['gban_users']) == nil then
    if not lang then
     return "_No_ *globally banned* _users available_"
   else
     return "*هیچ کاربری از گروه های ربات محروم نشده*"
             end
    end
    for k,v in pairs(data['gban_users']) do
     data['gban_users'][tostring(k)] = nil
     save_data(_config.moderation.data, data)
    end
      if not lang then
    return "_All_ *globally banned* _users has been unbanned_"
   else
    return "*تمام کاربرانی که از گروه های ربات محروم بودند از محرومیت خارج شدند*"
          end
   end
     end
if matches[1] == "gbanlist" and is_admin(msg) or  matches[1] == "Gbanlist" and is_admin(msg) or  matches[1] == "لیست بنگلوبال" and is_admin(msg) then
  return gbanned_list(msg)
 end
   if msg.to.type ~= 'pv' then
if matches[1] == "silentlist" and is_mod(msg) or matches[1] == "Silentlist" and is_mod(msg) or matches[1] == "لیست خفه " and is_mod(msg) then
  return silent_users_list(chat)
 end
if matches[1] == "banlist" and is_mod(msg) or matches[1] == "Banlist" and is_mod(msg) or matches[1] == "لیست بن" and is_mod(msg) then
  return banned_list(chat)
     end
  end
end
return {
 patterns = {
 "^[!/#]([Bb]anall)$",
  "^([Bb]anall)$",
  "^[!/#](بنگلوبال)$",
  "^[!/#]([Bb]anall) (.*)$",
  "^([Bb]anall) (.*)$",
  "^(بنگلوبال) (.*)$",
  "^[!/#]([Uu]nbanall)$",
  "^([Uu]nbanall)$",
  "^(ان بنگلوبال)$",
  "^[!/#]([Uu]nbanall) (.*)$",
  "^([Uu]nbanall) (.*)$",
  "^(ان بنگلوبال) (.*)$",
  "^[!/#]([Gg]banlist)$",
  "^([Gg]banlist)$",
  "^(لیست بنگلوبال)$",
  "^[!/#]([Bb]an)$",
  "^([Bb]an)$",
  "^(بن)$",
  "^[!/#]([Bb]an) (.*)$",
  "^([Bb]an) (.*)$",
  "^(بن) (.*)$",
  "^[!/#]([Uu]nban)$",
  "^([Uu]nban)$",
  "^(ان بن)$",
  "^[!/#]([Uu]nban) (.*)$",
  "^([Uu]nban) (.*)$",
  "^(ان بن) (.*)$",
  "^[!/#]([Bb]anlist)$",
  "^([Bb]anlist)$",
  "^(لیست بن)$",
  "^[!/#]([Ss]ilent)$",
  "^([Ss]ilent)$",
  "^(خفه)$",
  "^[!/#]([Ss]ilent) (.*)$",
  "^([Ss]ilent) (.*)$",
  "^(خفه) (.*)$",
  "^[!/#]([Uu]nsilent)$",
  "^([Uu]nsilent)$",
  "^(ان خفه)$",
  "^[!/#]([Uu]nsilent) (.*)$",
  "^([Uu]nsilent) (.*)$",
  "^(ان خفه) (.*)$",
  "^[!/#]([Ss]ilentlist)$",
  "^([Ss]ilentlist)$",
  "^(لیست خفه)$",
  "^[!/#]([Kk]ick)$",
  "^([Kk]ick)$",
  "^(کیک)$",
  "^[!/#]([Kk]ick) (.*)$",
  "^([Kk]ick) (.*)$",
  "^(کیک) (.*)$",
  "^[!/#]([Dd]elall)$",
  "^([Dd]elall)$",
  "^(حذف همه)$",
  "^[!/#]([Dd]elall) (.*)$",
  "^([Dd]elall) (.*)$",
  "^(حذف همه) (.*)$",
  "^[!/#]([Cc]lean) (.*)$",
  "^([Cc]lean) (.*)$",
  "^(پاک کردن) (.*)$",
 },
 run = run,
pre_process = pre_process
}
--End BanHammer.lua--
