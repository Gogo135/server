# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.24.0-rc2)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(argparse-populate NONE)


# Pass through things we've already detected in the main project to avoid
# paying the cost of redetecting them again in ExternalProject_Add()
set(GIT_EXECUTABLE [==[C:/Users/Chris/AppData/Local/Atlassian/SourceTree/git_local/bin/git.exe]==])
set(GIT_VERSION_STRING [==[2.20.1.windows.1]==])
set_property(GLOBAL PROPERTY _CMAKE_FindGit_GIT_EXECUTABLE_VERSION
  [==[C:/Users/Chris/AppData/Local/Atlassian/SourceTree/git_local/bin/git.exe;2.20.1.windows.1]==]
)


include(ExternalProject)
ExternalProject_Add(argparse-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/p-ranav/argparse.git" "GIT_TAG" "f901d9edb47d45a287ca44d5bab48540c1fcdcce"
                    SOURCE_DIR          "C:/Users/Chris/Desktop/CactuarLSB/server/_deps/argparse-src"
                    BINARY_DIR          "C:/Users/Chris/Desktop/CactuarLSB/server/_deps/argparse-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
                    USES_TERMINAL_PATCH     YES
)


