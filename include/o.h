#ifndef O_H
#define O_H

#include <stdbool.h> // bool
#include <stddef.h> // size_t
#include <shaderc/shaderc.h>

typedef enum {
	NONE,

	ID,
	GROUP,

	BOX,
	FUNCTION,

	COMMAND,
	FENCE,
	RENDER_PASS,
	COMPUTE_PASS,
	COPY_PASS,
	GRAPHICS_PIPELINE,
	COMPUTE_PIPELINE,
	SHADER,

	WINDOW,
	SAMPLER,
	IMAGE,
	TRANSFER,
	BUFFER,

	THREAD
} O_Type;

typedef long long int O_ID;

// =============================================================================================================================
bool 					o_Initialize();
bool  					o_Destroy();

// ID ==========================================================================================================================
O_Type  				o_ID_GetType(int id);
bool 					o_ID_outsideBounds(int id_index);
bool 					o_ID_isValid(int id);

// WINDOW ======================================================================================================================
int  					o_Window_Create(unsigned int width, unsigned int height, const char* title);
void 					o_Window_Show();
int  					o_Window_GetGroupID(int window_id);
bool  					o_Window_Destroy(int window);

// BOX =========================================================================================================================
int    					o_Box_Create(float x, float y, float width, float height, unsigned char red, unsigned char green, unsigned char blue, unsigned char alpha, float rotation_radians, float corner_radius_pixels, int sample_image, float sample_x, float sample_y, float sample_width, float sample_height);
int    					o_Box_CreateEmpty();
void   					o_Box_Copy(int src_box, int dst_box);
void   					o_Box_SetPosition(int box, float x, float y);
void   					o_Box_AddPosition(int box, float d_x, float d_y);
void   					o_Box_SetSize(int box, float width, float height);
void   					o_Box_AddSize(int box, float d_width, float d_height);
void    				o_Box_SetColor(int box, unsigned char red, unsigned char green, unsigned char blue, unsigned char alpha);
void   					o_Box_SetRotation(int box, float rotation_radians);
void   					o_Box_AddRotation(int box, float d_rotation_radians);
void   					o_Box_SetCornerRadius(int box, float corner_radius_pixels);
void   					o_Box_SetImage(int box, int image);
void   					o_Box_SetImageSamplePos(int box, float x, float y);
void   					o_Box_SetImageSampleSize(int box, float width, float height);
void   					o_Box_Destroy(int box);

// IMAGE ========================================================================================================================
int  					o_Image_Create(unsigned int width, unsigned int height, unsigned int format);
int   					o_Image_GetWindowImage();
void 	  				o_Image_Write(int image, void* p_src_data, unsigned int src_width, unsigned int src_height, unsigned int src_x, unsigned int src_y);
void   					o_Image_Read(int image, void* p_dst_data, unsigned int dst_width, unsigned int dst_height, unsigned int dst_x, unsigned int dst_y);
void   					o_Image_Destroy(int image);  

// GROUP ========================================================================================================================
// group can contain box, group, function and render.
int   					o_Group_Create(int* p_elements, size_t elements_count);
void    				o_Group_Copy(int src_group, int dst_group);
void  					o_Group_AppendElement(int group, int new_element);
void 					o_Group_RemoveElement(int group, int element);
void   					o_Group_InsertElement(int group, int new_element, size_t index);
void   					o_Group_Move(int group, float d_x, float d_y);
void   					o_Group_Rotate(int group, float rotation_radians);
void  					o_Group_Destroy(int group);

// FUNCTION =====================================================================================================================
// function can be added to group. It is executed every iteration the function is "drawn" before all elements that actually gets drawn in the same render is drawn
int   					o_Function_Create(void (*p_fn)(void*, size_t), void* p_data, size_t data_size);
void  					o_Function_Destroy(int function);

// COMMAND ======================================================================================================================
int   					o_Command_Create();

// RENDER_PASS ======================================================================================================================
int   					o_RenderPass_Create();

// COMPUTE_PASS ======================================================================================================================
int   					o_ComputePass_Create();

// COPY_PASS ======================================================================================================================
int   					o_CopyPass_Create();

// GRAPHICS_PIPELINE ======================================================================================================================
int   					o_GraphicsPipeline_Create();

// COMPUTE_PIPELINE ======================================================================================================================
int   					o_ComputePipeline_Create();

// SHADER ======================================================================================================================
void  					o_Shader_SpvFile_Create_FromGlslFile(const char* glsl_filename, const char* spv_filename, shaderc_shader_kind shader_kind);
int  					o_Shader_Create_FromGlslFile(const char* glsl_file_path, shaderc_shader_kind shader_kind);
void                    o_Shader_Destroy(int p_shader);


// FENCE ======================================================================================================================
int   					o_Fence_Create();

#endif // O_H