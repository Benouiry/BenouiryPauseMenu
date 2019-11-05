function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

-- Uncomment if you want add Players Steam or connected players

local id = PlayerId()
local serverID = GetPlayerServerId(PlayerId())
players = {}
for i = 0, 255 do
    if NetworkIsPlayerActive( i ) then
        table.insert( players, i )
    end
end

Citizen.CreateThread(function()
  AddTextEntry('PM_PANE_LEAVE', '~o~Return to the list of servers.')
  AddTextEntry('PM_PANE_QUIT', '~r~Leave limitless city: c')
  AddTextEntry('PM_SCR_MAP', '~b~Limitless City Map')
  AddTextEntry('PM_SCR_GAM', '~r~Take The Plane')
  AddTextEntry('PM_SCR_INF', '~g~Logs')
  AddTextEntry('PM_SCR_SET', '~p~Configuration')
  AddTextEntry('PM_SCR_STA', '~f~Statistics')
  AddTextEntry('PM_SCR_RPL', '~y~Editor ∑')
end)

--function SetData()
	--local name = GetPlayerName(PlayerId())
	--local id = GetPlayerServerId(PlayerId())
	--Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~y~Limitless City ~t~| ~g~Discord: Khha6c9~t~ | ~b~ID: ' .. id .. ' ~t~| ~y~Name: ~r~' .. name)
--end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		SetData()
	end
end)

function SetData()
	players = {}
	for i = 0, 31 do
		if NetworkIsPlayerActive( i ) then
			table.insert( players, i )
		end
	end
	
	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~g~Limitless City ~t~| ~y~Discord: Khha6c9~t~ | ~b~ID: ' .. id .. ' ~t~| ~y~Name: ~p~' .. name .. " ~r~Players: " .. #players .. "/32")
end