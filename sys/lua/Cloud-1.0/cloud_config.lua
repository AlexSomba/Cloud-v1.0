-- cloud_config.lua --

-- General configuration. This is seen as the general server setup, for more information please visit https://github.com/AlexSomba//docs
-- NOTE: If you are a Windows user and you cannot establish connection to get the current live verion please install Git (https://git-scm.com) and make sure you enable the use of Unix tools in the Windows terminal
cloud.setting.check_version = true
cloud.setting.update_version = false -- Currently not in use

-- The prefix for say commands. The prefix / is reserved by Counter-Strike 2D and cannot be used
cloud.setting.say_prefix = "!"

-- The prefix for all outputting methods unless overwritten
cloud.setting.message_prefix = "[CLOUD]: "

-- Fallback for undefined variables, it is recommended to keep this default unless you know what you're getting into
cloud.setting.group_default = "default"

-- Time and date variables used in log files
cloud.setting.date = os.date("%d").."-"..os.date("%m").."-"..os.date("%Y")
cloud.setting.time = os.date("%H:%M:%S")

-- Enables/disables the use of @C, true enables the use, false disables the use
cloud.setting.at_c = false
cloud.setting.at_c_replacement = "at_c"

-- Enables/disables the saving of the mute time.This keeps the player muted even after he rejoins. Will only work on people that are logged into a U.S.G.N. account
cloud.setting.mute_save = true

-- The default mute time in seconds if none is provided
cloud.setting.mute_time_default = 30

-- The max time a player can be muted for in seconds. If you don't fully trust your administration team to not be dicks, set this to 60 seconds or something ;)
cloud.setting.mute_time_max = 60

-- Enables/disables the response when CLOUD encounters an error when adding a file to the transfer list
cloud.setting.transferlist_response = false -- @TODO: Check if this actuall does what I say it does :ugly:

-- Colours, do not remove these entries! You may add new ones
clr = {
	["cloud"] = {
		["default"] 	= "\169255255255",
		["chat"] 		= "\169255220000",
		["info"] 		= "\169100255255",
		["success"] 	= "\169100255100",
		["warning"] 	= "\169255100100",
		["alert"] 		= "\169255255100"
	},
	["ply"] = {
		["spec"] 		= "\169112128144",
		["t"] 			= "\169255025000",
		["ct"] 			= "\169050150255",
		["tdm"] 		= "\169000255000"
	}
}

-- Constant variables. Used to set player or group fields to a certain value other than a numeric or string
cloud.setting.constant = {
	["false"] = false,
	["true"] = true
}

--[[
	WARNING:
	Do not touch the _PLAYER or _GROUP tables if you do not know how to!
	Everything player and group defined can be changed IN-GAME, so editing this is pretty pointless
	unless you want to define data if data_player or data_group cannot be loaded or are empty.
	I would advise not to do this as data_player and data_group override this data anyway.
	BE WARNED.
]]--

-- This can set default player values if the data_player cannot be loaded
_PLAYER = {
	-- This gives the player with the U.S.G.N. ID 7749 (Me, Cloud, the author) a purple colour. Keep it here if you want me to enjoy the colour purple (purple is my favourite colour, now you know..)
	[7749] = {
		colour = "180000250"
	}
}

-- This sets the default groups if the data_group file cannot be loaded
_GROUP = {
	["admin"] = {
		prefix = "[Admin]",
		colour = "255025000",
		level = 99,
		commands = {
			"all"
			--"group","groupcolour","grouplevel","groupprefix","hardreload","make","plugin",
			--"player","playercolour","playergroup","playerinfo","playerlevel","playerprefix",
			--"unbanall",
			--"softreload" (do not enable, this command crashes the server)
		}
	},
	["globalmod"] = {
		prefix = "[GM]",
		colour = "255025000",
		level = 5,
		commands = {
			"ban","banip","banusgn",
			"bring","bringback",
			"command","credits",
			"equip",
			"goback","god","goto",
			"help",
			"kick","kill",
			"ls",
			"map","mute",
			"pm","prefix",
			"slap","spawn","strip",
			"unban","undo","unmute",
			"usgnregister","usgnpassword"
		}
	},
	["default"] = {
		prefix = "[User]",
		colour = "200200255",
		level = 1,
		commands = {
			"help",
			"auth",
			"usgnlogin"
		}
	},
	["blacklisted"] = {
		colour = "230230250",
		level = -1,
		commands = {
			""
		}
	}
}
