#pragma once

#include "Pickle/Core/Base.h"
#include "Pickle/Core/Application.h"

#ifdef PK_PLATFORM_WINDOWS

extern Pickle::Application* Pickle::CreateApplication();

int main(int argc, char** argv)
{
	Pickle::Log::Init();

	auto app = Pickle::CreateApplication();
	app->Run();
	delete app;
}

#else
	#error Pickle only supports windows!
#endif