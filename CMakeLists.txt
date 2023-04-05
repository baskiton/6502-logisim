cmake_minimum_required(VERSION 3.20)

set(CMAKE_TOOLCHAIN_FILE tc.cmake)
set(TOOLS_DIR ${PROJECT_SOURCE_DIR}/tools)
set(genromfs ${PROJECT_SOURCE_DIR}/tools/genromfs)

include_directories(include)

project(cmake_test ASM C)
set(CMAKE_C_STANDARD 99)

add_library(klib STATIC
        src/zpage.asm
        src/tty.asm
)

add_executable(cmake_test
        src/test.c
)
target_link_libraries(cmake_test
        klib
)

include(ExternalProject)

find_program(MAKE_EXE make gmake)
ExternalProject_Add(genromfs
        GIT_REPOSITORY https://github.com/chexum/genromfs.git
        CONFIGURE_COMMAND ""
        BUILD_IN_SOURCE TRUE
        COMMAND mkdir ${TOOLS_DIR}
        INSTALL_COMMAND cp --remove-destination <SOURCE_DIR>/genromfs ${genromfs}
)
#add_dependencies(cmake_test genromfs)
