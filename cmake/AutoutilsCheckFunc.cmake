if(__autoutils_check_func)
  return()
endif()
set(__autoutils_check_func 1)

include(CheckFunctionExists)

include(AutoutilsWriteToConfigHeader)

macro(autoutils_check_func func)
  string(MAKE_C_IDENTIFIER "${func}" _var)
  string(TOUPPER "${_var}" _var)
  check_function_exists(${func} _have_func_${_var})

  if(_have_func_${_var})
    set(HAVE_${_var} ON)
    autoutils_write_to_config_header("#define HAVE_${_var}")
  else()
    autoutils_write_to_config_header("/* #undef HAVE_${_var} */")
  endif()
endmacro()
