// as we redfined this and we check both the original
// and the updated in one go, we have to silence pjass
//# +nosemanticerror
function jhcr_test_10_helper takes nothing returns boolean
    local integer i = 45 % 12
    call assert("reloaded filterfunc gets called", true)
    return true
endfunction

function jhcr_test_10 takes nothing returns nothing
    local trigger t = CreateTrigger()
    call TriggerAddCondition(t, Filter(function jhcr_test_10_helper))
    call assert("reloaded func as filterfunc", TriggerEvaluate(t))
    call ExecuteFunc("JHCR_Init_parse")
endfunction



