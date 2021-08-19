vehConfig = {
    blacklist = {
        [GetHashKey("buzzard2")] = true,
        [GetHashKey("cutter")] = true,
        [GetHashKey("apc")] = true,
        [GetHashKey("hydra")] = true,
        [GetHashKey("blimp")] = true,
        [GetHashKey("blimp2")] = true,
        [GetHashKey("blimp3")] = true,    	
        [GetHashKey("thruster")] = true,
        [GetHashKey("barrage")] = true,
        [GetHashKey("halftrack")] = true,
        [GetHashKey("tug")] = true,
        [GetHashKey("submersible")] = true,
        [GetHashKey("akula")] = true,
        [GetHashKey("cerberus3")] = true,
        [GetHashKey("cerberus2")] = true,
        [GetHashKey("cerberus")] = true,
        [GetHashKey("valkyrie2")] = true,    	
        [GetHashKey("insurgent")] = true,
        [GetHashKey("Rhino")] = true,
        [GetHashKey("Valkyrie")] = true,
        [GetHashKey("Buzzard")] = true,
        [GetHashKey("Valkyrie")] = true,
        [GetHashKey("Savage")] = true,
        [GetHashKey("Khanjali")] = true,
        [GetHashKey("Scarab2")] = true,
        [GetHashKey("Scarab3")] = true,
        [GetHashKey("Scarab")] = true,
        [GetHashKey("lazer")] = true

    }
}

-- This is the time IN MILISECONDS (1000 = 1 second!) for each time it looks to delete everything blocked | Default: 15000 (15 Seconds)
vehConfig.LoopTime = 1000

-- This is the time IN MILISECONDS (1000 = 1 second!) in between each vehicle. | Default: 5 (5ms) DO NOT GO UNDER 1! Do NOT go ABOVE 25! |
vehConfig.TimeBetween = 1