include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME fmt
  URL https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.tar.gz
  CMAKE_FLAGS "-DFMT_MASTER_PROJECT=OFF;-DFMT_INSTALL=ON;"
)

find_library(FMT_LIBRARY
    NAMES fmt fmtd
    PATHS ${3RD_PARTY_fmt_INSTALL_DIR}/lib ${3RD_PARTY_fmt_INSTALL_DIR}/lib64
    NO_DEFAULT_PATH
    NO_CMAKE_FIND_ROOT_PATH
    REQUIRED
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_fmt_INSTALL_DIR})

add_library(3rd_party_fmt STATIC IMPORTED GLOBAL)
set_target_properties(
  3rd_party_fmt
  PROPERTIES IMPORTED_LOCATION ${FMT_LIBRARY}
             INTERFACE_INCLUDE_DIRECTORIES ${3RD_PARTY_fmt_INSTALL_DIR}/include)
