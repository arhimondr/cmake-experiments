include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME glog 
  URL https://github.com/google/glog/archive/refs/tags/v0.6.0.tar.gz
  CMAKE_FLAGS "-DBUILD_SHARED_LIBS=OFF;"
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_glog_INSTALL_DIR})
