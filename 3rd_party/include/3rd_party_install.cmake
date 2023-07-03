include_guard(GLOBAL)

function(install_3rd_party_cmake_dependency)
    
    cmake_parse_arguments("LIB" "" "NAME;URL;SOURCE_SUBDIR;" "CMAKE_FLAGS;PATCH_COMMAND;" ${ARGN})

    if(NOT LIB_NAME)
        message(FATAL_ERROR "Parameter NAME is required!")
    endif()

    if(NOT LIB_URL)
        message(FATAL_ERROR "Parameter URL is required!")
    endif()

    if(NOT LIB_CMAKE_FLAGS)
        set(LIB_CMAKE_FLAGS "")
    endif()

    if(NOT LIB_SOURCE_SUBDIR)
        set(LIB_SOURCE_SUBDIR ".")
    endif()

    if(NOT LIB_PATCH_COMMAND)
        set(LIB_PATCH_COMMAND "")
    endif()


    set(LIB_ROOT_DIR ${CMAKE_BINARY_DIR}/3rd_party/${LIB_NAME})
    set(LIB_DOWNLOAD_DIR ${LIB_ROOT_DIR}/download)
    set(LIB_SOURCE_DIR ${LIB_ROOT_DIR}/source)
    set(LIB_BUILD_DIR ${LIB_ROOT_DIR}/build)
    set(LIB_INSTALL_DIR ${LIB_ROOT_DIR}/install)

    configure_file(${CMAKE_CURRENT_FUNCTION_LIST_DIR}/CMakeLists.txt.in ${LIB_DOWNLOAD_DIR}/CMakeLists.txt)

    execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
        RESULT_VARIABLE result
        WORKING_DIRECTORY ${LIB_DOWNLOAD_DIR} )
    if(result)
        message(FATAL_ERROR "CMake step for ${LIB_NAME} failed: ${result}")
    endif()

    execute_process(COMMAND ${CMAKE_COMMAND} --build .
        RESULT_VARIABLE result
        WORKING_DIRECTORY ${LIB_DOWNLOAD_DIR} )
    if(result)
        message(FATAL_ERROR "Build step for ${LIB_NAME} failed: ${result}")
    endif()

    set(3RD_PARTY_${LIB_NAME}_FOUND ON PARENT_SCOPE)
    set(3RD_PARTY_${LIB_NAME}_INSTALL_DIR ${LIB_INSTALL_DIR} PARENT_SCOPE)

endfunction()
