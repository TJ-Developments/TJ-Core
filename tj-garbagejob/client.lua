-- Script Variables
QBCore = exports['qb-core']:GetCoreObject()
local playerJob = nil
local garbageBlip = nil
local deliveryBlip = nil
local onduty = false
local isSpawned = false
local coords = vector3(-314.14, -1524.3, 27.57)
local Target = Config.ToggleThirdEye
local currentStop = math.random(1, #Config.Locations)

--Sets Up Blips
local function setupClient()
    deliveryBlip = nil
    if playerJob.name == "garbageman" then
        garbageBlip = AddBlipForCoord(vector3(-314.14, -1524.3, 27.57))
        SetBlipSprite(garbageBlip, 318)
        SetBlipDisplay(garbageBlip, 4)
        SetBlipScale(garbageBlip, 1.0)
        SetBlipAsShortRange(garbageBlip, true)
        SetBlipColour(garbageBlip, 47)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Garbage HQ")
        EndTextCommandSetBlipName(garbageBlip)
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    playerJob = QBCore.Functions.GetPlayerData().job
    onduty = playerJob.onduty
    setupClient()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    playerJob = JobInfo
    if playerJob.name == "garbage" then
        if garbageBlip ~= nil then
            RemoveBlip(garbageBlip)
        end
    end
    setupClient()
end)
   

Citizen.CreateThread(function()
    -- Spawn Truck When On Duty
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local markDist = #(pos - vector3(-327.96, -1523.91, 27.54))
        if markDist < 27 and onduty == true and playerJob.name == "garbageman" then
            -- Truck Icon
            DrawMarker(39, -327.96, -1523.91, 27.54, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 200, 0, 0, 222, false, false, false, true, false, false, false)
            -- Circle Icon
            DrawMarker(25, -327.96, -1523.91, 26.58, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.9, 1.9, 1.9, 200, 0, 0, 222, false, false, false, true, false, false, false)
           

    -- Needs Patch Fix (Vehcile Spawns Without Pressing [E])
            if markDist < 1 then
                if IsPedInAnyVehicle(ped, false) then
                    ShowHelpNotification("Press [E] To Store Vehicle")
                else
                    ShowHelpNotification("Press [E] To Take Out Vehicle")
                end
                if IsControlJustReleased(0,38) then
                    if IsPedInAnyVehicle(ped, false) and isSpawned == true then
                        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                        isSpawned = false
                    end
                    elseif isSpawned == false then
                        QBCore.Functions.SpawnVehicle("trash", function(veh)
                        SetEntityHeading(veh, 263.71)
                        exports['LegacyFuel']:SetFuel(veh, 100.0)
                        TaskWarpPedIntoVehicle(ped, veh, -1)
                        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
                        SetVehicleEngineOn(veh, true, true)
                        isSpawned = true
                    end, coords, true)
                end
            end
        end
    end
end)


-- Toggle ThirdEye Use
Citizen.CreateThread(function()
    playerJob = QBCore.Functions.GetPlayerData().job
    if Target == true and playerJob.name == "garbageman" then
        exports['qb-target']:AddBoxZone("Garbage Job", vector3(-322.24, -1545.87, 31.02),1,1, {
            name = "GarbageMan",
            heading = 88.17,
            debugPoly = false,
            minZ = 30,
            maxZ = 35,
            }, {
            options = {
                {
                    type = "client",
                    event = "TJ-GarbageJob:client:SetOnOffDutyTarget",
                    targeticon = 'fas fa-trash-alt',
                    icon = "fas fa-sign-in-alt",
                    label = "Clock In | Clock Out"
                },
            },
            distance = 3.0
        })
    end
end)

Citizen.CreateThread(function()
    playerJob = QBCore.Functions.GetPlayerData().job
    -- Set On/Off Duty
    while true do
        Wait(0)
        if Target == false and playerJob.name == "garbageman" then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local garbageDist = #(pos - vector3(-322.25, -1545.87, 31.02))
            if garbageDist < 1 then
                inRange = true
                if garbageDist < 1 and onduty == false then
                    ShowHelpNotification("Press [E] To Go On Duty")
                    if IsControlJustPressed(0, 38) then
                        onduty = true
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end 
                elseif garbageDist < 1 and onduty == true then
                    ShowHelpNotification("Press [E] To Go Off Duty")
                    if IsControlJustPressed(0, 38) then
                        onduty = false
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('tj-garbagejob:client:startroute')
AddEventHandler('tj-garbagejob:client:startroute', function() 
    --This Starts the Route of The Job From The Radial Menu
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local CurrentLocation = Config.Locations[currentStop]
    if deliveryBlip ~= nil then
        RemoveBlip(deliveryBlip)
    end
    deliveryBlip = AddBlipForCoord(CurrentLocation.coords.x, CurrentLocation.coords.y, CurrentLocation.coords.z)
    SetBlipSprite(deliveryBlip, 1)
    SetBlipDisplay(deliveryBlip, 2)
    SetBlipScale(deliveryBlip, 1.0)
    SetBlipAsShortRange(deliveryBlip, false)
    SetBlipColour(deliveryBlip, 47)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations[currentStop].name)
    EndTextCommandSetBlipName(deliveryBlip)
    SetBlipRoute(deliveryBlip, true)
end)


-- Handle On & Off Duty Using Third Eye Support
RegisterNetEvent('TJ-GarbageJob:client:SetOnOffDutyTarget')
AddEventHandler('TJ-GarbageJob:client:SetOnOffDutyTarget', function()
    if onduty == true then
        onduty = false
        TriggerServerEvent("QBCore:ToggleDuty")
    else
        onduty = true
        TriggerServerEvent("QBCore:ToggleDuty")
    end
end)

-- Shows Help Notification
function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end