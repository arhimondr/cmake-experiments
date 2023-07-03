include_guard(GLOBAL)

install_3rd_party_cmake_dependency(
  NAME protobuf
  URL https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.4.tar.gz
  CMAKE_FLAGS "-DBUILD_SHARED_LIBS=OFF;-Dprotobuf_BUILD_TESTS=OFF;"
)

find_library(PROTOBUF_LIBRARY
    NAMES protobuf protobufd
    PATHS ${3RD_PARTY_protobuf_INSTALL_DIR}/lib ${3RD_PARTY_protobuf_INSTALL_DIR}/lib64
    NO_DEFAULT_PATH
    NO_CMAKE_FIND_ROOT_PATH
    REQUIRED
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_protobuf_INSTALL_DIR})

add_library(3rd_party_protobuf STATIC IMPORTED GLOBAL)
set_target_properties(
  3rd_party_protobuf
  PROPERTIES IMPORTED_LOCATION ${PROTOBUF_LIBRARY}
             INTERFACE_INCLUDE_DIRECTORIES ${3RD_PARTY_protobuf_INSTALL_DIR}/include)
