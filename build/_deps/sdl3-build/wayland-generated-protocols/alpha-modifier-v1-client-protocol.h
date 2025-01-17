/* Generated by wayland-scanner 1.23.0 */

#ifndef ALPHA_MODIFIER_V1_CLIENT_PROTOCOL_H
#define ALPHA_MODIFIER_V1_CLIENT_PROTOCOL_H

#include <stdint.h>
#include <stddef.h>
#include "wayland-client.h"

#ifdef  __cplusplus
extern "C" {
#endif

/**
 * @page page_alpha_modifier_v1 The alpha_modifier_v1 protocol
 * @section page_ifaces_alpha_modifier_v1 Interfaces
 * - @subpage page_iface_wp_alpha_modifier_v1 - surface alpha modifier manager
 * - @subpage page_iface_wp_alpha_modifier_surface_v1 - alpha modifier object for a surface
 * @section page_copyright_alpha_modifier_v1 Copyright
 * <pre>
 *
 * Copyright © 2024 Xaver Hugl
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 * </pre>
 */
struct wl_surface;
struct wp_alpha_modifier_surface_v1;
struct wp_alpha_modifier_v1;

#ifndef WP_ALPHA_MODIFIER_V1_INTERFACE
#define WP_ALPHA_MODIFIER_V1_INTERFACE
/**
 * @page page_iface_wp_alpha_modifier_v1 wp_alpha_modifier_v1
 * @section page_iface_wp_alpha_modifier_v1_desc Description
 *
 * This interface allows a client to set a factor for the alpha values on a
 * surface, which can be used to offload such operations to the compositor,
 * which can in turn for example offload them to KMS.
 *
 * Warning! The protocol described in this file is currently in the testing
 * phase. Backward compatible changes may be added together with the
 * corresponding interface version bump. Backward incompatible changes can
 * only be done by creating a new major version of the extension.
 * @section page_iface_wp_alpha_modifier_v1_api API
 * See @ref iface_wp_alpha_modifier_v1.
 */
/**
 * @defgroup iface_wp_alpha_modifier_v1 The wp_alpha_modifier_v1 interface
 *
 * This interface allows a client to set a factor for the alpha values on a
 * surface, which can be used to offload such operations to the compositor,
 * which can in turn for example offload them to KMS.
 *
 * Warning! The protocol described in this file is currently in the testing
 * phase. Backward compatible changes may be added together with the
 * corresponding interface version bump. Backward incompatible changes can
 * only be done by creating a new major version of the extension.
 */
extern const struct wl_interface wp_alpha_modifier_v1_interface;
#endif
#ifndef WP_ALPHA_MODIFIER_SURFACE_V1_INTERFACE
#define WP_ALPHA_MODIFIER_SURFACE_V1_INTERFACE
/**
 * @page page_iface_wp_alpha_modifier_surface_v1 wp_alpha_modifier_surface_v1
 * @section page_iface_wp_alpha_modifier_surface_v1_desc Description
 *
 * This interface allows the client to set a factor for the alpha values on
 * a surface, which can be used to offload such operations to the compositor.
 * The default factor is UINT32_MAX.
 *
 * This object has to be destroyed before the associated wl_surface. Once the
 * wl_surface is destroyed, all request on this object will raise the
 * no_surface error.
 * @section page_iface_wp_alpha_modifier_surface_v1_api API
 * See @ref iface_wp_alpha_modifier_surface_v1.
 */
/**
 * @defgroup iface_wp_alpha_modifier_surface_v1 The wp_alpha_modifier_surface_v1 interface
 *
 * This interface allows the client to set a factor for the alpha values on
 * a surface, which can be used to offload such operations to the compositor.
 * The default factor is UINT32_MAX.
 *
 * This object has to be destroyed before the associated wl_surface. Once the
 * wl_surface is destroyed, all request on this object will raise the
 * no_surface error.
 */
extern const struct wl_interface wp_alpha_modifier_surface_v1_interface;
#endif

#ifndef WP_ALPHA_MODIFIER_V1_ERROR_ENUM
#define WP_ALPHA_MODIFIER_V1_ERROR_ENUM
enum wp_alpha_modifier_v1_error {
	/**
	 * wl_surface already has a alpha modifier object
	 */
	WP_ALPHA_MODIFIER_V1_ERROR_ALREADY_CONSTRUCTED = 0,
};
#endif /* WP_ALPHA_MODIFIER_V1_ERROR_ENUM */

#define WP_ALPHA_MODIFIER_V1_DESTROY 0
#define WP_ALPHA_MODIFIER_V1_GET_SURFACE 1


/**
 * @ingroup iface_wp_alpha_modifier_v1
 */
#define WP_ALPHA_MODIFIER_V1_DESTROY_SINCE_VERSION 1
/**
 * @ingroup iface_wp_alpha_modifier_v1
 */
#define WP_ALPHA_MODIFIER_V1_GET_SURFACE_SINCE_VERSION 1

/** @ingroup iface_wp_alpha_modifier_v1 */
static inline void
wp_alpha_modifier_v1_set_user_data(struct wp_alpha_modifier_v1 *wp_alpha_modifier_v1, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wp_alpha_modifier_v1, user_data);
}

/** @ingroup iface_wp_alpha_modifier_v1 */
static inline void *
wp_alpha_modifier_v1_get_user_data(struct wp_alpha_modifier_v1 *wp_alpha_modifier_v1)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wp_alpha_modifier_v1);
}

static inline uint32_t
wp_alpha_modifier_v1_get_version(struct wp_alpha_modifier_v1 *wp_alpha_modifier_v1)
{
	return wl_proxy_get_version((struct wl_proxy *) wp_alpha_modifier_v1);
}

/**
 * @ingroup iface_wp_alpha_modifier_v1
 *
 * Destroy the alpha modifier manager. This doesn't destroy objects
 * created with the manager.
 */
static inline void
wp_alpha_modifier_v1_destroy(struct wp_alpha_modifier_v1 *wp_alpha_modifier_v1)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wp_alpha_modifier_v1,
			 WP_ALPHA_MODIFIER_V1_DESTROY, NULL, wl_proxy_get_version((struct wl_proxy *) wp_alpha_modifier_v1), WL_MARSHAL_FLAG_DESTROY);
}

/**
 * @ingroup iface_wp_alpha_modifier_v1
 *
 * Create a new alpha modifier surface object associated with the
 * given wl_surface. If there is already such an object associated with
 * the wl_surface, the already_constructed error will be raised.
 */
static inline struct wp_alpha_modifier_surface_v1 *
wp_alpha_modifier_v1_get_surface(struct wp_alpha_modifier_v1 *wp_alpha_modifier_v1, struct wl_surface *surface)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wp_alpha_modifier_v1,
			 WP_ALPHA_MODIFIER_V1_GET_SURFACE, &wp_alpha_modifier_surface_v1_interface, wl_proxy_get_version((struct wl_proxy *) wp_alpha_modifier_v1), 0, NULL, surface);

	return (struct wp_alpha_modifier_surface_v1 *) id;
}

#ifndef WP_ALPHA_MODIFIER_SURFACE_V1_ERROR_ENUM
#define WP_ALPHA_MODIFIER_SURFACE_V1_ERROR_ENUM
enum wp_alpha_modifier_surface_v1_error {
	/**
	 * wl_surface was destroyed
	 */
	WP_ALPHA_MODIFIER_SURFACE_V1_ERROR_NO_SURFACE = 0,
};
#endif /* WP_ALPHA_MODIFIER_SURFACE_V1_ERROR_ENUM */

#define WP_ALPHA_MODIFIER_SURFACE_V1_DESTROY 0
#define WP_ALPHA_MODIFIER_SURFACE_V1_SET_MULTIPLIER 1


/**
 * @ingroup iface_wp_alpha_modifier_surface_v1
 */
#define WP_ALPHA_MODIFIER_SURFACE_V1_DESTROY_SINCE_VERSION 1
/**
 * @ingroup iface_wp_alpha_modifier_surface_v1
 */
#define WP_ALPHA_MODIFIER_SURFACE_V1_SET_MULTIPLIER_SINCE_VERSION 1

/** @ingroup iface_wp_alpha_modifier_surface_v1 */
static inline void
wp_alpha_modifier_surface_v1_set_user_data(struct wp_alpha_modifier_surface_v1 *wp_alpha_modifier_surface_v1, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wp_alpha_modifier_surface_v1, user_data);
}

/** @ingroup iface_wp_alpha_modifier_surface_v1 */
static inline void *
wp_alpha_modifier_surface_v1_get_user_data(struct wp_alpha_modifier_surface_v1 *wp_alpha_modifier_surface_v1)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wp_alpha_modifier_surface_v1);
}

static inline uint32_t
wp_alpha_modifier_surface_v1_get_version(struct wp_alpha_modifier_surface_v1 *wp_alpha_modifier_surface_v1)
{
	return wl_proxy_get_version((struct wl_proxy *) wp_alpha_modifier_surface_v1);
}

/**
 * @ingroup iface_wp_alpha_modifier_surface_v1
 *
 * This destroys the object, and is equivalent to set_multiplier with
 * a value of UINT32_MAX, with the same double-buffered semantics as
 * set_multiplier.
 */
static inline void
wp_alpha_modifier_surface_v1_destroy(struct wp_alpha_modifier_surface_v1 *wp_alpha_modifier_surface_v1)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wp_alpha_modifier_surface_v1,
			 WP_ALPHA_MODIFIER_SURFACE_V1_DESTROY, NULL, wl_proxy_get_version((struct wl_proxy *) wp_alpha_modifier_surface_v1), WL_MARSHAL_FLAG_DESTROY);
}

/**
 * @ingroup iface_wp_alpha_modifier_surface_v1
 *
 * Sets the alpha multiplier for the surface. The alpha multiplier is
 * double-buffered state, see wl_surface.commit for details.
 *
 * This factor is applied in the compositor's blending space, as an
 * additional step after the processing of per-pixel alpha values for the
 * wl_surface. The exact meaning of the factor is thus undefined, unless
 * the blending space is specified in a different extension.
 *
 * This multiplier is applied even if the buffer attached to the
 * wl_surface doesn't have an alpha channel; in that case an alpha value
 * of one is used instead.
 *
 * Zero means completely transparent, UINT32_MAX means completely opaque.
 */
static inline void
wp_alpha_modifier_surface_v1_set_multiplier(struct wp_alpha_modifier_surface_v1 *wp_alpha_modifier_surface_v1, uint32_t factor)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wp_alpha_modifier_surface_v1,
			 WP_ALPHA_MODIFIER_SURFACE_V1_SET_MULTIPLIER, NULL, wl_proxy_get_version((struct wl_proxy *) wp_alpha_modifier_surface_v1), 0, factor);
}

#ifdef  __cplusplus
}
#endif

#endif