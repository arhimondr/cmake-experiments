include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME googletest 
  URL https://github.com/google/googletest/archive/refs/tags/v1.13.0.tar.gz
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_googletest_INSTALL_DIR})
