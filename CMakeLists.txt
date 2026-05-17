cmake_minimum_required(VERSION 3.14)
project(olcPixelGameEngine_Examples CXX)

enable_testing()

# Global Configuration: Register GoogleTest from your exact ThirdParty path
# This exposes the targets 'gtest' and 'gtest_main' to your whole project
add_subdirectory(code/ThirdParty/googletest)

# Move control into your local code directory
add_subdirectory(code)
