include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME antlr
  URL https://github.com/antlr/antlr4/archive/refs/tags/4.9.3.tar.gz
  SOURCE_SUBDIR "runtime/Cpp"
  PATCH_COMMAND patch -p1 < ${CMAKE_CURRENT_LIST_DIR}/0001-Disable-shared-install-target.patch
)

find_library(ANTLR_LIBRARY
    NAMES antlr4-runtime
    PATHS ${3RD_PARTY_antlr_INSTALL_DIR}/lib
    NO_DEFAULT_PATH
    NO_CMAKE_FIND_ROOT_PATH
    REQUIRED
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_antlr_INSTALL_DIR})

add_library(3rd_party_antlr STATIC IMPORTED GLOBAL)
set_target_properties(
  3rd_party_antlr
  PROPERTIES IMPORTED_LOCATION ${ANTLR_LIBRARY}
             INTERFACE_INCLUDE_DIRECTORIES ${3RD_PARTY_antlr_INSTALL_DIR}/include)
