local display = false

local isInGreenZone = false
local sleep = 1000
local Greenzones
local GreenZones = {}

local function SetDisplay(bool)
    display = bool
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

for k, v in pairs(Config.Location) do
    GreenZones[#GreenZones+1] = BoxZone:Create(
        vector3(vector3(v.coords.x, v.coords.y, v.coords.z + 1)), v.tinggi, v.lebar, {
        name="box_zone",
        debugPoly = true,
        minZ = v.MinZ,
        maxZ = v.MaxZ,
    })
end

Greenzones = ComboZone:Create(GreenZones, {name = "Greenzones", debugPoly = false})

Greenzones:onPlayerInOut(function(isPointInside)
    if not isPointInside then
        isInGreenZone = false
        SetDisplay(false)
        DisableControlAction(0, 140, false)
        DisableControlAction(0, 141, false)
        DisableControlAction(0, 142, false)
        DisablePlayerFiring(PlayerId(), false) 
        EnableAllControlActions(0)  
    else
        isInGreenZone = true
        SetDisplay(true)
        CreateThread(function()
            while isInGreenZone do
                if not isInGreenZone then break end

                DisablePlayerFiring(PlayerId(), true) 
                DisableControlAction(0, 140, true)
                DisableControlAction(0, 141, true)
                DisableControlAction(0, 142, true)
                Wait(0)
            end
        end)
    end
end)

RegisterNUICallback("exit", function(data, cb)
    SetDisplay(false)
    cb("OK")
end)
