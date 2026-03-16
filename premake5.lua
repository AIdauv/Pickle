include "Dependencies.lua"

workspace "Pickle"
    architecture "x86_64"
    startproject "Fork"

    configurations 
    {
        "Debug",
        "Release",
        "Dist"
    }

    flags
    {
        "MultiProcessorCompile"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

group "Dependencies"
    include "vendor/premake"
    include "Pickle/vendor/GLFW"
    include "Pickle/vendor/Glad"
group ""

group "Core"
	include "Pickle"
group ""

group "Tools"
	include "Fork"
group ""
