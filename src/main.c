#define O_DEBUG
#include "o_debug.h"
#include "o.h"
#include <SDL3/SDL_events.h>
#include <SDL3/SDL_timer.h>

// Λόγος
// libuv
// libcurl

// 	TODO:
// 		ID shouldnt be int but long long

int main() {
	ASSERT(o_Initialize(), "ERROR: could not initialize Lo_GUI\n");
	int window_id = o_Window_Create(800, 600, "Λόγος");
	ASSERT(window_id>=0, "ERROR: failed to create window\n");
	TRACK(o_Window_Show(window_id));
	ASSERT(o_Window_Destroy(window_id), "ERROR: failed to destroy window\n");
	ASSERT(o_Destroy(), "ERROR: could not destroy Lo_GUI\n");
	return 0;
}