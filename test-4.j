globals
    boolean jhcr_test_4_global = true
endglobals

function jhcr_test_4 takes nothing returns nothing
    call assert("defining new global works", jhcr_test_4_global)

    // trigger next test
    call ExecuteFunc("JHCR_Init_parse")
endfunction

