if(__AUTUTILS_INCLUDES_DEFAULT)
  return()
endif()
set(__AUTUTILS_INCLUDES_DEFAULT 1)

include(AututilsCheckHeader)
include(AututilsWriteToConfigHeader)

aututils_check_header("inttypes.h")
aututils_check_header("memory.h")
aututils_check_header("stddef.h")
aututils_check_header("stdint.h")
aututils_check_header("stdlib.h")
aututils_check_header("string.h")
aututils_check_header("strings.h")
aututils_check_header("sys/stat.h")
aututils_check_header("sys/types.h")
aututils_check_header("unistd.h")

set(aututils_includes_default "stdio.h")
if(HAVE_SYS_TYPES_H)
  list(APPEND aututils_includes_default "sys/types.h")
endif()
if(HAVE_SYS_STAT_H)
  list(APPEND aututils_includes_default "sys/stat.h")
endif()
if(HAVE_STDLIB_H)
  list(APPEND aututils_includes_default "stdlib.h")
endif()
if(HAVE_STDDEF_H)
  set(STDC_HEADERS 1)
  autoutils_write_to_config_header("#define STDC_HEADERS ${STDC_HEADERS}")
  list(APPEND aututils_includes_default "stddef.h")
endif()
if(HAVE_STRING_H)
  if(NOT STDC_HEADERS AND HAVE_MEMORY_H)
    list(APPEND aututils_includes_default "memory.h")
  endif()
  list(APPEND aututils_includes_default "string.h")
endif()
if(HAVE_STRINGS_H)
  list(APPEND aututils_includes_default "strings.h")
endif()
if(HAVE_INTTYPES_H)
  list(APPEND aututils_includes_default "inttypes.h")
endif()
if(HAVE_STDINT_H)
  list(APPEND aututils_includes_default "stdint.h")
endif()
if(HAVE_UNISTD_H)
  list(APPEND aututils_includes_default "unistd.h")
endif()