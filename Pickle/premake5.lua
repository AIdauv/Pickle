project "Pickle"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime"off"

    targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

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
