function jhcr_test_3_helper takes nothing returns nothing
    call assert("newly defined function works via execute func", true)
    // trigger next test
    call ExecuteFunc("JHCR_Init_parse")
endfunction

function jhcr_test_3 takes nothing returns nothing
    call ExecuteFunc("jhcr_test_3_helper")
endfunction


