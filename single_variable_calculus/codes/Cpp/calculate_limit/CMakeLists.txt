cmake_minimum_required(VERSION 3.10)

get_filename_component(ProjectId ${CMAKE_CURRENT_SOURCE_DIR} NAME)

string(REPLACE " " "_" ProjectId ${ProjectId})

project(${ProjectId})

add_executable(${ProjectId} main.cpp)
