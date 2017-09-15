￼
﻿--Begin GroupManager.lua By @TiGeeRTM
local function modadd(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return '*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_'
else
     return '》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است.'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
if not lang then
   return '》 *gяøυρ łš αlяeαđч αđđeđ* ‼️\n*〰〰〰〰〰〰〰〰*\n🗯_The robot is already in the group, the robot was is no longer need to do not_'
else
return '》 _ربات در_ #لیست _گروه ربات از قبل بود_ ‼️\n*〰〰〰〰〰〰〰〰*\n🗯ربات از قبل در لیست گروه های ربات بود است دیگر نیازی به این‌کار نیست.'
  end
end
        -- create data array in moderation.json
data[tostring(msg.to.id)] = {
      owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
      whitelist ={},
      filterlist ={},
      settings = {
        set_name = msg.to.title,
        lock_link = 'yes',
        lock_join = 'no',
        lock_username = 'yes',
        lock_hashtags = 'no',
        lock_spam = 'yes',
        lock_webpage = 'yes',
        lock_markdown = 'no',
        lock_mention = 'no',
        lock_arabic = 'no',
        lock_edit = 'no',
        flood = 'yes',
        lock_bots = 'yes',
        lock_pin = 'no',
        lock_tabchi = 'no',
        welcome = 'no',
        english = 'no',
        views = 'no',
        emoji ='no',
        ads = 'no',
        fosh = 'no',
        mute_forward = 'yes',
        mute_audio = 'no',
        mute_video = 'no',
        mute_contact = 'yes',
        mute_text = 'no',
        mute_photo = 'no',
        mute_gif = 'no',
        mute_location = 'no',
        mute_document = 'no',
        mute_inline = 'no',
        mute_game = 'no',
        mute_tgservice = 'no',
        mute_sticker = 'no',
        mute_voice = 'no',
        mute_all = 'no',
        mute_keyboard = 'yes',
        num_msg_max = 5,
        set_char = 40,
        time_check = 5
      }
    }
 save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
    if not lang then
  return '》 *gяøυρ  ħαš вeeи αđđeđ* 💠\n*〰〰〰〰〰〰〰〰*\n🗯_Group now to list the groups the robot was added_'
else
  return '》 _گروه به_ #لیست _گروه ربات اضافه شده_ 💠\n*〰〰〰〰〰〰〰〰*\n🗯گروه هم اکنون به لیست گروه ربات اضافه شد.'
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return '*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_'
   else
        return '》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است.'
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
  if not lang then
    return '》 *gяøυρ łš иøт αđđeđ* 🚫\n*〰〰〰〰〰〰〰〰*\n🗯_Group from the first to the group list, the robot was not added_'
else
    return '》 _گروه در_ #لیست _گروه ربات  نیست_ 🚫\n*〰〰〰〰〰〰〰〰*\n🗯گروه از اول به لیست گروه ربات اضافه نشده بود.'
   end
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '》 *gяøυρ ħαš вeeи яeмøνeđ* 💠\n*〰〰〰〰〰〰〰〰*\n🗯_The group now from the list of groups, the robot was removed_'
 els
 e
  return '》 _گروه از_ #لیست _گروه های ربات حدف شد_ 💠\n*〰〰〰〰〰〰〰〰*\n🗯گروه هم اکنون از لیست گروه ربات حذف شد.'
end
end

 local function config_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
  print(serpent.block(data))
   for k,v in pairs(data.members_) do
   local function config_mods(arg, data)
       local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    return
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   end
tdcli_function ({
    ID = "GetUser",
    user_id_ = v.user_id_
  }, config_mods, {chat_id=arg.chat_id,user_id=v.user_id_})
 
if data.members_[k].status_.ID == "ChatMemberStatusCreator" then
owner_id = v.user_id_
   local function config_owner(arg, data)
  print(serpent.block(data))
       local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    return
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   end
tdcli_function ({
    ID = "GetUser",
    user_id_ = owner_id
  }, config_owner, {chat_id=arg.chat_id,user_id=owner_id})
   end
end
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_All group admins has been promoted and group creator is now group owner_", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تمام ادمین های گروه به مقام مدیر منتصب شدند و سازنده گروه به مقام مالک گروه منتصب شد_", 0, "md")
     end
 end
 
local function filter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.to.id)]['filterlist'][(word)] then
   if not lang then
         return "#》_ωøяκ_ *"..word.."* _łš αlяeαđч fłlтeяeđ_ ⚠️"
            else
         return "#》_کلمه_ *"..word.."* _از قبل فیلتر بود_⚠️"
    end
end
   data[tostring(msg.to.id)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
         return "#》_ωøяκ_ *"..word.."* _αđđ тø fłlтeяeđ ωøяđš lłšт_ ✔️"
            else
         return "#》_کلمه_ *"..word.."* _به لیست کلمات فیلتر اضافه شد_✔️"
    end
end

local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.to.id)]['filterlist'][word] then
      data[tostring(msg.to.id)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
         return "#》_ωøяκ_ *"..word.."* _яeмøνeđ fяαм fłlтeяeđ ωøяκ lłšт_ ❌"
       elseif lang then
         return "#》_کلمه_ *"..word.."* _از لیست کلمات فیلتر حذف شد_❌"
     end
      else
       if not lang then
         return "#》_ωøяκ_ *"..word.."* _łš иøт fłlтeяeđ_ ❗️"
       elseif lang then
         return "#》_کلمه_ *"..word.."* _از قبل فیلتر نبود_❗️"
      end
   end
end

local function modlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return "_Group is not added_"
 else
    return "گروه به لیست گروه های مدیریتی ربات اضافه نشده است"
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
  if not lang then
  return "_No_ *moderator* _in this group_"
else
   return "در حال حاضر هیچ مدیری برای گروه انتخاب نشده است"
  end
end
if not lang then
   message = '*List of moderators :*\n'
else
   message = '*لیست مدیران گروه :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
if not lang then
    return "_Group is not added_"
else
return "گروه به لیست گروه های مدیریتی ربات اضافه نشده است"
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
 if not lang then
    return "_No_ *owner* _in this group_"
else
    return "در حال حاضر هیچ مالکی برای گروه انتخاب نشده است"
  end
end
if not lang then
   message = '*List of owners :*\n'
else
   message = '*لیست مالکین گروه :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end


local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
  if not administration[tostring(data.chat_id_)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 *gяøυρ łš иøт αđđeđ* 🚫\n*〰〰〰〰〰〰〰〰*\n🗯_Group from the first to the group list, the robot was not added_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 _گروه در_ #لیست _گروه ربات  نیست_ 🚫\n*〰〰〰〰〰〰〰〰*\n🗯گروه از اول به لیست گروه ربات اضافه نشده بود.", 0, "md")
     end
  end
  if cmd == "setmanager" then
local function manager_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  channel_set_admin(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is now the_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *ادمین گروه شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, manager_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
if cmd == "remmanager" then
local function rem_manager_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  channel_demote(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is no longer_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از ادمینی گروه برکنار شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_manager_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "setwhitelist" then
local function setwhitelist_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."*
    _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *به لیست سفید اضافه شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, setwhitelist_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
if cmd == "remwhitelist" then
local function remwhitelist_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از لیست سفید حذف شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, remwhitelist_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》 👤_υšeя _ : "..user_name.." *"..data.id.."* _łš αlяeαđч gяøυρ øωиeя_⚠️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر"..user_name.." *"..data.id_.."* *از قبل مدیر بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøω тħe_ *gяøυρ øωиeя* ✔️", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *مدیر گروه شد*✔️", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš αlяeαđч_ *мøđeяαтøя*⚠️", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..dat
    a.id_.."* *از قبل معاون گروه بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøω тħe_ *gяøυρ ρяøмøтe*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *معاون گروه شد*✔️", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøт α_ *gяøυρ øωиeя*❌", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل مدیر نبود*❌", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš đeмøтe øf_ *gяøυρ øωиeя*✔️", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام مدیر برکنار شد*✔️", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøт α_ *мøđeяαтøя*❗️", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون نبود*❗️", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _ħαš вeeи_ *đeмøтeđ*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام معاون گروه برکنار شد*✔️", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "id" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "", 0, "md")
      end
   end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 *gяøυρ łš иøт αđđeđ* 🚫\n*〰〰〰〰〰〰〰〰*\n🗯_Group from the first to the group list, the robot was not added_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 _گروه در_ #لیست _گروه ر
    بات  نیست_ 🚫\n*〰〰〰〰〰〰〰〰*\n🗯گروه از اول به لیست گروه ربات اضافه نشده بود.", 0, "md")
     end
  end
if not arg.username then return false end
   if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
if cmd == "setmanager" then
  channel_set_admin(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is now the_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *ادمین گروه شد*", 0, "md")
   end
end
if cmd == "remmanager" then
  channel_demote(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is no longer_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از ادمینی گروه برکنار شد*", 0, "md")
   end
 end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *به لیست سفید اضافه شد*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از لیست سفید حذف شد*", 0, "md")
   end
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》 _υšeя _ 👤: "..user_name.."\n łđ : *"..data.id.."* _łš αlяeαđч gяøυρ øωиeя-⚠️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر"..user_name.." *"..data.id_.."* *از قبل مدیر بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøω тħe_ *gяøυρ øωиeя* ✔️", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *مدیر گروه شد*✔️", 0, "md")   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id,
    "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš αlяeαđч_ *мøđeяαтøя*⚠️", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون گروه بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _нαѕ вєєη_ *ρяσмσтє∂*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *معاون گروه شد*✔️", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _ιѕ ησт α_ *gяøυρ øωиeя*❌", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل مدیر نبود*❌", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš đeмøтe øf_ *gяøυρ øωиeя*✔️", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام مدیر برکنار شد*✔️", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøт α_ *мøđeяαтøя*❗️", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون نبود*❗️", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _ħαš вeeи_ *đeмøтeđ*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام معاون گروه برکنار شد*✔️", 0, "md")
   end
end
   if cmd == "id" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
    if cmd == "res" then
    if not lang then
     text = "》 *яešυlт føя*📄 [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. ""..check_markdown(data.title_).."\n"
    .. " ["..data.id_.."]"
  else
     text = "》 _اطلاعات برای_📄 [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
         end
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
      end
   end
end

local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 *gяøυρ łš иøт αđđeđ* 🚫\n*〰〰〰〰〰〰〰〰*\n🗯_Group from the first to the group list, the robot was not added_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 _گروه در_ #لیست _گروه ربات  نیست_ 🚫\n*〰〰〰〰〰〰〰〰*\n🗯گروه از اول به لیست گروه ربات اضافه نشده بود.", 0, "md")
     end
  end
if not tonumber(arg.user_id) then return false end
   if data.id_ then
if data.first_name_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if cmd == "setmanager" then
  channel_set_admin(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is now the_ *group manag
  er*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *ادمین گروه شد*", 0, "md")
   end
end
if cmd == "remmanager" then
  channel_demote(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is no longer_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از ادمینی گروه برکنار شد*", 0, "md")
   end
 end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *به لیست سفید اضافه شد*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از لیست سفید حذف شد*", 0, "md")
   end
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》 _υšeя _ 👤: "..user_name.."\n łđ : *"..data.id.."* _łš αlяeαđч gяøυρ øωиeя-⚠️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر"..user_name.." *"..data.id_.."* *از قبل مدیر بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøω тħe_ *gяøυρ øωиeя* ✔️", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *مدیر گروه شد*✔️", 0, "md")   end
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš αlяeαđч_ *мøđeяαтøя*⚠️", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون گروه بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _нαѕ вєєη_ *ρ
    яσмσтє∂*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *معاون گروه شد*✔️", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _ιѕ ησт α_ *gяøυρ øωиeя*❌", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل مدیر نبود*❌", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš đeмøтe øf_ *gяøυρ øωиeя*✔️", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام مدیر برکنار شد*✔️", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøт α_ *мøđeяαтøя*❗️", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون نبود*❗️", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _ħαš вeeи_ *đeмøтeđ*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام معاون گروه برکنار شد*✔️", 0, "md")
   end
end
    if cmd == "whois" then
if data.username_ then
username = '@'..check_markdown(data.username_)
else
if not lang then
username = '》 *иøт føυиđ❗️*'
 else
username = '》 _ندارد❗️_'
  end
end
     if not lang then
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'Iηƒσ ƒσя📃 [ '..data.id_..' ] :\n👤υšeяNαмє : '..username..'\n💎Nαмє : '..data.first_name_, 1)
   else
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'اطلاعات برای📃  [ '..data.id_..' ] :\n👤یوزرنیم : '..username..'\n💎نام : '..data.first_name_, 1)
      end
   end
 else
    if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
    end
  end
end

local function delmsg (TiGeR,Arash)
    msgs = TiGeR.msgs 
    for k,v in pairs(Arashstar.messages_) do
        msgs = msgs - 1
        tdcli.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
        if msgs == 1 then
            tdcli.deleteMessages(Arash.messages_[0].chat_id_,{[0] = Arash.messages_[0].id_}, dl_cb, cmd)
            return false
        end
    end
    tdcli.getChatHistory(MahDiRoO.messages_[0].chat_id_, Arash.messages_[0].id_,0 , 100, delmsg, {msgs=msgs})
end

---------------Lock Link-------------------
local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
if not lang then
 return "》*#lø¢κ* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "Arash").."]"
elseif lang then
 return "》ارسال #لینک در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "arash").."]"
end
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "》*#lø¢κ* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "
 》ارسال #لینک در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
if not lang then
return "》*#lø¢κ* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "》ارسال #لینک در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "》*#lø¢κ* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "》ارسال #لینک در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Join-------------------
local function lock_join(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "شما مدیر گروه نمیباشید"
end
end

local lock_join = data[tostring(target)]["settings"]["lock_join"] 
if lock_join == "yes" then
if not lang then
 return "*Lock Join* _Is Already Locked_"
elseif lang then
 return "ورود به گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_join"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Lock Join* _Has Been Locked_"
else
 return "ورود به گروه ممنوع شد"
end
end
end

local function unlock_join(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "شما مدیر گروه نمیباشید"
end 
end

local lock_join = data[tostring(target)]["settings"]["lock_join"]
 if lock_join == "no" then
if not lang then
return "*Lock Join* _Is Not Locked_" 
elseif lang then
return "ورود به گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_join"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*Lock Join* _Has Been Unlocked_" 
else
return "ورود به گروه آزاد شد"
end
end
end

---------------Lock username-------------------
local function lock_username(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_username = data[tostring(target)]["settings"]["lock_username"] 
if lock_username == "yes" then
if not lang then
 return "》*#υšeяиαмe* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "》ارسال #یوزرنیم در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["lock_username"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "》*#υšeяиαмe* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "》ارسال #یوزرنیم در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_username(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this comma
nd only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_username = data[tostring(target)]["settings"]["lock_username"]
 if lock_username == "no" then
if not lang then
return "》*#υšeяиαмe* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "》ارسال #یوزرنیم در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_username"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "》*#υšeяиαмe* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "》ارسال #یوزرنیم در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock hashtags-------------------
local function lock_hashtags(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_hashtags = data[tostring(target)]["settings"]["lock_hashtags"] 
if lock_hashtags == "yes" then
if not lang then
 return "》*#ħαšħтαg* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "》ارسال #هشتگ و یوزرنیم در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["lock_hashtags"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "》*#ħαšħтαg* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "》ارسال #هشتگ در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_hashtags(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_hashtags = data[tostring(target)]["settings"]["lock_hashtags"]
 if lock_hashtags == "no" then
if not lang then
return "》*#ħαšħтαg* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"  
elseif lang then
return "》ارسال #هشتگ در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_hashtags"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "》*#ħαšħтαg* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "》ارسال #هشتگ درگروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Vewis-------------------
local function lock_views(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_views = data[tostring(target)]["settings"]["views"] 
if lock_views == "yes" then
if not lang then
 return "#νłeωš _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "ارسال #پست ویو دار در گروه هم
 اکنون ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["views"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "#νłeωš _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "ارسال #پست ویو دار در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_views(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_views = data[tostring(target)]["settings"]["views"]
 if lock_views == "no" then
if not lang then
return "#νłeωš _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "ارسال #پست ویو دار در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\n🗯ارسال ویو از قبل ممنوع نبود و پست های داری ویو پاک نمیشدند.\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["views"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "#νłeωš _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "ارسال #پست ویو دار در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock English-------------------
local function lock_english(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_english = data[tostring(target)]["settings"]["english"] 
if lock_english == "yes" then
if not lang then
 return "*#eиglłšħ* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "نوشته #انگلیسی در گروه از قبل ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["english"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#eиglłšħ* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "نوشته انگلیسی در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_english(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_english = data[tostring(target)]["settings"]["english"]
 if lock_english == "no" then
if not lang then
return "*#eиglłšħ* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"  
elseif lang then
return "نوشته انگلیسی در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["english"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#eиglłšħ* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "نوشته انگلیسی در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
--------
-------Lock Emoji-------------------
local function lock_emoji(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_emoji = data[tostring(target)]["settings"]["emoji"] 
if lock_emoji == "yes" then
if not lang then
 return "*#eмøנł* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "نوشته #ایموجی در گروه از قبل ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["emoji"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#eмøנł* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "نوشته #ایموجی در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_emoji(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_emoji = data[tostring(target)]["settings"]["emoji"]
 if lock_emoji == "no" then
if not lang then
return "*#eмøנł* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"  
elseif lang then
return "نوشته #ایموجی در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["emoji"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#eмøנł* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "نوشته #ایموجی در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Ads-------------------
local function lock_ads(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_ads = data[tostring(target)]["settings"]["ads"] 
if lock_ads == "yes" then
if not lang then
 return "*#αđš* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "ارسال #تبلیغات در گروه از قبل ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["ads"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*@αđš* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "ارسال #تبلیغات در گروه ممنوع شد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_ads(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_ads = data[tostring(target)]["settings"]["ads"]
 if lock_ads == "no" then
if not lang then
return "*#αđš* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or
"MahDiRoO").."]"  
elseif lang then
return "ارسال #تبلیغات در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["ads"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#αđš* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "ارسال #تبلیغات در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Fosh-------------------
local function lock_fosh(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_fosh = data[tostring(target)]["settings"]["fosh"] 
if lock_fosh == "yes" then
if not lang then
 return "#føšħ _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "ارسال #کلمات رکیک در گروه هم اکنون ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["fosh"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "#føšħ _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "ارسال #کلمات رکیک در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_fosh(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_fosh = data[tostring(target)]["settings"]["fosh"]
 if lock_fosh == "no" then
if not lang then
return "#føšħ _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "ارسال #کلمات رکیک در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["fosh"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "#føšħ _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "ارسال #کلمات رکیک در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
if not lang then
 return "*#мeитłøи* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "ارسال #فراخوانی در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
if not lang then 
 return "*#мeитłøи* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else 
 return "ارسال #فراخوانی در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "M
 ahDiRoO").."]"
end
end
end

local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
if not lang then
return "*#мeитłøи* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"  
elseif lang then
return "ارسال #فراخوانی در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#мeитłøи* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "ارسال #فراخوانی در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

---------------Lock Arabic--------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
if not lang then
 return "*#αяαвł¢* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "ارسال #کلمات فارسی در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#αяαвł¢* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "ارسال #کلمات فارسی در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
if not lang then
return "*#αяαвł¢* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"  
elseif lang then
return "ارسال #کلمات فارسی در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#αяαвł¢* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "ارسال #کلمات فارسی در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if l
ock_edit == "yes" then
if not lang then
 return "*#eđłтłиg* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "قفل #ویرایش پیام در گروه  از قبل ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#eđłтłиg* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "قفل #ویرایش پیام در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
if not lang then
return "*#eđłтłиg* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "قفل #ویرایش پیام در گروه از قبل ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#eđłтłиg* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "قفل #ویرایش پیام در گروه ازاد است🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
if not lang then
 return "*#šραм* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "ارسال #هرزنامه ( اسپم) در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#šραм* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "ارسال #هرزنامه ( اسپم) در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
if not lang then
return "*#šραм* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"  
elseif lang then
 return "ارسال #هرزنامه (اسپم) در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" 
save_data(_config.moderation.data, data)
if not lang then 
return "*#šραм* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(m
sg.from.username or "MahDiRoO").."]" 
else
 return "ارسال #هرزنامه (اسپم) در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
if not lang then
 return "*#fløøđłиg* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "ارسال #پیام مکرر در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#fløøđłиg* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "ارسال # پیام مکرر در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
if not lang then
return "*#fløøđłиg* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "ارسال #پیام مکرر در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#fløøđłиg*  _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "ارسال #پیام مکرر در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
 return "*#вøт* _ρяøтe¢тłøи łš αlяeαđч eиαвleđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "#محافظت از گروه در برابر ربات ها از قبل فعال است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#вøт* _ρяøтe¢тłøи øи ħαš вeeи eиαвleđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "#محافظت از گروه در برابر ربات ها  فعال شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷
\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
return "*#вøт* _ρяøтe¢тłøи łš иøт đłšαвleđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "محافظت از گروه در برابر ربات ها غیر فعال است\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#вøт* _ρяøтe¢тłøи ħαš вeeи đłšαвleđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "#محافظت از گروه در برابر ربات ها  ازاد است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
if not lang then 
 return "*#мαяκđøωи* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "ارسال #پیام دارای فونت در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мαяκđøωи* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "ارسال #پیام دارای فونت در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
if not lang then
return "*#мαяκđøωи* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "ارسال #پیام دارای فونت در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#мαяκđøωи* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
return "ارسال #پیام درای فونت در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
if not lang then
 return "*#ωel¢øмe* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "ارسال #صفحات وب در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@
 "..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#ωel¢øмe* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "ارسال #صفحات وب در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
if not lang then
return "*#ωel¢øмe* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "ارسال #صفحات وب در گروه  از قبل ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\n🗯سفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*#ωel¢øмe* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "ارسال #صفحات وب در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Lock Pin-------------------
local function lock_pin(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == "yes" then
if not lang then
 return "*#ρłииeđ мeššαge* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "سنجاق کردن پیام در گروه از قبل ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["lock_pin"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#ρłииeđ мeššαge* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "سنجاق کردن پیام در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_pin(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
if not lang then
return "*#ρłииeđ мeššαge* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "سنجاق کردن پیام در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*#ρłииeđ мeššαge* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "سنجاق کردن پیام در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
--------------Lock Tabchi-------------
local function lock_tabchi(msg,
data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_tabchi = data[tostring(target)]["settings"]["lock_tabchi"] 
if lock_tabchi == "yes" then
if not lang then
 return "*#тαв¢ħł* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "اوردن تبچی در گروه هم اکنون ممنوع است\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
data[tostring(target)]["settings"]["lock_tabchi"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#тαв¢ħł* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "اوردن تبچی در گروه ممنوع شد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unlock_tabchi(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_tabchi = data[tostring(target)]["settings"]["lock_tabchi"]
 if lock_tabchi == "no" then
if not lang then
return "*#тαв¢ħł* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "اوردن تبچی در گروه ممنوع نمیباشد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["lock_tabchi"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#тαв¢ħł* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "اوردن تبچی در گروه آزاد شد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

--------Mutes---------
---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_gif = data[tostring(target)]["settings"]["mute_gif"] 
if mute_gif == "yes" then
if not lang then
 return "*#мυтe głf* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #تصاویر متحرک  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then 
 return "*#мυтe głf* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "بیصدا کردن #تصاویر متحرک فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unmute_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_gif = data[tostring(target)]["settings"]["mute_gif"]
 if mute_gif == "no" then
if not lang then
return "*#мυтe głf* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]
" 
elseif lang then
return "بیصدا کردن #تصاویر متحرک فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe głf* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "بیصدا کردن # تصاویر متحرک غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_game = data[tostring(target)]["settings"]["mute_game"] 
if mute_game == "yes" then
if not lang then
 return "*#мυтe gαмe* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #بازی های تحت وب  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe gαмe* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "بیصدا کردن #بازی های تحت وب   فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local mute_game = data[tostring(target)]["settings"]["mute_game"]
 if mute_game == "no" then
if not lang then
return "*#мυтe gαмe* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "بیصدا کردن #بازی های تحت وب   فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*#мυтe gαмe* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "بیصدا کردن #بازی های تحت وب  غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_inline = data[tostring(target)]["settings"]["mute_inline"] 
if mute_inline == "yes" then
if not lang then
 return "*#мυтe łиlłиe* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #کیبورد شیشه ای از قبل فعال است🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe łиlłиe* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "بیصدا کردن #کیبورد شیشه ای فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.f
 " 
elseif lang then
return "بیصدا کردن #تصاویر متحرک فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe głf* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "بیصدا کردن # تصاویر متحرک غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_game = data[tostring(target)]["settings"]["mute_game"] 
if mute_game == "yes" then
if not lang then
 return "*#мυтe gαмe* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #بازی های تحت وب  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe gαмe* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "بیصدا کردن #بازی های تحت وب   فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local mute_game = data[tostring(target)]["settings"]["mute_game"]
 if mute_game == "no" then
if not lang then
return "*#мυтe gαмe* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "بیصدا کردن #بازی های تحت وب   فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*#мυтe gαмe* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "بیصدا کردن #بازی های تحت وب  غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_inline = data[tostring(target)]["settings"]["mute_inline"] 
if mute_inline == "yes" then
if not lang then
 return "*#мυтe łиlłиe* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #کیبورد شیشه ای از قبل فعال است🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe łиlłиe* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "بیصدا کردن #کیبورد شیشه ای فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.f
 rom.username or "MahDiRoO").."]"
end
end
end

local function unmute_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_inline = data[tostring(target)]["settings"]["mute_inline"]
 if mute_inline == "no" then
if not lang then
return "*#мυтe łиlłиe* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "بیصدا کردن #کیبورد شیشه ای فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe łиlłиe* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "بیصدا کردن #کیبورد شیشه ای  غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_text = data[tostring(target)]["settings"]["mute_text"] 
if mute_text == "yes" then
if not lang then
 return "*#мυтe тeχт* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #متن  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe тeχт* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "بیصدا کردن #متن فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unmute_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local mute_text = data[tostring(target)]["settings"]["mute_text"]
 if mute_text == "no" then
if not lang then
return "*#мυтe тeχт* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
return "بیصدا کردن # متن فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
end
else 
data[tostring(target)]["settings"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe тeχт* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "بیصدا کردن # متن غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Mute photo-------------------
local function mute_photo(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_photo = data[tostring(target)]["settings"]["mute_photo"] 
if mute_photo == "yes" then
if not lang then
 return "*#мυтe ρħøтø* _łš d
 lяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #عکس  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe ρħøтø* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "بیصدا کردن #عکس فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unmute_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end
 
local mute_photo = data[tostring(target)]["settings"]["mute_photo"]
 if mute_photo == "no" then
if not lang then
return "*#мυтe ρħøтø* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "بیصدا کردن #عکس فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe ρħøтø* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "بیصدا کردن # عکس غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Mute Video-------------------
local function mute_video(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_video = data[tostring(target)]["settings"]["mute_video"] 
if mute_video == "yes" then
if not lang then
 return "*#мυтe νłđeø* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #ویدیو  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then 
 return "*#мυтe νłđeø* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "بیصدا کردن #ویدیو فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_video = data[tostring(target)]["settings"]["mute_video"]
 if mute_video == "no" then
if not lang then
return "*#мυтe νłđeø* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "بیصدا کردن #ویدیو فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe νłđeø* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "بیصدا کردن #ویدیو غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiR
\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "بیصدا کردن #صدا (وویس) فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*#мυтe νøł¢e* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
else
return "بیصدا کردن #صدا (وویس) غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end
---------------Mute Sticker-------------------
local function mute_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_sticker = data[tostring(target)]["settings"]["mute_sticker"] 
if mute_sticker == "yes" then
if not lang then
 return "*#мυтe šтł¢κeя* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #استیکر  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe šтł¢κeя* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO"…
 oO").."]"
end
end
end
---------------Mute Audio-------------------
local function mute_audio(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_audio = data[tostring(target)]["settings"]["mute_audio"] 
if mute_audio == "yes" then
if not lang then
 return "*#мυтe αυđłø* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #اهنگ  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe αυđłø* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else 
return "بیصدا کردن #اهنگ فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unmute_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_audio = data[tostring(target)]["settings"]["mute_audio"]
 if mute_audio == "no" then
if not lang then
return "*#мυтe αυđłø* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
elseif lang then
return "بیصدا کردن #اهنگ فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else 
data[tostring(target)]["settings"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*#мυтe αυđłø* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
return "بیصدا کردن #اهنگ غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]" 
end
end
end
---------------Mute Voice-------------------
local function mute_voice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_voice = data[tostring(target)]["settings"]["mute_voice"] 
if mute_voice == "yes" then
if not lang then
 return "*#мυтe νøł¢e* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
elseif lang then
 return "بیصدا کردن #صدا (وویس)  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
else
 data[tostring(target)]["settings"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe νøł¢e* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
else
 return "بیصدا کردن #صدا (وویس)  فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "MahDiRoO").."]"
end
end
end

local function unmute_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_voice = data[tostring(target)]["settings"]["mute_voice"]
 if mute_voice == "no" then
if not lang then
return "*#мυтe νøł¢e* _łš иøт đłšαвleđ_🔊
