cmake_minimum_required(VERSION 3.16)
project(stackful-coroutines ASM)
enable_language(ASM)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_ASM_COMPILER arm-none-eabi-as)
set(CMAKE_LINKER arm-none-eabi-ld)
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(CMAKE_ASM_FLAGS "-g")
endif()
set(CMAKE_ASM_COMPILE_OBJECT "<CMAKE_ASM_COMPILER> ${CMAKE_ASM_FLAGS} -o <OBJECT> <SOURCE>")
SET(CMAKE_EXE_LINKER_FLAGS "-Ttext=0x8000000")
set(CMAKE_ASM_LINK_EXECUTABLE "<CMAKE_LINKER> <OBJECTS> -o <TARGET> <LINK_FLAGS>")

add_executable(intro.elf 01-intro/prog.s)
add_executable(led-hello-world.elf 02-led-hello-world/prog.s)
add_executable(led-blink.elf 03-led-blink/prog.s)
