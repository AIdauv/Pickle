project "Fork"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    staticruntime"off"

    targetdir("%{wks.location}/bin/" .. outputdir .. "/")
    objdir("%{wks.location}/bin-int/" .. outputdir .. "/")

    files
    {
        "src/**.h",
        "src/**.cpp"
    }

    includedirs
    {
        "%{wks.location}/Pickle/vendor/spdlog/include",
        "%{wks.location}/Pickle/src",
        "%{wks.location}/Pickle/vendor",
        "%{IncludeDir.glm}"
    }

    links
    {
        "Pickle"
    }

    filter "system:windows"
        systemversion "latest"

        links
		{
            "opengl32.lib",
			"%{Library.WinSock}",
			"%{Library.WinMM}",
			"%{Library.WinVersion}",
			"%{Library.BCrypt}"
		}

    filter "configurations:Debug"
        defines "BC_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "BC_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "BC_DIST"
        runtime "Release"
        optimize "on"