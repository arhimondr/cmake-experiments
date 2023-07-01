include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME proxygen 
  URL https://github.com/facebook/proxygen/archive/refs/tags/v2022.11.14.00.tar.gz 
  CMAKE_FLAGS "-DBUILD_TESTS=OFF;-DBUILD_SAMPLES=OFF;"
)

find_library(PROXYGEN_LIBRARY
    NAMES proxygen
    PATHS ${3RD_PARTY_proxygen_INSTALL_DIR}/lib
    NO_DEFAULT_PATH
    NO_CMAKE_FIND_ROOT_PATH
    REQUIRED
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_proxygen_INSTALL_DIR})

add_library(3rd_party_proxygen STATIC IMPORTED GLOBAL)
set_target_properties(
  3rd_party_proxygen
  PROPERTIES IMPORTED_LOCATION ${PROXYGEN_LIBRARY}
             INTERFACE_INCLUDE_DIRECTORIES ${3RD_PARTY_proxygen_INSTALL_DIR}/include)
