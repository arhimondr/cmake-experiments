include_guard(GLOBAL)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(BOOST_BUILD_TYPE "debug")
else()
  set(BOOST_BUILD_TYPE "release")
endif()

install_3rd_party_dependency(
  NAME boost
  URL https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.gz
  CONFIGURE_COMMAND ../source/bootstrap.sh --prefix=../install
  BUILD_COMMAND     ./b2 link=static variant=${BOOST_BUILD_TYPE} install
  BUILD_IN_SOURCE ON
)

find_library(BOOST_LIBRARY
    # TODO
    NAMES boost_atomic
    PATHS ${3RD_PARTY_boost_INSTALL_DIR}/lib ${3RD_PARTY_boost_INSTALL_DIR}/lib64
    NO_DEFAULT_PATH
    NO_CMAKE_FIND_ROOT_PATH
    REQUIRED
)

# make it available for other dependencies
list(PREPEND CMAKE_PREFIX_PATH ${3RD_PARTY_boost_INSTALL_DIR})

add_library(3rd_party_boost STATIC IMPORTED GLOBAL)
set_target_properties(
  3rd_party_boost
  PROPERTIES IMPORTED_LOCATION ${BOOST_LIBRARY}
             INTERFACE_INCLUDE_DIRECTORIES ${3RD_PARTY_boost_INSTALL_DIR}/include)
