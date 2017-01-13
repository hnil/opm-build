set(CMAKE_C_COMPILER "mpicc" CACHE STRING "C compiler")
set(CMAKE_CXX_COMPILER "mpicxx" CACHE STRING "C++ compiler")
set(CMAKE_Fortran_COMPILER "mpif90" CACHE STRING "Fortran compiler")
set(PRECOMPILE_HEADERS OFF CACHE BOOL "Precompiled headers")
set(SILENCE_EXTERNAL_WARNINGS ON CACHE BOOL "Silence warnings from external libraries")
set(USE_MPI ON CACHE BOOL "Use MPI")
set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Build type")
set (CMAKE_CXX_FLAGS
        "-pipe -std=c++0x -pedantic -Wall -Wextra -Wformat-nonliteral -Wcast-align -Wpointer-arith -Wmissing-declarations -Wcast-qual -Wshadow -Wwrite-strings -Wchar-subscripts -Wredundant-decls"
        CACHE STRING "Flags used by the compiler during all build types")
set (CMAKE_C_FLAGS_DEBUG
        "-O2 -g -fno-omit-frame-pointer -march=native -mtune=native"
        CACHE STRING "Flags used during Debug builds")
set (CMAKE_CXX_FLAGS_DEBUG
        "-O2 -g -fno-omit-frame-pointer -march=native -mtune=native"
        CACHE STRING "Flags used during Debug builds")
set (CMAKE_C_FLAGS_RELEASE
        "-O2 -DNDEBUG -march=native -mtune=native"
        CACHE STRING "Flags used during Release builds")
set (CMAKE_CXX_FLAGS_RELEASE
        "-O2 -DNDEBUG -march=native -mtune=native"
        CACHE STRING "Flags used during Release builds")
