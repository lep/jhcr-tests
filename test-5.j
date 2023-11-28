function jhcr_test_5_helper takes nothing returns nothing
    call assert("TriggerAddAction with newly defined function works", true)
    call ExecuteFunc("JHCR_Init_parse")
endfunction

function jhcr_test_5 takes nothing returns nothing
    local trigger t = CreateTrigger()
    call TriggerAddAction(t, function jhcr_test_5_helper)
    call TriggerExecute(t)
endfunction

