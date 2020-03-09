-- cloud_hooks.lua --

--[[
	WARNING:
	Do not touch anything in this file. This file is part of the CLOUD core.
	Anything you wish to change can be done using plugins! Many useful actions and filters have been added
	so you can even change function outcomes from outside of the core.
	Check (@TODO add url) to learn more
	BE WARNED.
]]--

function cloud.hook.always()
	action("always")
end

function cloud.hook.attack(id)
	action("attack", id)
end

function cloud.hook.attack2(id, mode)
	action("attack2", id, mode)
end

function cloud.hook.bombdefuse(id)
	action("bombdefuse", id)

    return filter("bombdefuse", id) or 0
end

function cloud.hook.bombexplode(id, tilex, tiley)
	action("bombexplode", id, tilex, tiley)

    return filter("bombexplode", id, tilex, tiley) or 0
end

function cloud.hook.bombplant(id, tilex, tiley)
	action("bombplant", id, tilex, tiley)

    return filter("bombplant", id, tilex, tiley) or 0
end

function cloud.hook.destroy(tilex, tiley, id) -- cloud.hook.break
	action("destroy", tilex, tiley, id)
end

function cloud.hook.build(id, type, tilex, tiley, mode, objectid)
	action("build", id, type, tilex, tiley, mode, objectid)

    return filter("build", id, type, tilex, tiley, mode, objectid) or 0
end

function cloud.hook.buildattempt(id, type, tilex, tiley, mode)
	action("buildattempt", id, type, tilex, tiley, mode)

    return filter("buildattempt", id, type, tilex, tiley, mode) or 0
end

function cloud.hook.buy(id, weapon)
	action("buy", id, weapon)

    return filter("buy", id, weapon) or 0
end

function cloud.hook.clientdata(id, mode, data1, data2)
	action("clientdata", id, mode, data1, data2)
end

function cloud.hook.collect(id, iid, type, ain, a, mode)
	action("collect", id, iid, type, ain, a, mode)
end

function cloud.hook.die(victim, killer, weapon, x, y, objectid)
	action("die", victim, killer, weapon, x, y, objectid)

    return filter("die", victim, killer, weapon, x, y, objectid) or 0
end

function cloud.hook.dominate(id, team, tilex, tiley)
	action("dominate", id, team, tilex, tiley)

    return filter("dominate", id, team, tilex, tiley) or 0
end

function cloud.hook.drop(id, iid, type, ain, a, mode, tilex, tiley)
	action("drop", id, iid, type, ain, a, mode, tilex, tiley)

    return filter("drop", id, iid, type, ain, a, mode, tilex, tiley) or 0
end

function cloud.hook.endround(mode)
	action("endround", mode)
end

function cloud.hook.flagcapture(id, team, tilex, tiley)
	action("flagcapture", id, team, tilex, tiley)

    return filter("flagcapture", id, team, tilex, tiley) or 0
end

function cloud.hook.flagtake(id, team, tilex, tiley)
	action("flagtake", id, team, tilex, tiley)

    return filter("flagtake", id, team, tilex, tiley) or 0
end

function cloud.hook.flashlight(id, mode)
	action("flashlight", id, mode)
end

function cloud.hook.hit(id, source, weapon, hpdmg, apdmg, rawdmg, object)
	if cloud.player[id].god then
		return filter("hitGod", id, source, weapon, hpdmg, apdmg, rawdmg, object) or 1
	end

	action("hit", id, source, weapon, hpdmg, apdmg, rawdmg, object)

    return filter("hit", id, source, weapon, hpdmg, apdmg, rawdmg, object) or 0
end

function cloud.hook.hitzone(imageid, id, objectid, weapon, x, y, damage)
	action("hitzone", imageid, id, objectid, weapon, x, y, damage)

    return filter("hitzone", imageid, id, objectid, weapon, x, y, damage) or 0
end

function cloud.hook.hostagerescue(id, tilex, tiley)
	action("hostagerescue", id, tilex, tiley)
end

function cloud.hook.join(id)
	cloud.player[id] = {}
	cloud.player[id].say = true -- Currently not in use
	cloud.player[id].prefix = true
	cloud.player[id].god = false
	cloud.player[id].mute_time = 0
	cloud.player[id].mute_reason = ""
	cloud.player[id].tp = {}

	if _PLAYER[player(id, "usgn")] and _PLAYER[player(id, "usgn")].mute_time then
		cloud.player[id].mute_time = _PLAYER[player(id, "usgn")].mute_time
		cloud.player[id].mute_reason = _PLAYER[player(id, "usgn")].mute_reason

		cloudMessage(id, "Welcome back! You are still muted for "..cloud.player[id].mute_time.." seconds.", "warning")
		action("joinMute", id)
	end

	action("join", id)
end

function cloud.hook.kill(killer, victim, weapon, x, y, objectid)
	action("kill", killer, victim, weapon, x, y, objectid)
end

function cloud.hook.leave(id)
	cloud.player[id] = {}

	action("leave", id)
end

function cloud.hook.mapchange(map)
	action("mapchange", map)
end

function cloud.hook.menu(id, title, button)
	action("menu", id, title, button)
end

function cloud.hook.minute()
	action("minute")
end

function cloud.hook.move(id, x, y, mode)
	action("move", id, x, y, mode)
end

function cloud.hook.movetile(id, tilex, tiley)
	action("movetile", id, tilex, tiley)
end

function cloud.hook.name(id, oldname, newname, forced)
	action("name", id, oldname, newname, forced)

    return filter("name", id, oldname, newname, forced) or 0
end

function cloud.hook.objectdamage(objectid, damage, id)
	action("objectdamage", objectid, damage, id)

    return filter("objectdamage", objectid, damage, id) or 0
end

function cloud.hook.objectkill(objectid, id)
	action("objectkill", objectid, id)
end

function cloud.hook.objectupgrade(objectid, id, progress, total)
	action("objectupgrade", objectid, id, progress, total)

    return filter("objectupgrade", objectid, id, progress, total) or 0
end

function cloud.hook.parse(text)
	local tbl = toTable(text)
	if not tbl[1] then
		return 0
	end
	local command = tbl[1]

	action("parse", text)
	if checkCommand(command, "console") then
		return 2
	end

    return filter("parse", text) or 0
end

function cloud.hook.projectile(id, weapon, x, y)
	action("projectile", id, weapon, x, y)
end

function cloud.hook.radio(id, message)
	action("radio", id, message)

    return filter("radio", id, message) or 0
end

function cloud.hook.rcon(cmds, id, ip, port)
	local tbl = toTable(cmds)

	if not tbl[1] then
		return 1
	end
	local command = tbl[1]

	if checkCommand(command, "console") then
		executeCommand(false, command, cmds, "console")
	end
	action("rcon", cmds, id, ip, port)

    return filter("rcon", cmds, id, ip, port) or 0
end

function cloud.hook.reload(id, mode)
	action("reload", id, mode)
end

function cloud.hook.say(id, text)
	local tbl = toTable(text)
	local usgn = player(id, "usgn")

	text = text:gsub("\166", "")
	text = text:gsub("|", "")

	if text:sub(1, #cloud.setting.say_prefix) == cloud.setting.say_prefix then
		local command = tbl[1]:sub(#cloud.setting.say_prefix+1)

		if checkCommand(command, "say") then
			if not checkSayCommandUse(command) then
				cloudMessage(id, "This command has been disabled and cannot be used!", "warning")
				return 1
			end
			for k, v in pairs(_GROUP[(_PLAYER[usgn] and _PLAYER[usgn].group or cloud.setting.group_default)].commands) do
				if command == v or v == "all" then
					executeCommand(id, command, text, "say")
					return 1
				end
			end
			if _PLAYER[usgn] and _PLAYER[usgn].commands then
				for k, v in pairs(_PLAYER[usgn].commands) do
					if command == v or v == "all" then
						executeCommand(id, command, text, "say")
						return 1
					end
				end
			end
			cloudMessage(id, "You don't have the permissions to use this command!", "warning")
		else
			cloudMessage(id, "This command doesn't exist!", "warning")
			cloudMessage(id, "Say "..cloud.setting.say_prefix.."help to see the available commands.", "info")
		end
	else
		if cloud.setting.at_c == false then
			text = text:gsub("@C", cloud.setting.at_c_replacement)
		end

		if cloud.player[id].mute_time > 0 then
			cloudMessage(id, "You are still muted for "..cloud.player[id].mute_time.." seconds.", "warning")
			cloudMessage(id, "Reason: "..cloud.player[id].mute_reason, "info")
			return 1
		end

		chat(id, text)
    end
    action("say", id, text)

    return filter("say", id, text) or 1
end

function cloud.hook.sayteam(id, message)
	action("sayteam", id, message)

    return filter("sayteam", id, message) or 0
end

function cloud.hook.select(id, type, mode)
	action("select", id, type, mode)
end

function cloud.hook.serveraction(id, mode)
	action("serveraction", id, mode)
end

function cloud.hook.shieldhit(id, source, weapon, direction, objectid)
	action("shieldhit", id, source, weapon, direction, objectid)
end

function cloud.hook.shutdown()
	action("shutdown")
end

function cloud.hook.spawn(id)
	action("spawn", id)

    return filter("spawn", id) or 0
end

function cloud.hook.specswitch(id, target)
	action("specswitch", id, target)
end

function cloud.hook.spray(id)
	action("spray", id)
end

function cloud.hook.startround(mode)
	action("startround", mode)
end

function cloud.hook.startround_prespawn(mode)
	action("startround_prespawn", mode)
end

function cloud.hook.suicide(id)
	action("suicide", id)

    return filter("suicide", id) or 0
end

function cloud.hook.team(id, team, look)
	action("team", id, team, look)

    return filter("team", id, team, look) or 0
end

function cloud.hook.trigger(trigger, source)
	action("trigger", trigger, source)

    return filter("trigger", trigger, source) or 0
end

function cloud.hook.triggerentity(tilex, tiley)
	action("triggerentity", tilex, tiley)

    return filter("triggerentity", tilex, tiley) or 0
end

function cloud.hook.use(id, event, data, tilex, tiley)
	action("use", id, event, data, tilex, tiley)
end

function cloud.hook.usebutton(id, tilex, tiley)
	action("usebutton", id, tilex, tiley)
end

function cloud.hook.vipescape(id, tilex, tiley)
	action("vipescape", id, tilex, tiley)
end

function cloud.hook.vote(id, mode, param)
	action("vote", id, mode, param)
end

function cloud.hook.walkover(id, iid, type, ain, a, mode)
	action("walkover", id, iid, type, ain, a, mode)

    return filter("walkover", id, iid, type, ain, a, mode) or 0
end

if not skipSoftReload then
	addhook("always", "cloud.hook.always")
	addhook("attack", "cloud.hook.attack")
	addhook("attack2", "cloud.hook.attack2")
	addhook("bombdefuse", "cloud.hook.bombdefuse")
	addhook("bombexplode", "cloud.hook.bombexplode")
	addhook("bombplant", "cloud.hook.bombplant")
	addhook("break", "cloud.hook.destroy")
	addhook("build", "cloud.hook.build")
	addhook("buildattempt", "cloud.hook.buildattempt")
	addhook("buy", "cloud.hook.buy")
	addhook("clientdata", "cloud.hook.clientdata")
	addhook("collect", "cloud.hook.collect")
	addhook("die", "cloud.hook.die")
	addhook("dominate", "cloud.hook.dominate")
	addhook("drop", "cloud.hook.drop")
	addhook("endround", "cloud.hook.endround")
	addhook("flagcapture", "cloud.hook.flagcapture")
	addhook("flagtake", "cloud.hook.flagtake")
	addhook("flashlight", "cloud.hook.flashlight")
	addhook("hit", "cloud.hook.hit")
	addhook("hitzone", "cloud.hook.hitzone")
	addhook("hostagerescue", "cloud.hook.hostagerescue")
	addhook("join", "cloud.hook.join")
	addhook("kill", "cloud.hook.kill")
	addhook("leave", "cloud.hook.leave")
	addhook("mapchange", "cloud.hook.mapchange")
	addhook("menu", "cloud.hook.menu")
	addhook("minute", "cloud.hook.minute")
	addhook("move", "cloud.hook.move")
	addhook("movetile", "cloud.hook.movetile")
	addhook("name", "cloud.hook.name")
	addhook("objectdamage", "cloud.hook.objectdamage")
	addhook("objectkill", "cloud.hook.objectkill")
	addhook("objectupgrade", "cloud.hook.objectupgrade")
	addhook("parse", "cloud.hook.parse")
	addhook("projectile", "cloud.hook.projectile")
	addhook("radio", "cloud.hook.radio")
	addhook("rcon", "cloud.hook.rcon")
	addhook("reload", "cloud.hook.reload")
	addhook("say", "cloud.hook.say")
	addhook("sayteam", "cloud.hook.sayteam")
	addhook("select", "cloud.hook.select")
	addhook("serveraction", "cloud.hook.serveraction")
	addhook("shieldhit", "cloud.hook.shieldhit")
	addhook("shutdown", "cloud.hook.shutdown")
	addhook("spawn", "cloud.hook.spawn")
	addhook("specswitch", "cloud.hook.specswitch")
	addhook("spray", "cloud.hook.spray")
	addhook("startround", "cloud.hook.startround")
	addhook("startround_prespawn", "cloud.hook.startround_prespawn")
	addhook("suicide", "cloud.hook.suicide")
	addhook("team", "cloud.hook.team")
	addhook("trigger", "cloud.hook.trigger")
	addhook("triggerentity", "cloud.hook.triggerentity")
	addhook("use", "cloud.hook.use")
	addhook("usebutton", "cloud.hook.usebutton")
	addhook("vipescape", "cloud.hook.vipescape")
	addhook("vote", "cloud.hook.vote")
	addhook("walkover", "cloud.hook.walkover")

	addhook("ms100", "cloud.hook.ms100")
	addhook("second", "cloud.hook.second")

	function cloud.hook.ms100()
		action("ms100")
	end

	function cloud.hook.second()
		for _, id in pairs(player(0, "table")) do
			if cloud.player[id].mute_time > 0 then
				cloud.player[id].mute_time = cloud.player[id].mute_time - 1

				if _PLAYER[player(id, "usgn")] and _PLAYER[player(id, "usgn")].mute_time and _PLAYER[player(id, "usgn")].mute_time > 0 then
					_PLAYER[player(id, "usgn")].mute_time = _PLAYER[player(id, "usgn")].mute_time - 1

					if _PLAYER[player(id, "usgn")].mute_time == 0 then
						_PLAYER[player(id, "usgn")].mute_time = nil
					end

					saveData(_PLAYER, "data_player.lua")
				end

				if cloud.player[id].mute_time == 0 then
					cloud.player[id].mute_reason = ""
					cloudMessage(id, "You are no longer muted.", "info")

					if _PLAYER[player(id, "usgn")] and _PLAYER[player(id, "usgn")].mute_reason then
						_PLAYER[player(id, "usgn")].mute_reason = nil
						saveData(_PLAYER, "data_player.lua")
					end
				end
			end
		end
		action("second")
	end
end

--[[
function cloud.hook.log(text)
    action("log", text) -- @TODO CURRENTLY BREAKS CS2D FOR NO REASON, WORKING ON A FIX

    return filter("log", text) or 0 -- @TODO CURRENTLY BREAKS CS2D FOR NO REASON, WORKING ON A FIX
end
addhook("log", "cloud.hook.log")
]]
