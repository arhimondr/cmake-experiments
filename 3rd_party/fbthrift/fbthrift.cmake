include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME fbthrift 
  URL https://github.com/facebook/fbthrift/archive/refs/tags/v2022.11.14.00.tar.gz 
  CMAKE_FLAGS "-Dthriftpy=OFF;-Denable_tests=OFF;"
)

find_library(FBTHRIFT_LIBRARY
    NAMES thrift-core
    PATHS ${3RD_PARTY_fbthrift_INSTALL_DIR}/lib
    NO_DEFAULT_PATH
    NO_CMAKE_FIND_ROOT_PATH
    REQUIRED
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_fbthrift_INSTALL_DIR})

add_library(3rd_party_fbthrift STATIC IMPORTED GLOBAL)
set_target_properties(
  3rd_party_fbthrift
  PROPERTIES IMPORTED_LOCATION ${FBTHRIFT_LIBRARY}
             INTERFACE_INCLUDE_DIRECTORIES ${3RD_PARTY_fbthrift_INSTALL_DIR}/include)
