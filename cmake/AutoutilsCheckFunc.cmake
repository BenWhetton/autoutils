if(__AUTUTILS_CHECK_FUNC)
  return()
endif()
set(__AUTUTILS_CHECK_FUNC 1)

include(AututilsCheckFunctionExists)

include(AututilsWriteToConfigHeader)

macro(aututils_check_func func)
  string(MAKE_C_IDENTIFIER "${func}" _var)
  string(TOUPPER "${_var}" _var)
  if(NOT DEFINED _have_func_${_var})
    aututils_check_function_exists(${func} _have_func_${_var})
    if(_have_func_${_var})
      set(HAVE_${_var} ON)
      aututils_write_to_config_header("#define HAVE_${_var}")
    else()
      aututils_write_to_config_header("/* #undef HAVE_${_var} */")
    endif()
  endif()
endmacro()
