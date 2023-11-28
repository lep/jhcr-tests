
globals
    integer assert_count = 0
endglobals

// Registers a trigger to run whenever a reload finishes
function JHCR_API_RegisterReload takes trigger t returns nothing
endfunction

// Returns the current sequence number of the code being run.
// The jhcr binary will print its sequence number on each `update` call.
function JHCR_API_GetSeqNumber takes nothing returns integer
    return 0
endfunction

// Returns the status of the latest reload attempt.
// Possible return values are:
//   -1  There wasn't any reload yet
//    1  The reload was a success
//    2  There wasn't any data to reload.
//       Probably attempted a reload when no update was available.
//    3  The reload hit the OP limit. Probably too much code to reload.
function JHCR_API_GetLastStatus takes nothing returns integer
    return 0
endfunction

function JHCR_API_ToggleTrace takes nothing returns nothing
endfunction

function print takes string s returns nothing
    call DisplayTimedTextToPlayer(Player(0), 0, 0, 60, s)
endfunction

function assert takes string msg, boolean result returns nothing
    if result then
	call print("ok "+ I2S(assert_count) + " - " + msg)
    else
	call print("not ok " + I2S(assert_count) +" - " + msg)
	call I2S(1 / 0)
    endif
    set assert_count = assert_count + 1
endfunction

function OnReload takes nothing returns nothing
    local integer status = JHCR_API_GetLastStatus()
    local integer seq = JHCR_API_GetSeqNumber()
    //call assert("Reload #"+I2S(seq-1)+" worked", status == 1)
    //call print("Executing jhcr_test_"+I2S(seq-1))
    call ExecuteFunc("jhcr_test_"+I2S(seq-1))
endfunction

function start_tests takes nothing returns nothing
    call assert("Map loads", true)
    // our setup will generate all the preload files so we can directly
    // jump into the chain.
    call ExecuteFunc("JHCR_Init_parse")
endfunction

function reload_script takes nothing returns nothing
    // call BJDebugMsg("Reloading script...")
    call ExecuteFunc("JHCR_Init_parse")
endfunction


function main takes nothing returns nothing
    local trigger t = CreateTrigger()
    call SetCameraBounds(-5376.0+GetCameraMargin(CAMERA_MARGIN_LEFT),-5632.0+GetCameraMargin(CAMERA_MARGIN_BOTTOM),5376.0-GetCameraMargin(CAMERA_MARGIN_RIGHT),5120.0-GetCameraMargin(CAMERA_MARGIN_TOP),-5376.0+GetCameraMargin(CAMERA_MARGIN_LEFT),5120.0-GetCameraMargin(CAMERA_MARGIN_TOP),5376.0-GetCameraMargin(CAMERA_MARGIN_RIGHT),-5632.0+GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call InitBlizzard()

    call JHCR_API_RegisterReload(t)
    call TriggerAddAction(t, function OnReload)

    set t = CreateTrigger()
    call TriggerRegisterPlayerEvent(t, Player(0), EVENT_PLAYER_END_CINEMATIC)
    call TriggerAddAction(t, function reload_script)

    call TimerStart(CreateTimer(), 0.1, false, function start_tests)
endfunction

function InitCustomPlayerSlots takes nothing returns nothing
    call SetPlayerStartLocation(Player(0),0)
    call SetPlayerColor(Player(0),ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0),RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0),true)
    call SetPlayerController(Player(0),MAP_CONTROL_USER)
endfunction

function config takes nothing returns nothing
    call SetMapName("TRIGSTR_001")
    call SetMapDescription("TRIGSTR_003")
    call SetPlayers(1)
    call SetTeams(1)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, 0, 0)
    call InitCustomPlayerSlots()
    call SetPlayerSlotAvailable(Player(0),MAP_CONTROL_USER)
    call InitGenericPlayerSlots()
    call SetStartLocPrioCount(0,1)
    call SetStartLocPrio(0,0,1,MAP_LOC_PRIO_HIGH)
endfunction

function jhcr_test_action  takes nothing returns nothing
    call assert("using code in interpreter works", true)
    call ExecuteFunc("JHCR_Init_parse")
endfunction
