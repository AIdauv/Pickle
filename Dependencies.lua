
-- Pickle Dependencies

IncludeDir = {}
IncludeDir["GLFW"] = "%{wks.location}/Pickle/vendor/GLFW/include"
IncludeDir["Glad"] = "%{wks.location}/Pickle/vendor/Glad/include"
IncludeDir["glm"] = "%{wks.location}/Pickle/vendor/glm"
IncludeDir["stb_image"] = "%{wks.location}/Pickle/vendor/stb_image"

Library = {}

-- Windows
Library["WinSock"] = "Ws2_32.lib"
Library["WinMM"] = "Winmm.lib"
Library["WinVersion"] = "Version.lib"
Library["BCrypt"] = "Bcrypt.lib"