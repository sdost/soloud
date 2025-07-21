project "SoLoud"
kind "StaticLib"
language "C++"
cppdialect "C++17"
staticruntime "off"

targetdir("bin/" .. outputdir .. "/%{prj.name}")
objdir("bin-int/" .. outputdir .. "/%{prj.name}")

files
{
  -- Core library files
  "src/core/**.cpp",
  "src/core/**.h",
  
  -- Audio source files (core audio sources only)
  "src/audiosource/**.cpp",
  "src/audiosource/**.h",
  "src/audiosource/wav/stb_vorbis.c",
  
  -- Backend files
  "src/backend/null/**.cpp",
  "src/backend/null/**.h",
  
  -- Filter files
  "src/filter/**.cpp",
  "src/filter/**.h",
  
  -- Include files
  "include/**.h"
}

includedirs
{
  "include"
}

defines
{
  "_CRT_SECURE_NO_WARNINGS",
  "WITH_NULL"
}

filter "system:windows"
systemversion "latest"

filter "configurations:Debug"
runtime "Debug"
symbols "on"

filter "configurations:Release"
runtime "Release"
optimize "on"

filter "configurations:Dist"
runtime "Release"
optimize "on" 