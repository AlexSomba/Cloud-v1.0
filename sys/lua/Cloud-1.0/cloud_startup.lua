-- cloud_server.lua --

--[[
	I have commented everything as much as I thought necessary, if you have any questions please PM me on Unreal Software.
	My U.S.G.N. ID is xxxxx, my current username is Cloud (it will probably remain so).
]]--

--[[
	WARNING:
	Do not touch anything in this file. This file is part of the CLOUD core.
	Anything you wish to change can be done using plugins! Many useful actions and filters have been added
	so you can even change function outcomes from outside of the core.
	Check (@TODO add url) to learn more
	BE WARNED.
]]--

--[[
	Checks where the script is located
	@return string
]]
function scriptPath()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*/)")
end

-- This will make sure the folder name of where CLOUD is located gets used in _DIR
local path = scriptPath()
path = string.sub(path,1,-2)
sys, lua, path = path:match("([^,]+)/([^,]+)/([^,]+)")

-- Dofiling a script in CLOUD for some reason (I made the plugin crap for that, so you have no reason to do it) you can use this as the path!
_DIR = "sys/lua/"..path.."/"

print("\169100255255[CLOUD]: Setting the settings..")
dofile(_DIR.."cloud_settings.lua")
print("\169100255255[CLOUD]: Configuring the configuration..")
dofile(_DIR.."cloud_config.lua")
print("\169100255255[CLOUD]: Hooking the hooks..")
dofile(_DIR.."cloud_hooks.lua")
print("\169100255255[CLOUD]: Functioning the functions..")
dofile(_DIR.."cloud_functions.lua")
print("\169100255255[CLOUD]: Loading say commands..")
dofile(_DIR.."cloud_sayCommands.lua")
print("\169100255255[CLOUD]: Loading console commands..")
dofile(_DIR.."cloud_consoleCommands.lua")
print("\169100255255[CLOUD]: Loading data..")
dofileLua(_DIR.."data/data_cloud.lua", true)
dofileLua(_DIR.."data/data_group.lua", true)
dofileLua(_DIR.."data/data_player.lua", true)
dofileLua(_DIR.."data/data_plugin.lua", true)
print("\169100255255[CLOUD]: Checking first use..")
checkInitialAuth()
print("\169100255255[CLOUD]: Loading plugins..")
loadPlugins()
print("\169100255255[CLOUD]: Versioning the version..?")
checkVersion()
setTransferList(cloud.setting.transferlist_response)

-- You may remove this, but I'd rather you not. People can't see it anyway.
print(" ")
print("\169100255255[CLOUD]: Thank you for using CLOUD.")
print("\169100255255[CLOUD]: Creator: Cloud, U.S.G.N. ID xxxxx.")

function addhook()
	cloudPrint("The addhook() function is depreciated, use action() or filter() instead!", "warning")
	return
end
