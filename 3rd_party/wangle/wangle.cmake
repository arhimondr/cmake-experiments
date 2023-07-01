include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME wangle 
  URL https://github.com/facebook/wangle/archive/refs/tags/v2022.11.14.00.tar.gz 
  CMAKE_FLAGS "-DBUILD_EXAMPLES=OFF;-DBUILD_TESTS=OFF;"
  SOURCE_SUBDIR "wangle"
)

find_library(WANGLE_LIBRARY
    NAMES wangle
    PATHS ${3RD_PARTY_wangle_INSTALL_DIR}/lib
    NO_DEFAULT_PATH
    NO_CMAKE_FIND_ROOT_PATH
    REQUIRED
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_wangle_INSTALL_DIR})

add_library(3rd_party_wangle STATIC IMPORTED GLOBAL)
set_target_properties(
  3rd_party_wangle
  PROPERTIES IMPORTED_LOCATION ${WANGLE_LIBRARY}
             INTERFACE_INCLUDE_DIRECTORIES ${3RD_PARTY_wangle_INSTALL_DIR}/include)
