globals
    trigger jhcr_test_12_t = CreateTrigger()
endglobals

//# +nosemanticerror
function jhcr_test_12_helper takes nothing returns boolean
    return true
endfunction

function jhcr_test_12 takes nothing returns nothing
    call TriggerAddCondition(jhcr_test_12_t, Filter(function jhcr_test_12_helper))
    call assert("changing signature for filterfunc", TriggerEvaluate(jhcr_test_12_t))
    call ExecuteFunc("JHCR_Init_parse")
endfunction

