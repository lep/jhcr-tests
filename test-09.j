//# +nosemanticerror
function jhcr_test_7_8_9_helper takes integer a, integer b returns integer
    return a+2*b
endfunction

//# +nosemanticerror
function jhcr_test_9 takes nothing returns nothing
    call assert("changing signature", jhcr_test_7_8_9_helper(3, 4) == 11)
    call ExecuteFunc("JHCR_Init_parse")
endfunction
