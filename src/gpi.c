#include "gpi.h"
#define GPI_DEBUG
#include "gpi_debug.h"

#define VK_USE_PLATFORM_XLIB_KHR
#include <SDL3/SDL.h>
#include <SDL3/SDL_mutex.h>
#include <SDL3/SDL_gpu.h>
#include <stdlib.h>
#include <shaderc/shaderc.h>
#include "spirv_reflect.h"

#define SIZE_T_MAX 0xFFFFFFFFFFFFFFFF

typedef struct {
    size_t 	unique;
    O_Type 	type;
    int    	index;
} _O_ID;

typedef struct {
} O_Image;
typedef struct {
	SDL_Window* 	p_sdl_window;

	unsigned int 	thead_id; // for later
} O_Window;
typedef struct {
} O_Box;
typedef struct {
} O_Group;
typedef struct {
} O_Renderer;
typedef struct {
} O_Function;
typedef struct {
    void*                           p_spv_code;
    unsigned int                    spv_code_size;
    shaderc_shader_kind             shader_kind;
    SpvReflectShaderModule          reflect_shader_module;
    VkShaderModule                  shader_module;
} O_Shader;

// global context =====================================================================================
static SDL_GPUDevice* 			g_p_gpu_device = NULL;

	// id =================================================================================================
	static _O_ID* 				g_p_ids = NULL;
	static int  				g_ids_count = 0;
	static int   				g_ids_capacity = 0;
	static size_t    			g_unique_number_count = 0;

	// image ==============================================================================================
	static O_Image* 			g_p_images = NULL;
	static int  				g_images_count = 0;
	static int   				g_images_capacity = 0;

	// window =============================================================================================
	static O_Window* 			g_p_windows = NULL;
	static int  				g_windows_count = 0;
	static int   				g_windows_capacity = 0;

	// box ================================================================================================
	static O_Box* 				g_p_boxes = NULL;
	static int  				g_boxes_count = 0;
	static int   				g_boxes_capacity = 0;

	// group ==============================================================================================
	static O_Group* 			g_p_groups = NULL;
	static int  				g_groups_count = 0;
	static int   				g_groups_capacity = 0;

	// renderer ===========================================================================================
	static O_Renderer*			g_p_renderers = NULL;
	static int  				g_renderers_count = 0;
	static int   				g_renderers_capacity = 0;

	// function ===========================================================================================
	static O_Function* 			g_p_functions = NULL;
	static int  				g_functions_count = 0;
	static int   				g_functions_capacity = 0;

// internal functions =================================================================================

	// decleration ====================================================================================
	bool 	_o_ID_equalsNULL(int id_index);
	int 	_o_ID_create(O_Type type);
	bool 	_o_ID_destroy(int id_index);

	int 	_o_getAvailableIndex();
	void*  	_o_getPointer(int id_index);
	bool    _o_boundsCheck(O_Type type, int index);

	// implementation =================================================================================

	bool 	_o_ID_equalsNULL(int id_index) {
		ASSERT(o_ID_outsideBounds(id_index), "ERROR: given id is out of bounds. id = %d, id bound range = (%d, %d) aborting.\n", id_index, 0, g_ids_count);
		_O_ID id = g_p_ids[id_index];
		if (id.unique == SIZE_T_MAX
	     || id.type == NONE
	     || id.index == -1) 
		{
			ASSERT(id.unique == SIZE_T_MAX
		        && id.type == NONE
		        && id.index == -1, 
		        "INTERNAL ERROR: _O_ID cannot be partially NULL_ID\n _O_ID = {unique=%ld, type=%d, index=%d}", id.unique, id.type, id.index);
			return true;
		}
		return false;
	}
	int 	_o_getAvailableIndex(O_Type type) {
		int* p_count = NULL;
		int* p_capacity = NULL;
		switch (type) {
			case ID: {
				p_count = &g_ids_count;
				p_capacity = &g_ids_capacity;
				break;
			}
			case IMAGE: {
				p_count = &g_images_count;
				p_capacity = &g_images_capacity;
				break;
			}
			case WINDOW: {
				p_count = &g_windows_count;
				p_capacity = &g_windows_capacity;
				break;
			}
			case BOX: {
				p_count = &g_boxes_count;
				p_capacity = &g_boxes_capacity;
				break;
			}
			case GROUP: {
				p_count = &g_groups_count;
				p_capacity = &g_groups_capacity;
				break;
			}
			case FUNCTION: {
				p_count = &g_functions_count;
				p_capacity = &g_functions_capacity;
				break;
			}
			default: {
				printf("INTERNAL ERROR: you provided an invalid O_Type: %d\n", type);
				return -1;
			}
		}
		ASSERT(p_count && p_capacity, "still NULL\n");

		int available_index = -1;
		// has to start from index 1 because index 0 is reserved for O_NULL_ID
		for (int id_index = 0; id_index < (*p_count); ++id_index) {
			TRACK({
				if (_o_ID_equalsNULL(id_index)) {
					available_index = id_index;
					break;
				}
			})
		}

		// if couldnt find NULL ID in range 0 to (*p_count), then increment (*p_count)
		if (available_index == -1) {
			
			// allocation more memory if not enough
			if ((*p_capacity) <= (*p_count)) {
				int new_capacity = 1;
				while (new_capacity <= (*p_count)) {
					new_capacity*=2;
					ASSERT(new_capacity <= 0, "INTERNAL ERROR. reached capacity limit!\n");
				}

				switch (type) {
					case ID: {
						TRACK(g_p_ids = alloc(g_p_ids, sizeof(_O_ID) * new_capacity));
						for (int i = (*p_count); i < new_capacity; ++i) {
							g_p_ids[i].unique = SIZE_T_MAX;
							g_p_ids[i].type = NONE;
							g_p_ids[i].index = -1;
						}
						break;
					}
					case IMAGE: {
						TRACK(g_p_images = alloc(g_p_images, sizeof(O_Image) * new_capacity));
						memset(g_p_images+(*p_count), 0, sizeof(O_Image) * (new_capacity-(*p_count)));
						break;
					}
					case WINDOW: {
						TRACK(g_p_windows = alloc(g_p_windows, sizeof(O_Window) * new_capacity));
						memset(g_p_windows+(*p_count), 0, sizeof(O_Window) * (new_capacity-(*p_count)));
						break;
					}
					case BOX: {
						TRACK(g_p_boxes = alloc(g_p_boxes, sizeof(O_Box) * new_capacity));
						memset(g_p_boxes+(*p_count), 0, sizeof(O_Box) * (new_capacity-(*p_count)));
						break;
					}
					case GROUP: {
						TRACK(g_p_groups = alloc(g_p_groups, sizeof(O_Group) * new_capacity));
						memset(g_p_groups+(*p_count), 0, sizeof(O_Group) * (new_capacity-(*p_count)));
						break;
					}
					case FUNCTION: {
						TRACK(g_p_functions = alloc(g_p_functions, sizeof(O_Function) * new_capacity));
						memset(g_p_functions+(*p_count), 0, sizeof(O_Function) * (new_capacity-(*p_count)));
						break;
					}
					default: {
						printf("INTERNAL ERROR: the given id type is unknown\n");
						return -1;
					}
				}
					
				(*p_capacity) = new_capacity;
			}
			available_index = (*p_count)++;
		}
		return available_index;
	}
	void* 	_o_getPointer(int id_index) {
		O_Type type = g_p_ids[id_index].type;
		O_Type index = g_p_ids[id_index].index;
		switch (type) {
			case ID: {
				ASSERT(_o_boundsCheck(type, index), "INTERNAL ERROR: out of bounds");
				return (void*)&g_p_ids[index];
			}
			case IMAGE: {
				ASSERT(_o_boundsCheck(type, index), "INTERNAL ERROR: out of bounds");
				return (void*)&g_p_ids[index];
			}
			case WINDOW: {
				ASSERT(_o_boundsCheck(type, index), "INTERNAL ERROR: out of bounds");
				return (void*)&g_p_ids[index];
			}
			case BOX: {
				ASSERT(_o_boundsCheck(type, index), "INTERNAL ERROR: out of bounds");
				return (void*)&g_p_ids[index];
			}
			case GROUP: {
				ASSERT(_o_boundsCheck(type, index), "INTERNAL ERROR: out of bounds");
				return (void*)&g_p_ids[index];
			}
			case FUNCTION: {
				ASSERT(_o_boundsCheck(type, index), "INTERNAL ERROR: out of bounds");
				return (void*)&g_p_ids[index];
			}
		}
	}
	int 	_o_ID_create(O_Type type) {

		ASSERT(g_p_gpu_device, "INTERNAL ERROR: O has to be initialized first");
		ASSERT(g_p_ids!=NULL && g_ids_capacity>=1, "INTERNAL ERROR: global context has to be initialized first");

		if (type == NONE) {
			printf("INTERNAL WARNING: why are you trying to create a Lo_NULL_ID?\n");
			return -1;
		}

		int available_id_index = _o_getAvailableIndex(ID);
			
		int available_type_index = _o_getAvailableIndex(type);

		ASSERT(available_type_index != -1, "INTERNAL ERROR: Could not successfully create new Lo_O_Type of type %d\n", type);

		g_p_ids[available_id_index].unique = g_unique_number_count++;
		g_p_ids[available_id_index].type = type;
		g_p_ids[available_id_index].index = available_type_index;

		// success
		return available_id_index;
	}
	bool 	_o_boundsCheck(O_Type type, int index) {
		switch (type) {
			case ID: return 0 <= index && index < g_ids_count;
			case IMAGE: return 0 <= index && index < g_images_count;
			case WINDOW: return 0 <= index && index < g_windows_count;
			case BOX: return 0 <= index && index < g_boxes_count;
			case GROUP: return 0 <= index && index < g_groups_count;
			case FUNCTION: return 0 <= index && index < g_functions_count;
			default: ASSERT(false, "INTERNAL ERROR: you provided unsupported type\n");
		} 
		return false;
	}

// global context =====================================================================================
bool o_Initialize() {
	if (g_p_gpu_device) {
		printf("WARNING: lo_GUI is already initialized\n");
		return false;
	}

	if (!SDL_Init(SDL_INIT_VIDEO)) {
		printf("ERROR: failed to initialize SDL3: %s\n", SDL_GetError());
		return false;
	}

	#ifdef __linux__
		#ifdef LO_DEBUG
			TRACK(g_p_gpu_device = SDL_CreateGPUDevice(SDL_GPU_SHADERFORMAT_SPIRV, true, NULL));
		#else 
			TRACK(g_p_gpu_device = SDL_CreateGPUDevice(SDL_GPU_SHADERFORMAT_SPIRV, false, NULL));
		#endif // LO_DEBUG
	#elif defined(_WIN64)
		printf("windows 64-bit is not supported yet\n");
		return false;
	#elif defined(_WIN32)
		printf("windows 32-bit is not supported yet\n");
		return false;
	#elif defined(__CYGWIN__)
		printf("cygwin is not supported yet\n");
		return false;
	#elif defined(__APPLE__)
		printf("macos is not supported yet\n");
		return false;
	#elif defined(__FreeBSD__)
		printf("free bsd is not supported yet\n");
		return false;
	#elif defined(__ANDROID__)
		printf("android is not supported yet\n");
		return false;
	#else 
		printf("unrecignized os is not supported\n");
		return false;
	#endif

	if (!g_p_gpu_device) {
		printf("ERROR: failed to create SDL3 device: %s\n", SDL_GetError());
		return false;
	}

	// allocating one id
	TRACK(g_p_ids = alloc(g_p_ids, sizeof(_O_ID)));
	g_ids_count = 0;
	g_ids_capacity = 1;
	g_p_ids[0].unique = SIZE_T_MAX;
	g_p_ids[0].type = NONE;
	g_p_ids[0].index = -1;

	return true;
}
bool o_Destroy() {
	if (!g_p_gpu_device) {
		printf("WARNING: lo_GUI is not initialized so you cannot destroy it\n");
		return false;
	}
	SDL_DestroyGPUDevice(g_p_gpu_device);

	return true;
}

// gui_id =============================================================================================

O_Type o_ID_GetType(int id_index) {
	ASSERT(o_ID_outsideBounds(id_index), 
		"ERROR: given id is out of bounds. id = %d, id bound range = (%d, %d) aborting.\n", id_index, 0, g_ids_count);
	return g_p_ids[id_index].type;
}
bool o_ID_outsideBounds(int id_index) {
	return 0 <= id_index && id_index < g_ids_count;
}
bool o_ID_isValid(int id_index) {
	ASSERT(o_ID_outsideBounds(id_index), 
		"ERROR: given id is out of bounds. id = %d, id bound range = (%d, %d) aborting.\n", id_index, 0, g_ids_count);
	bool valid = true;
	_O_ID id = g_p_ids[id_index];
	if (id.unique >= g_unique_number_count) {
		printf("unique number in id is invalid\n");
		valid = false;;
	}
	if (!(id.type == ID ||
		id.type == IMAGE ||
		id.type == WINDOW ||
		id.type == BOX ||
		id.type == GROUP ||
		id.type == FUNCTION)) {
		printf("type in id is invalid\n");
		valid = false;
	}
	if (!(
		(id.type == ID && id.index < g_ids_count) ||
		(id.type == IMAGE && id.index < g_images_count) ||
		(id.type == WINDOW && id.index < g_windows_count) ||
		(id.type == BOX && id.index < g_boxes_count) ||
		(id.type == GROUP && id.index < g_groups_count) ||
		(id.type == FUNCTION && id.index < g_functions_count))) {
		printf("index for type in id is invalid\n");
		valid = false;
	}
	return valid;
}

// window =============================================================================================
int o_Window_Create(
	unsigned int width, 
	unsigned int height,
	const char* title) 
{
	ASSERT(title, "title is NULL\n");
	int window_id_index = _o_ID_create(WINDOW);
	ASSERT(o_ID_outsideBounds(window_id_index), "ERROR: window_id_index is out of bounds. id = %d, id bound range = (%d, %d) aborting.\n", window_id_index, 0, g_ids_count);
	_O_ID* p_id = &g_p_ids[window_id_index];
	O_Window* p_window = &g_p_windows[p_id->index];
	ASSERT(!p_window->p_sdl_window, "INTERNAL ERROR: sdl window should be NULL\n");
	TRACK(p_window->p_sdl_window = SDL_CreateWindow(title, width, height, SDL_WINDOW_RESIZABLE));
	if (!p_window->p_sdl_window) {
		printf("ERROR: failed to create window: %s\n", SDL_GetError());
		TRACK(o_Window_Destroy(window_id_index));
		return -1;
	}

	return window_id_index;
}
void o_Window_Show() {
	SDL_Event event;
    bool quit = false;
    while (!quit) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_EVENT_QUIT) {
                quit = true;
            }
        }
        SDL_Delay(16);
    }
}
bool o_Window_Destroy(int window_id_index) {
	ASSERT(o_ID_outsideBounds(window_id_index), "ERROR: given window_id_index is out of bounds. id = %d, id bound range = (%d, %d) aborting.\n", window_id_index, 0, g_ids_count);
	if (_o_ID_equalsNULL(window_id_index)) {
		printf("WARNING: given window id is not a window but is NULL_ID. Window is not destroyed\n");
		return false;
	}
	if (!o_ID_isValid(window_id_index)) {
		printf("WARNING: given window id is invalid and is not destroyed\n");
		return false;
	}

	O_Window* p_window = &g_p_windows[g_p_ids[window_id_index].index];
	SDL_DestroyWindow(p_window->p_sdl_window);

	return true;
}

// shader =============================================================================================
size_t _o_Shader_ReadFile(const char* filename, char** dst_buffer) {
    FILE* file = fopen(filename, "rb");
    if (!file) {
        printf("Failed to open shader source file '%s'\n", filename);
        exit(-1);
    }

    fseek(file, 0, SEEK_END);
    size_t file_size = ftell(file);
    rewind(file);

    *dst_buffer = (char*)alloc(NULL, file_size + 1);
    if (!*dst_buffer) {
        printf("Failed to allocate memory for shader source '%s'\n", filename);
        fclose(file);
        exit(-1);
    }

    size_t readSize = fread(*dst_buffer, 1, file_size, file);
    (*dst_buffer)[file_size] = '\0'; 

    if (readSize != file_size) {
        printf("Failed to read shader source '%s'\n", filename);
        free(*dst_buffer);
        fclose(file);
        exit(-1);
    }

    fclose(file);
    return (unsigned int)file_size;
}
unsigned int _o_Shader_FormatSize(SDL_GPUVertexElementFormat format) {
	ASSERT(format != SDL_GPU_VERTEXELEMENTFORMAT_INVALID, "INTERNAL ERROR: format is invlaid\n");
  	unsigned int result = 0;
  	switch (format) {
	    case SDL_GPU_VERTEXELEMENTFORMAT_INVALID: result = 0; break;

	    /* 32-bit Signed Integers */
	    case SDL_GPU_VERTEXELEMENTFORMAT_INT: result = 4; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_INT2: result = 8; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_INT3: result = 12; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_INT4: result = 16; break;

	    /* 32-bit Unsigned Integers */
	    case SDL_GPU_VERTEXELEMENTFORMAT_UINT: result = 4; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_UINT2: result = 8; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_UINT3: result = 12; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_UINT4: result = 16; break;

	    /* 32-bit Floats */
	    case SDL_GPU_VERTEXELEMENTFORMAT_FLOAT: result = 4; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2: result = 8; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3: result = 12; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4: result = 16; break;

	    /* 8-bit Signed Integers */
	    case SDL_GPU_VERTEXELEMENTFORMAT_BYTE2: result = 2; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_BYTE4: result = 4; break;

	    /* 8-bit Unsigned Integers */
	    case SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2: result = 2; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4: result = 4; break;

	    /* 8-bit Signed Normalized */
	    case SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM: result = 2; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM: result = 4; break;

	    /* 8-bit Unsigned Normalized */
	    case SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM: result = 2; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM: result = 4; break;

	    /* 16-bit Signed Integers */
	    case SDL_GPU_VERTEXELEMENTFORMAT_SHORT2: result = 4; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_SHORT4: result = 8; break;

	    /* 16-bit Unsigned Integers */
	    case SDL_GPU_VERTEXELEMENTFORMAT_USHORT2: result = 4; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_USHORT4: result = 8; break;

	    /* 16-bit Signed Normalized */
	    case SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM: result = 4; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM: result = 8; break;

	    /* 16-bit Unsigned Normalized */
	    case SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM: result = 4; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM: result = 8; break;

	    /* 16-bit Floats */
	    case SDL_GPU_VERTEXELEMENTFORMAT_HALF2: result = 4; break;
	    case SDL_GPU_VERTEXELEMENTFORMAT_HALF4: result = 8; break;
  	}
  	ASSERT(result == 0, "INTERNAL ERROR: could not find any format\n");
  	return result;
}
void _o_Shader_PrintAttributeDescriptions(
	SDL_GPUVertexAttribute* p_attributes, 
	size_t attribs_count) 
{
    for (unsigned int i = 0; i < attribs_count; ++i) {
        printf("attrib %d\n", i);
        printf("\t%d\n", p_attributes[i].location);
        printf("\t%d\n", p_attributes[i].buffer_slot);
        printf("\t%d\n", p_attributes[i].format);
        printf("\t%d\n", p_attributes[i].offset);
    }
}
SDL_GPUVertexAttribute* _o_Shader_Create_VertexInputAttribDesc(
	const O_Shader shader,
	unsigned int* p_attribute_count, 
	unsigned int* p_binding_stride) 
{
	VERIFY(p_attribute_count, " ");
	VERIFY(p_binding_stride, " ");
    VERIFY(shader.reflect_shader_module.shader_stage == SPV_REFLECT_SHADER_STAGE_VERTEX_BIT, "Provided shader is not a vertex shader\n");

    // Enumerate input variables
    unsigned int input_var_count = 0;
    TRACK(SpvReflectResult result = spvReflectEnumerateInputVariables(&shader.reflect_shader_module, &input_var_count, NULL));
    VERIFY(result == SPV_REFLECT_RESULT_SUCCESS, "Failed to enumerate input variables\n");

    TRACK(SpvReflectInterfaceVariable** input_vars = alloc(NULL, input_var_count * sizeof(SpvReflectInterfaceVariable*)));
    VERIFY(input_vars, "Failed to allocate memory for input variables\n");

    TRACK(result = spvReflectEnumerateInputVariables(&shader.reflect_shader_module, &input_var_count, input_vars));
    VERIFY(result == SPV_REFLECT_RESULT_SUCCESS, "Failed to get input variables\n");

    // Create an array to hold VkVertexInputAttributeDescription
    TRACK(VkVertexInputAttributeDescription* attribute_descriptions = alloc(NULL, input_var_count * sizeof(VkVertexInputAttributeDescription)));
    VERIFY(attribute_descriptions, "Failed to allocate memory for vertex input attribute descriptions\n");

    unsigned int attribute_index = 0;
    for (unsigned int i = 0; i < input_var_count; ++i) {
        SpvReflectInterfaceVariable* refl_var = input_vars[i];

        // Ignore built-in variables
        if (refl_var->decoration_flags & SPV_REFLECT_DECORATION_BUILT_IN) {
            continue;
        }

        VkVertexInputAttributeDescription attr_desc = {};
        attr_desc.location = refl_var->location;
        attr_desc.binding = 0;
        attr_desc.format = (VkFormat)refl_var->format;
        attr_desc.offset = 0; // WILL CALCULATE OFFSET LATER
        attribute_descriptions[attribute_index++] = attr_desc;
    }

    // Update the attribute count
    *p_attribute_count = attribute_index;

    // Sort attributes by location
    for (unsigned int i = 0; i < attribute_index - 1; ++i) {
        for (unsigned int j = 0; j < attribute_index - i - 1; ++j) {
            if (attribute_descriptions[j].location > attribute_descriptions[j + 1].location) {
                VkVertexInputAttributeDescription temp = attribute_descriptions[j];
                attribute_descriptions[j] = attribute_descriptions[j + 1];
                attribute_descriptions[j + 1] = temp;
            }
        }
    }

    // Compute offsets and binding stride
    unsigned int offset = 0;
    for (unsigned int i = 0; i < attribute_index; ++i) {
        VkVertexInputAttributeDescription* attr_desc = &attribute_descriptions[i];
        TRACK(unsigned int format_size = _o_Shader_FormatSize(attr_desc->format));

        if (format_size == 0) {
            printf("Unsupported format for input variable at location %u\n", attr_desc->location);
            continue;
        }

        // Align the offset if necessary (e.g., 4-byte alignment)
        unsigned int alignment = 4;
        offset = (offset + (alignment - 1)) & ~(alignment - 1);
        attr_desc->offset = offset;
        offset += format_size;
    }

    *p_binding_stride = offset;
    free(input_vars);
    _o_Shader_PrintAttributeDescriptions(attribute_descriptions, *p_attribute_count);

    return attribute_descriptions;  
}

int o_Shader_CreateFromGlslFile(
	const char* glsl_file_path, 
	shaderc_shader_kind shader_kind) 
{
	VERIFY(p_ctx, "NULL pointer");
	VERIFY(glsl_file_path, "NULL pointer");
	VERIFY(	shader_kind == shaderc_vertex_shader ||
  			shader_kind == shaderc_fragment_shader || 
  			shader_kind == shaderc_compute_shader,
  			"shader kind is not supported");

	O_Shader shader = {0};

	// shaderc_shader_kind
	{
		shader.shader_kind = shader_kind;
	}

	// spv code compilation
	{
		char* p_glsl_code = NULL;
	    TRACK(size_t glsl_code_size = _o_Shader_ReadFile(glsl_file_path, &p_glsl_code));
	    VERIFY(p_glsl_code, "NULL pointer");
	   	TRACK(shaderc_compilation_result_t result = shaderc_compile_into_spv(
	    	p_ctx->shaderc_compiler, p_glsl_code, glsl_code_size, shader_kind, glsl_file_path, "main", p_ctx->shaderc_options));
	    VERIFY(shaderc_result_get_compilation_status(result) == shaderc_compilation_status_success, 
	    	"Shader compilation error in '%s':\n%s\n", glsl_file_path, shaderc_result_get_error_message(result));
		TRACK(shader.spv_code_size = shaderc_result_get_length(result));
	    TRACK(shader.p_spv_code = alloc(NULL, shader.spv_code_size));
	    VERIFY(shader.p_spv_code, "Failed to allocate memory for SPIR-V code");
	    memcpy(shader.p_spv_code, shaderc_result_get_bytes(result), shader.spv_code_size);
	    TRACK(shaderc_result_release(result));
	}

    // SpvReflectShaderModule
    {
		TRACK(SpvReflectResult reflectResult = spvReflectCreateShaderModule(shader.spv_code_size, shader.p_spv_code, &shader.reflect_shader_module));
	    VERIFY(reflectResult == SPV_REFLECT_RESULT_SUCCESS, "Failed to create SPIRV-Reflect shader module\n");
	    if (shader_kind == shaderc_vertex_shader) {
	    	VERIFY(shader.reflect_shader_module.shader_stage  == SPV_REFLECT_SHADER_STAGE_VERTEX_BIT, "generated reflect shader and shaderc kind is not the same");
	    }
	    else if (shader_kind == shaderc_fragment_shader) {
	    	VERIFY(shader.reflect_shader_module.shader_stage  == SPV_REFLECT_SHADER_STAGE_FRAGMENT_BIT, "generated reflect shader and shaderc kind is not the same");
	    }
	    else if (shader_kind == shaderc_compute_shader) {
	    	VERIFY(shader.reflect_shader_module.shader_stage  == SPV_REFLECT_SHADER_STAGE_COMPUTE_BIT, "generated reflect shader and shaderc kind is not the same");
	    }
	    else {
	    	VERIFY(false, "shader kind is not supported. AND THIS SHOULD HAVE BEEN CHECKED EARLIER");
	    }
	}

    // VkShaderModule
    {
    	VkShaderModuleCreateInfo create_info = {
	        .sType = VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO,
	        .codeSize = shader.spv_code_size,
	        .pCode = shader.p_spv_code
	    };
	    TRACK(VkResult result = vkCreateShaderModule(p_ctx->device, &create_info, NULL, &shader.shader_module));
	    VERIFY(result == VK_SUCCESS, "Failed to create Vulkan shader module\n");
    }

    return shader;
}

void o_Shader_Destroy(
	int p_shader) 
{
    VERIFY(p_ctx, "NULL pointer");
    VERIFY(p_shader, "NULL pointer");

    if (p_shader->shader_module) {
        vkDestroyShaderModule(p_ctx->device, p_shader->shader_module, NULL);
    }
    if (p_shader->p_spv_code) {
        free(p_shader->p_spv_code);
    }
    spvReflectDestroyShaderModule(&p_shader->reflect_shader_module);
    memset(p_shader, 0, sizeof(O_Shader));
    p_shader = NULL;
}