--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
local LoadFreeze = class("LoadFreeze", vRP.Extension)

function LoadFreeze:__construct()
	vRP.Extension.__construct(self)
end

frozen = true
unfrozen = false

Citizen.CreateThread(function()
 	while true do
 		if frozen then
 			if unfrozen then
 				Wait(1)
				SetEntityInvincible(GetPlayerPed(-1),false)
				SetEntityVisible(GetPlayerPed(-1),true)
				FreezeEntityPosition(GetPlayerPed(-1),false)
				frozen = false
			else
				SetEntityInvincible(GetPlayerPed(-1),true)
				SetEntityVisible(GetPlayerPed(-1),false)
				FreezeEntityPosition(GetPlayerPed(-1),true)
			end
		end
		Citizen.Wait(1)
	end
end)

function LoadFreeze:unFreeze(flag)
	unfrozen = flag
end

function LoadFreeze:Freeze(flag)
	frozen = flag
end

LoadFreeze.tunnel = {}
LoadFreeze.tunnel.Freeze = LoadFreeze.Freeze
LoadFreeze.tunnel.unFreeze = LoadFreeze.unFreeze

vRP:registerExtension(LoadFreeze)
