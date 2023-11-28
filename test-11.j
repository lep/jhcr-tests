globals
    unit H = CreateUnit(Player(0), 'Hpal', 0, 0, 0)
endglobals

function jhcr_test_11_helper_1 takes nothing returns boolean
    return GetOwningPlayer(GetFilterUnit()) == Player(0)
endfunction

function jhcr_test_11_helper_2 takes nothing returns boolean
    return GetWidgetLife(GetFilterUnit()) > 0.405
endfunction

function jhcr_test_11 takes nothing returns nothing
    local boolexpr cond = And(Filter(function jhcr_test_11_helper_1), Filter(function jhcr_test_11_helper_2))
    local group g = CreateGroup()
    call GroupEnumUnitsInRange(g, 0, 0, 600, cond)
    call assert("boolexpr works", BlzGroupGetSize(g) == 1)
    call ExecuteFunc("JHCR_Init_parse")
endfunction
