include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME gflags 
  URL https://github.com/gflags/gflags/archive/refs/tags/v2.2.2.tar.gz
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_gflags_INSTALL_DIR})
