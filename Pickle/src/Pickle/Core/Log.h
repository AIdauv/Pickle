#pragma once

#include "Pickle/Core/Base.h"
#include <spdlog/spdlog.h>

namespace Pickle
{
	class Log
	{
	public:
		static void Init();

		inline static Ref<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static Ref<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static Ref<spdlog::logger> s_CoreLogger;
		static Ref<spdlog::logger> s_ClientLogger;
	};
}

#ifdef PK_DEBUG
	#define PK_LOG_TRACE(...)    ::Pickle::Log::GetCoreLogger()->trace(__VA_ARGS__)
	#define PK_LOG_INFO(...)     ::Pickle::Log::GetCoreLogger()->info(__VA_ARGS__)
	#define PK_LOG_WARN(...)     ::Pickle::Log::GetCoreLogger()->warn(__VA_ARGS__)
	#define PK_LOG_ERROR(...)    ::Pickle::Log::GetCoreLogger()->error(__VA_ARGS__)
	#define PK_LOG_CRITICAL(...) ::Pickle::Log::GetCoreLogger()->critical(__VA_ARGS__)
#else		
	#define PK_LOG_TRACE(...)    ((void)0)
	#define PK_LOG_INFO(...)     ((void)0)
	#define PK_LOG_WARN(...)     ((void)0)
	#define PK_LOG_ERROR(...)    ((void)0)
	#define PK_LOG_CRITICAL(...) ((void)0)
#endif