
function jhcr_test_2 takes nothing returns nothing
    local trigger t = CreateTrigger()
    call TriggerAddAction(t, function jhcr_test_action)
    call TriggerExecute(t)

    // trigger next test
    //call ExecuteFunc("JHCR_Init_parse")
endfunction

