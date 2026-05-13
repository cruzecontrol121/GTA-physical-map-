local QBCore = exports['qb-core']:GetCoreObject()

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return true end

    RequestAnimDict(dict)
    local timeout = GetGameTimer() + 5000

    while not HasAnimDictLoaded(dict) do
        Wait(50)
        if GetGameTimer() > timeout then
            return false
        end
    end

    return true
end

local function showWorldMap()
    ActivateFrontendMenu(`FE_MENU_VERSION_MP_PAUSE`, true, -1)
    SetPauseMenuActive(true)
end

RegisterNetEvent('qb-physicalmap:client:useMap', function()
    local ped = PlayerPedId()

    if Config.Anim and loadAnimDict(Config.Anim.Dict) then
        TaskPlayAnim(ped, Config.Anim.Dict, Config.Anim.Name, 3.0, 3.0, Config.UnfoldDuration, Config.Anim.Flag, 0.0, false, false, false)
    end

    QBCore.Functions.Progressbar('use_world_map', 'Unfolding map...', Config.UnfoldDuration, false, true, {
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(ped)
        showWorldMap()
    end, function()
        ClearPedTasks(ped)
        QBCore.Functions.Notify('You folded the map back up.', 'error')
    end)
end)
