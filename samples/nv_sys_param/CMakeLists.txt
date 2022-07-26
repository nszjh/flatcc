include(CTest)

set(INC_DIR "${PROJECT_SOURCE_DIR}/include")
set(GEN_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")
set(FBS_DIR "${CMAKE_CURRENT_SOURCE_DIR}")

include_directories("${GEN_DIR}" "${INC_DIR}")

add_custom_target(gen_nv_sys_param_fbs ALL) 
add_custom_command (
    TARGET gen_nv_sys_param_fbs
    COMMAND ${CMAKE_COMMAND} -E make_directory "${GEN_DIR}"
    COMMAND flatcc_cli -a -o "${GEN_DIR}" "${FBS_DIR}/nv_sys_param.fbs"
    DEPENDS flatcc_cli "${FBS_DIR}/nv_sys_param.fbs" 
)
add_executable(nv_sys_param nv_sys_param.c)
add_dependencies(nv_sys_param gen_nv_sys_param_fbs)
target_link_libraries(nv_sys_param flatccrt)



if (FLATCC_TEST)
    add_test(nv_sys_param nv_sys_param${CMAKE_EXECUTABLE_SUFFIX})
endif()
