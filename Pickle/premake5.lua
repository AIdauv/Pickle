project "Pickle"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime"off"

    targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "pkpch.h"
    pchsource "src/pkpch.cpp"

    files
    {
        "src/**.h",
        "src/**.cpp",
        "vendor/stb_image/**.h",
        "vendor/stb_image/**.cpp",
        "vendor/glm/glm/**.hpp",
        "vendor/glm/glm/**.inl"
    }

    defines
    {
        "_CRT_SECURE_NO_WARNINGS",
        "GLFW_INCLUDE_NONE"
    }

    includedirs
    {
        "src",
        "vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.glm}",
        "%{IncludeDir.stb_image}"
    }

    links 
    {
        "GLFW",
        "Glad"
    }

 
    filter "system:windows"
        systemversion "latest"

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
