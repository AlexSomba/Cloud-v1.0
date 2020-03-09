-- cloud_settings.lua --

--[[
	WARNING:
	Do not touch anything in this file. All of this is used to keep everything working!
	If you do edit this file, and ask for help without knowing what you have done, I will simply ignore your request
	and encourage others to do so as well.
	BE WARNED.
]]--

_tbl = {}
_id = nil
_txt = nil

cloud = {}
cloud.action = {}
cloud.filter = {}
cloud.player = {}

cloud.plugin = {}
cloud.force_reload = false

cloud.hook = {}
cloud.func = {}
cloud.func.say = {}
cloud.func.console = {}

cloud.say = {}
cloud.say.help = {}
cloud.say.desc = {}

cloud.console = {}
cloud.console.help = {}
cloud.console.desc = {}

cloud.setting = {}

cloud.transferlist = {}

cloud.version = "0.1.0"

_GROUP = {}
_PLAYER = {}
_PLUGIN = {["on"] = {}, ["off"] = {}, ["info"] = {}}
_CLOUD = {auth_token = false, disabled_commands = {}}
