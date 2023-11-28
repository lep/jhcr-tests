function jhcr_test_6_helper takes nothing returns boolean
    call assert("TriggerAddCondition with newly defined function works", true)
    return true
endfunction

function jhcr_test_6 takes nothing returns nothing
    local trigger t = CreateTrigger()
    call TriggerAddCondition(t, Condition(function jhcr_test_6_helper))
    call assert("TriggerEvaluate", TriggerEvaluate(t))
    // call ExecuteFunc("JHCR_Init_parse")
endfunction


