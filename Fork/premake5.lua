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
        defines "PK_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "PK_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "PK_DIST"
        runtime "Release"
        optimize "on"