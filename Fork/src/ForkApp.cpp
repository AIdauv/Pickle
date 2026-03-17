#include "Pickle.h"
#include "Pickle/Core/EntryPoint.h"

namespace Pickle
{
	class Fork : public Pickle::Application
	{
	public:
		Fork() {

		}

	};

	Pickle::Application* Pickle::CreateApplication() {
		return new Fork();
	}
}