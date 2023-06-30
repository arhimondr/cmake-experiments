configure_file(CMakeLists.txt.in fmt-download/CMakeLists.txt)

execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/fmt-download )
if(result)
  message(FATAL_ERROR "CMake step for fmt failed: ${result}")
endif()

execute_process(COMMAND ${CMAKE_COMMAND} --build .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/fmt-download )
if(result)
  message(FATAL_ERROR "Build step for fmt failed: ${result}")
endif()

set(FMT_INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/fmt-install)
set(FMT_INCLUDE_DIR ${FMT_INSTALL_DIR}/include)

find_library(FMT_LIBRARY
    NAMES fmt fmtd
    PATHS ${FMT_INSTALL_DIR}/lib64
    NO_DEFAULT_PATH
    NO_CMAKE_FIND_ROOT_PATH
    REQUIRED
)

message("FMT_LIBRARY=" ${FMT_LIBRARY})

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${FMT_INSTALL_DIR})

add_library(3rd_party_fmt STATIC IMPORTED GLOBAL)
set_target_properties(
  3rd_party_fmt
  PROPERTIES IMPORTED_LOCATION ${FMT_LIBRARY}
             INTERFACE_INCLUDE_DIRECTORIES ${FMT_INCLUDE_DIR})
