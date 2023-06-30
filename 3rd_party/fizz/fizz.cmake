include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME fizz 
  URL https://github.com/facebookincubator/fizz/archive/refs/tags/v2022.11.14.00.tar.gz 
  CMAKE_FLAGS "-DBUILD_EXAMPLES=OFF;-DBUILD_TESTS=OFF;"
  SOURCE_SUBDIR "fizz"
)

find_library(FIZZ_LIBRARY
    NAMES fizz
    PATHS ${3RD_PARTY_fizz_INSTALL_DIR}/lib
    NO_DEFAULT_PATH
    NO_CMAKE_FIND_ROOT_PATH
    REQUIRED
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_fizz_INSTALL_DIR})

add_library(3rd_party_fizz STATIC IMPORTED GLOBAL)
set_target_properties(
  3rd_party_fizz
  PROPERTIES IMPORTED_LOCATION ${FIZZ_LIBRARY}
             INTERFACE_INCLUDE_DIRECTORIES ${3RD_PARTY_fizz_INSTALL_DIR}/include)
