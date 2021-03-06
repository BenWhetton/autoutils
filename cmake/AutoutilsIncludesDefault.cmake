if(__autoutils_includes_default)
  return()
endif()
set(__autoutils_includes_default 1)

include(AutoutilsCheckHeader)
include(AutoutilsWriteToConfigHeader)

macro(autoutils_includes_default var)
  autoutils_check_header("inttypes.h")
  autoutils_check_header("memory.h")
  autoutils_check_header("stddef.h")
  autoutils_check_header("stdint.h")
  autoutils_check_header("stdlib.h")
  autoutils_check_header("string.h")
  autoutils_check_header("strings.h")
  autoutils_check_header("sys/stat.h")
  autoutils_check_header("sys/types.h")
  autoutils_check_header("unistd.h")

  set(${var} "stdio.h")
  if(HAVE_SYS_TYPES_H)
    list(APPEND ${var} "sys/types.h")
  endif()
  if(HAVE_SYS_STAT_H)
    list(APPEND ${var} "sys/stat.h")
  endif()
  if(HAVE_STDLIB_H)
    list(APPEND ${var} "stdlib.h")
  endif()
  if(HAVE_STDDEF_H)
    set(STDC_HEADERS 1)
    autoutils_write_to_config_header("#define STDC_HEADERS ${STDC_HEADERS}")
    list(APPEND ${var} "stddef.h")
  endif()
  if(HAVE_STRING_H)
    if(NOT STDC_HEADERS AND HAVE_MEMORY_H)
      list(APPEND ${var} "memory.h")
    endif()
    list(APPEND ${var} "string.h")
  endif()
  if(HAVE_STRINGS_H)
    list(APPEND ${var} "strings.h")
  endif()
  if(HAVE_INTTYPES_H)
    list(APPEND ${var} "inttypes.h")
  endif()
  if(HAVE_STDINT_H)
    list(APPEND ${var} "stdint.h")
  endif()
  if(HAVE_UNISTD_H)
    list(APPEND ${var} "unistd.h")
  endif()
endmacro()
