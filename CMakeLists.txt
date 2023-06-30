cmake_minimum_required(VERSION 3.5)

project(cmake_experiments)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
set(CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/3rd_party)
include(3rd_party)

message("CMAKE_PREFIX_PATH=" "${CMAKE_PREFIX_PATH}")

add_library(hello_library src/Hello.cpp)
target_include_directories(hello_library PUBLIC ${PROJECT_SOURCE_DIR}/include)

target_link_libraries(hello_library 3rd_party_fmt 3rd_party_folly)

add_executable(hello_binary src/main.cpp)
target_link_libraries(hello_binary hello_library)
