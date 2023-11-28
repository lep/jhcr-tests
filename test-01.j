function jhcr_test_1 takes nothing returns nothing
    call assert("reload works in general", true)

    // trigger next test
    call ExecuteFunc("JHCR_Init_parse")
endfunction
