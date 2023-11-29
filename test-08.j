//# +nosemanticerror
function jhcr_test_7_8_9_helper takes nothing returns real
    return 23.42
endfunction

// ignore the type error
//# +nosemanticerror
function jhcr_test_8 takes nothing returns nothing
    call assert("changing return type", jhcr_test_7_8_9_helper() == 23.42)
    call ExecuteFunc("JHCR_Init_parse")
endfunction




