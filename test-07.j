function jhcr_test_7_8_9_helper takes nothing returns integer
    return 1337
endfunction

function jhcr_test_7 takes nothing returns nothing
    call assert("returning value works", jhcr_test_7_8_9_helper() == 1337)
    call ExecuteFunc("JHCR_Init_parse")
endfunction



