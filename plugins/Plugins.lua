￼
do

-- Returns the key (index) in the config.enabled_plugins table
local function plugin_enabled( name )
  for k,v in pairs(_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  -- If not found
  return false
end

-- Returns true if file exists in plugins folder
local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..'.lua' == v then
      return true
    end
  end
  return false
end

local function list_all_plugins(only_enabled)
  local tmp = check_markdown('\n\n@Arashwolf1')
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    --  ✔ enabled, ❌ disabled
    local status = '*[❌]➣*'
    nsum = nsum+1
    nact = 0
    -- Check if is enabled
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '*[✅]➣*'
      end
      nact = nact+1
    end
    if not only_enabled or status == '*[✅]➣*'then
      -- get the name
      v = string.match (v, "(.*)%.lua")
      text = text..nsum..'.'..status..' '..v..' \n'
    end
  end
  local text = text..'\n\n'..nsum..' *📁plugins installed*\n\n'..nact..' _✔plugins enabled_\n\n'..nsum-nact..' _❌plugins disabled_'..tmp
  return text
end

local function list_plugins(only_enabled)
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    --  ✔ enabled, ❌ disabled
    local status = '*[❌]➣*'
    nsum = nsum+1
    nact = 0
    -- Check if is enabled
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '*[✅]➣*'
      end
      nact = nact+1
    end
    if not only_enabled or status == '*[✅]➣*'then
      -- get the name
      v = string.match (v, "(.*)%.lua")
     -- text = text..v..'  '..status..'\n'
    end
  end
  local text = text.."\n_🍃All Plugins Reloaded🍃_\n\n"..nact.." *✔Plugins Enabled*\n"..nsum.." *📁Plugins Installed*\n\nArash"
return text
end

local function reload_plugins( )
  plugins = {}
  load_plugins()
  return list_plugins(true)
end


local function enable_plugin( plugin_name )
  print('checking if '..check_markdown(plugin_name)..' exists')
  -- Check if plugin is enabled
  if plugin_enabled(plugin_name) then
    return ''..check_markdown(plugin_name)..' _is enabled_'
  end
  -- Checks if plugin exists
  if plugin_exists(plugin_name) then
    -- Add to the config table
    table.insert(_config.enabled_plugins, plugin_name)
    print(plugin_name..' added to _config table')
    save_config()
    -- Reload the plugins
    return reload_plugins( )
  else
    return ''..plugin_name..' _does not exists_'
  end
end

local function disable_plugin( name, chat )
  -- Check if plugins exists
  if not plugin_exists(name) then
    return ' '..check_markdown(name)..' _does not exists_'
  end
  local k = plugin_enabled(name)
  -- Check if plugin is enabled
  if not k then
    return ' '..check_markdown(name)..' _not enabled_'
  end
  -- Disable and reload
  table.remove(_config.enabled_plugins, k)
  save_config( )
  return reload_plugins(true)    
end

local function disable_plugin_on_chat(receiver, plugin)
  if not plugin_exists(plugin) then
    return "_Plugin doesn't exists_"
  end

  if not _config.disabled_plugin_on_chat then
    _config.disabled_plugin_on_chat = {}
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    _config.disabled_plugin_on_chat[receiver] = {}
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = true

  save_config()
  return ' '..plugin..' _disabled on this chat_'
end

local function reenable_plugin_on_chat(receiver, plugin)
  if not _config.disabled_plugin_on_chat then
    return 'There aren\'t any disabled plugins'
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    return 'There aren\'t any disabled plugins for this chat'
  end

  if not _config.disabled_plugin_on_chat[receiver][plugin] then
    return '_This plugin is not disabled_'
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = false
  save_config()
  return ' '..plugin..' is enabled again'
end

local function run(msg, matches)
  -- Show the available plugins
