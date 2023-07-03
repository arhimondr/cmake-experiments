include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME event 
  URL https://github.com/libevent/libevent/archive/refs/tags/release-2.1.12-stable.tar.gz
  CMAKE_FLAGS "-DEVENT__LIBRARY_TYPE=STATIC;"
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_event_INSTALL_DIR})
