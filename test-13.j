// NOTE: we change 12 here intentionally
//# +nosemanticerror
function jhcr_test_12_helper takes nothing returns boolean
    return false
endfunction

//# +nosemanticerror
function jhcr_test_13 takes nothing returns nothing
    call assert("changing ccr'd function", not TriggerEvaluate(jhcr_test_12_t))
    call ExecuteFunc("JHCR_Init_parse")
endfunction


