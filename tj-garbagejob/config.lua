-- Before Using This Config Please Look At The README.MD Provided

Config = {}

-- Set To True If You Want To Toggle QBTarget (Third Eye Support)
Config.ToggleThirdEye = true

-- Set To False If You Do Not Want Players To Recive Items When Picking Up Trash
Config.ToggleReciveItems = true

-- Set To False If You Do Not Want Players To Recive Money When Picking Up Trash
Config.ToggleRecieveMoney = true

-- Set To True If You Want To Change Clothing When Setting Yourself On-Duty
Config.ToggleChangeClothing = false

-- If ToggleReciveMoney Is Set To "True" Players Can Earn This Amount Every Stop
-- Change How Much Money A Player Can Make Per Stop
Config.MoneyPerStop = 110

-- If ToggleReciveItems Is Set To "True" Players Can Find The Listed Items Below
-- NOTE! Add Items By Their Names In QBCore Shared Items.lua
Config.Items = {

}

-- Locations Of All The Trash Objectives, To Add New Locations Add The Vector4 Coords.
Config.Locations = {
    [1] = {
        name = "Trash Pickup 1",
        coords = vector4(789.01, -809.14, 26.21, 344.33),
    },
    [2] = {
        name = "Trash Pickup 2",
        coords = vector4(318.25, -182.23, 57.46, 129.99),
    },
    [3] = {
        name = "Trash Pickup 3",
        coords = vector4(-101.57, 45.68, 71.81, 227.26),
    },
    [4] = {
        name = "Trash Pickup 4",
        coords = vector4(-592.48, 245.02, 82.32, 173.03),
    },
    [5] = {
        name = "Trash Pickup 5",
        coords = vector4(-407.94, 295.07, 83.83, 265.82),
    },
    [6] = {
        name = "Trash Pickup 6",
        coords = vector4(-178.94, 203.87, 87.81, 190.98),
    },
    [7] = {
        name = "Trash Pickup 7",
        coords = vector4(-1177.91, -747.75, 20.26, 141.96),
    },
    [8] = {
        name = "Trash Pickup 8",
        coords = vector4(-1298.6, -622.87, 26.93, 122.12),
    },
    [9] = {
        name = "Trash Pickup 9",
        coords = vector4(-1990.24, -487.19, 12.33, 207.29),
    },
    [10] = {
        name = "Trash Pickup 10",
        coords = vector4(-1647.04, -984.93, 7.57, 143.21),
    }
}