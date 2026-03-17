#pragma once

#include "Pickle/Core/Base.h"

int main(int argc, char** argv);

namespace Pickle
{

	class Application
	{
	public:
		Application();
		virtual ~Application();
	private:
		void Run();
	private:
		friend int ::main(int argc, char** argv);
	};

	// To be define in CLIENT
	Application* CreateApplication();
}