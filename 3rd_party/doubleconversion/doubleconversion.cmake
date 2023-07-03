include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME doubleconversion 
  URL https://github.com/google/double-conversion/archive/refs/tags/v3.3.0.tar.gz
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_doubleconversion_INSTALL_DIR})
