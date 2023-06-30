include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME folly 
  URL https://github.com/facebook/folly/archive/refs/tags/v2022.11.14.00.tar.gz 
  CMAKE_FLAGS "-DBUILD_TESTS=OFF;"
)

find_library(FOLLY_LIBRARY
    NAMES folly
    PATHS ${3RD_PARTY_folly_INSTALL_DIR}/lib
    NO_DEFAULT_PATH
    NO_CMAKE_FIND_ROOT_PATH
    REQUIRED
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_folly_INSTALL_DIR})

add_library(3rd_party_folly STATIC IMPORTED GLOBAL)
set_target_properties(
  3rd_party_folly
  PROPERTIES IMPORTED_LOCATION ${FOLLY_LIBRARY}
             INTERFACE_INCLUDE_DIRECTORIES ${3RD_PARTY_folly_INSTALL_DIR}/include)
