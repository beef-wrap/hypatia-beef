/* SPDX-License-Identifier: MIT */

using System;
using System.Interop;

namespace hypatia;

public static class hypatia
{
	typealias uint8_t = uint8;

	const c_char* HYPATIA_VERSION = "2.0.0";

#if HYPATIA_SINGLE_PRECISION_FLOATS
	typealias HYP_FLOAT = float;
#else
	typealias HYP_FLOAT = double;
#endif

	/** @brief PI to 100 digits (gets rounded off by the compiler) */
	const float HYP_PI = 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679f;
	/** @brief Tau to 100 digits, which is 2 * PI */
	const float HYP_TAU = 6.2831853071795864769252867665590057683943387987502116419498891846156328125724179972560696506842341359f;
	/** @brief Half of PI */
	const float HYP_PI_HALF = 1.5707963267948966f;
	/** @brief PI * PI */
	const float HYP_PI_SQUARED = 9.8696044010893586f;
	/** @brief Log e is the Natural Logarithm in base 10 */
	const float HYP_E = 2.71828182845904523536028747135266249775724709369995f;
	/** @brief Radians per Degree = PI/180 */
	const float HYP_RAD_PER_DEG = 0.0174532925199432957692369076848861f;
	/** @brief Degrees per Radian = 180/PI */
	const float HYP_DEG_PER_RAD = 57.2957795130823208767981548141052f;
	/** @brief PI/180 */
	const float HYP_PIOVER180 =  HYP_RAD_PER_DEG;
	/** @brief 180/PI */
	const float HYP_PIUNDER180 = HYP_DEG_PER_RAD;

	/** @brief Epsilon.  This is the value that is used to determine how much
	* rounding error is tolerated.
	*/
#if HYPATIA_SINGLE_PRECISION_FLOATS
	const float HYP_EPSILON = 1E-5f;
#else
	const double HYP_EPSILON = 1E-5;
#endif
	/*@}*/

	// /** @brief A macro that enabled you to override memset */
	// #ifndef HYP_MEMSET
	// #	include <memory.h> /* memset */
	// #	define HYP_MEMSET(a, b, c)  memset(a, b, c)
	// #endif

	// /** @brief A function that returns the minimum of \a a and \a b */
	// static HYP_INLINE HYP_FLOAT HYP_MIN(HYP_FLOAT a, HYP_FLOAT b)
	// {
	//     return (a < b) ? a : b;
	// }

	// /** @brief A macro that returns the maximum of \a a and \a b */
	// static HYP_INLINE HYP_FLOAT HYP_MAX(HYP_FLOAT a, HYP_FLOAT b)
	// {
	//     return (a > b) ? b : a;
	// }

	// /** @brief A macro that swaps \a a and \a b */
	// static HYP_INLINE void HYP_SWAP(HYP_FLOAT *a, HYP_FLOAT *b)
	// {
	//     HYP_FLOAT f = *a; *a = *b; *b = f;
	// }

	// /** @brief A macro that returns a random float point number up to RAND_MAX */
	// #ifndef HYP_RANDOM_FLOAT
	// #	include <stdlib.h> /* RAND_MAX, rand */
	// #	define HYP_RANDOM_FLOAT (((HYP_FLOAT)rand() - (HYP_FLOAT)rand()) / (HYP_FLOAT)RAND_MAX)
	// #endif

	// /** @brief A macro that converts an angle in degress to an angle in radians */
	// #ifndef HYP_DEG_TO_RAD
	// #	define HYP_DEG_TO_RAD(angle)  ((angle) * HYP_RAD_PER_DEG)
	// #endif

	// /** @brief A macro that converts an angle in radians to an angle in degrees */
	// #ifndef HYP_RAD_TO_DEG
	// #	define HYP_RAD_TO_DEG(radians) ((radians) * HYP_DEG_PER_RAD)
	// #endif

	// /** @brief A macro that squares a value squared */
	// static HYP_INLINE HYP_FLOAT HYP_SQUARE(HYP_FLOAT number)
	// {
	//     return number * number;
	// }

	// /** @brief A macro that finds the square root of a value */
	// #ifndef HYP_SQRT
	// #	define HYP_SQRT(number) ((HYP_FLOAT)sqrt(number))
	// #endif

	// /** @brief A macro that returns the absolute value */
	// static HYP_INLINE HYP_FLOAT HYP_ABS(HYP_FLOAT value)
	// {
	//     return (value < 0.0f) ? -value : value;
	// }

	// /** @brief A macro that wraps a value around and around in a range */
	// static HYP_INLINE HYP_FLOAT HYP_WRAP(HYP_FLOAT value, HYP_FLOAT start, HYP_FLOAT limit)
	// {
	//     return (HYP_FLOAT)fmod(start + (value - start), (limit - start));
	// }

	// /** @brief A macro that constrains the value between two limits \a a and \a b */
	// static HYP_INLINE HYP_FLOAT HYP_CLAMP(HYP_FLOAT value, HYP_FLOAT start, HYP_FLOAT limit)
	// {
	//     return ((value < start) ? start : (value > limit) ? limit : value);
	// }

	// #ifndef DOXYGEN_SHOULD_SKIP_THIS

	// /* forward declarations */
	// struct vector2;
	// struct vector3;
	// struct vector4;
	// struct matrix2;
	// struct matrix3;
	// struct matrix4;
	// struct quaternion;

	const int HYP_REF_VECTOR2_ZERO = 0;
	const int HYP_REF_VECTOR2_UNIT_X = 1;
	const int HYP_REF_VECTOR2_UNIT_Y = 2;
	const int HYP_REF_VECTOR2_UNIT_X_NEGATIVE = 3;
	const int HYP_REF_VECTOR2_UNIT_Y_NEGATIVE = 4;
	const int HYP_REF_VECTOR2_ONE = 5;

	[CLink] public static extern vector2* vector2_get_reference_vector2(int id);

	const int HYP_REF_VECTOR3_ZERO = 0;
	const int HYP_REF_VECTOR3_UNIT_X = 1;
	const int HYP_REF_VECTOR3_UNIT_Y = 2;
	const int HYP_REF_VECTOR3_UNIT_Z = 3;
	const int HYP_REF_VECTOR3_UNIT_X_NEGATIVE = 4;
	const int HYP_REF_VECTOR3_UNIT_Y_NEGATIVE = 5;
	const int HYP_REF_VECTOR3_UNIT_Z_NEGATIVE = 6;
	const int HYP_REF_VECTOR3_ONE = 7;

	[CLink] public static extern vector3* vector3_get_reference_vector3(int id);

	const int HYP_REF_VECTOR4_ZERO = 0;
	const int HYP_REF_VECTOR4_UNIT_X = 1;
	const int HYP_REF_VECTOR4_UNIT_Y = 2;
	const int HYP_REF_VECTOR4_UNIT_Z = 3;
	const int HYP_REF_VECTOR4_UNIT_X_NEGATIVE = 4;
	const int HYP_REF_VECTOR4_UNIT_Y_NEGATIVE = 5;
	const int HYP_REF_VECTOR4_UNIT_Z_NEGATIVE = 6;
	const int HYP_REF_VECTOR4_ONE = 7;

	[CLink] public static extern vector4* vector4_get_reference_vector4(int id);

	/** @ingroup reference_vectors */
	/** @brief {0,0,0} */
	public static mixin HYP_VECTOR3_ZERO() { vector3_get_reference_vector3(HYP_REF_VECTOR3_ZERO) }
	/** @ingroup reference_vectors */
	/** @brief {1,0,0} */
	public static mixin HYP_VECTOR3_UNIT_X() { vector3_get_reference_vector3(HYP_REF_VECTOR3_UNIT_X) }
	/** @ingroup reference_vectors */
	/** @brief {0,1,0} */
	public static mixin HYP_VECTOR3_UNIT_Y() { vector3_get_reference_vector3(HYP_REF_VECTOR3_UNIT_Y) }
	/** @ingroup reference_vectors */
	/** @brief {0,0,1} */
	public static mixin HYP_VECTOR3_UNIT_Z() { vector3_get_reference_vector3(HYP_REF_VECTOR3_UNIT_Z) }
	/** @ingroup reference_vectors */
	/** @brief {-1,0,0} */
	public static mixin HYP_VECTOR3_UNIT_X_NEGATIVE() { vector3_get_reference_vector3(HYP_REF_VECTOR3_UNIT_X_NEGATIVE) }
	/** @ingroup reference_vectors */
	/** @brief {0,-1,0} */
	public static mixin HYP_VECTOR3_UNIT_Y_NEGATIVE() { vector3_get_reference_vector3(HYP_REF_VECTOR3_UNIT_Y_NEGATIVE) }
	/** @ingroup reference_vectors */
	/** @brief {0,0,-1} */
	public static mixin HYP_VECTOR3_UNIT_Z_NEGATIVE() { vector3_get_reference_vector3(HYP_REF_VECTOR3_UNIT_Z_NEGATIVE) }
	/** @ingroup reference_vectors */
	/** @brief {1,1,1} */
	public static mixin HYP_VECTOR3_ONE() { vector3_get_reference_vector3(HYP_REF_VECTOR3_ONE) }
	/* @} */


	/** @ingroup reference_vectors */
	/** @brief {0,0} */
	public static mixin HYP_VECTOR2_ZERO() { vector2_get_reference_vector2(HYP_REF_VECTOR2_ZERO) }
	/** @ingroup reference_vectors */
	/** @brief {1,0} */
	public static mixin HYP_VECTOR2_UNIT_X() { vector2_get_reference_vector2(HYP_REF_VECTOR2_UNIT_X) }
	/** @ingroup reference_vectors */
	/** @brief {0,1} */
	public static mixin HYP_VECTOR2_UNIT_Y() { vector2_get_reference_vector2(HYP_REF_VECTOR2_UNIT_Y) }
	/** @ingroup reference_vectors */
	/** @brief {-1,0} */
	public static mixin HYP_VECTOR2_UNIT_X_NEGATIVE() { vector2_get_reference_vector2(HYP_REF_VECTOR2_UNIT_X_NEGATIVE) }
	/** @ingroup reference_vectors */
	/** @brief {0,-1} */
	public static mixin HYP_VECTOR2_UNIT_Y_NEGATIVE() { vector2_get_reference_vector2(HYP_REF_VECTOR2_UNIT_Y_NEGATIVE) }
	/** @ingroup reference_vectors */
	/** @brief {1,1} */
	public static mixin HYP_VECTOR2_ONE() { vector2_get_reference_vector2(HYP_REF_VECTOR2_ONE) }
	/* @} */


	[CLink] public static extern c_short scalar_equalsf(HYP_FLOAT f1, HYP_FLOAT f2);
	[CLink] public static extern c_short scalar_equals_epsilonf(HYP_FLOAT f1, HYP_FLOAT f2, HYP_FLOAT epsilon);

	// #define scalar_equals scalar_equalsf

	/**
	* @ingroup trig
	* @{
	*/

	// #define HYP_SIN(x) ((HYP_FLOAT)sin(x))
	// #define HYP_COS(x) ((HYP_FLOAT)cos(x))
	// #define HYP_TAN(x) ((HYP_FLOAT)tan(x))
	// #define HYP_ASIN(x) ((HYP_FLOAT)asin(x))
	// #define HYP_ACOS(x) ((HYP_FLOAT)acos(x))
	// #define HYP_ATAN2(y, x) ((HYP_FLOAT)atan2(y, x))
	// #define HYP_COT(a) (1.0f / HYP_TAN(a))

	/* @} */


	/**
	* @ingroup experimental
	* @{
	*/

	[CLink] public static extern void _matrix2_print_with_columnrow_indexer(matrix2* self);
	[CLink] public static extern void _matrix2_print_with_rowcolumn_indexer(matrix2* self);
	[CLink] public static extern matrix2* _matrix2_set_random(matrix2* self);

	[CLink] public static extern void _matrix3_print_with_columnrow_indexer(matrix3* self);
	[CLink] public static extern void _matrix3_print_with_rowcolumn_indexer(matrix3* self);
	[CLink] public static extern matrix3* _matrix3_set_random(matrix3* self);

	[CLink] public static extern void _matrix4_print_with_columnrow_indexer(matrix4* self);
	[CLink] public static extern void _matrix4_print_with_rowcolumn_indexer(matrix4* self);
	[CLink] public static extern matrix4* _matrix4_set_random(matrix4* self);

	[CLink] public static extern void _quaternion_print(quaternion* self);
	[CLink] public static extern quaternion* _quaternion_set_random(quaternion* self);

	[CLink] public static extern void _vector3_print(vector3* self);
	[CLink] public static extern vector3* _vector3_set_random(vector3* self);

	[CLink] public static extern void _vector2_print(vector2* self);
	[CLink] public static extern vector2* _vector2_set_random(vector2* self);

	[CLink] public static extern void _vector4_print(vector4* self);
	[CLink] public static extern vector4* _vector4_set_random(vector4* self);

	/* @} */
	[CRepr, Union]
	public struct vector2
	{
		public HYP_FLOAT[2] v;
		public struct
		{
			public HYP_FLOAT x, y;
		};
	}


	[CLink] public static extern int vector2_equals(vector2* self, vector2* vT);

	[CLink] public static extern vector2* vector2_zero(vector2* self);
	[CLink] public static extern vector2* vector2_set(vector2* self, vector2* vT);
	[CLink] public static extern vector2* vector2_setf2(vector2* self, HYP_FLOAT xT, HYP_FLOAT yT);
	[CLink] public static extern vector2* vector2_negate(vector2* self);
	[CLink] public static extern vector2* vector2_add(vector2* self, vector2* vT);
	[CLink] public static extern vector2* vector2_addf(vector2* self, HYP_FLOAT fT);
	[CLink] public static extern vector2* vector2_subtract(vector2* self, vector2* vT);
	[CLink] public static extern vector2* vector2_subtractf(vector2* self, HYP_FLOAT fT);
	[CLink] public static extern vector2* vector2_multiply(vector2* self, vector2* vT);
	[CLink] public static extern vector2* vector2_multiplyf(vector2* self, HYP_FLOAT fT);
	[CLink] public static extern vector2* vector2_multiplym2(vector2* self, matrix2* mT);
	[CLink] public static extern vector2* vector2_multiplym3(vector2* self, matrix3* mT);
	[CLink] public static extern vector2* vector2_divide(vector2* self, vector2* vT);
	[CLink] public static extern vector2* vector2_dividef(vector2* self, HYP_FLOAT fT);

	[CLink] public static extern vector2* vector2_normalize(vector2* self);
	[CLink] public static extern HYP_FLOAT vector2_magnitude(vector2* self);
	[CLink] public static extern HYP_FLOAT vector2_distance(vector2* v1, vector2* v2);

	[CLink] public static extern HYP_FLOAT vector2_dot_product(vector2* self, vector2* vT);
	[CLink] public static extern vector2* vector2_cross_product(vector2* vR, vector2* vT1, vector2* vT2);

	[CLink] public static extern HYP_FLOAT vector2_angle_between(vector2* self, vector2* vT);
	[CLink] public static extern vector2* vector2_find_normal_axis_between(vector2* vR, vector2* vT1, vector2* vT2);

	/* the length is the same as "magnitude" */
	// #define vector2_length(v) vector2_magnitude(v)

	/* BETA aliases */
	// #define vec2 struct vector2

	[CRepr, Union]
	public struct vector3
	{
		public HYP_FLOAT[3] v;
		public struct
		{
			public HYP_FLOAT x, y, z;
		};
		public struct
		{
			public HYP_FLOAT yaw, pitch, roll;
		};
	}


	[CLink] public static extern int vector3_equals(vector3* self, vector3* vT);

	[CLink] public static extern vector3* vector3_zero(vector3* self);
	[CLink] public static extern vector3* vector3_set(vector3* self, vector3* vT);
	[CLink] public static extern vector3* vector3_setf3(vector3* self, HYP_FLOAT xT, HYP_FLOAT yT, HYP_FLOAT zT);
	[CLink] public static extern vector3* vector3_negate(vector3* self);
	[CLink] public static extern vector3* vector3_add(vector3* self, vector3* vT);
	[CLink] public static extern vector3* vector3_addf(vector3* self, HYP_FLOAT fT);
	[CLink] public static extern vector3* vector3_subtract(vector3* self, vector3* vT);
	[CLink] public static extern vector3* vector3_subtractf(vector3* self, HYP_FLOAT fT);
	[CLink] public static extern vector3* vector3_multiply(vector3* self, vector3* vT);
	[CLink] public static extern vector3* vector3_multiplyf(vector3* self, HYP_FLOAT fT);
	[CLink] public static extern vector3* vector3_multiplym4(vector3* self, matrix4* mT);
	[CLink] public static extern vector3* vector3_divide(vector3* self, vector3* vT);
	[CLink] public static extern vector3* vector3_dividef(vector3* self, HYP_FLOAT fT);

	[CLink] public static extern vector3* vector3_normalize(vector3* self);
	[CLink] public static extern HYP_FLOAT vector3_magnitude(vector3* self);
	[CLink] public static extern HYP_FLOAT vector3_distance(vector3* v1, vector3* v2);

	[CLink] public static extern HYP_FLOAT vector3_dot_product(vector3* self, vector3* vT);
	[CLink] public static extern vector3* vector3_cross_product(vector3* vR, vector3* vT1, vector3* vT2);

	[CLink] public static extern HYP_FLOAT vector3_angle_between(vector3* self, vector3* vT);
	[CLink] public static extern vector3* vector3_find_normal_axis_between(vector3* vR, vector3* vT1, vector3* vT2);

	[CLink] public static extern vector3* vector3_rotate_by_quaternion(vector3* self, quaternion* qT);
	[CLink] public static extern vector3* vector3_reflect_by_quaternion(vector3* self, quaternion* qT);

	/*the length is the same as "magnitude" */
	// #define vector3_length(v) vector3_magnitude(v)

	/*BETA aliases */
	// #define vec3 struct vector3

	[CRepr, Union]
	public struct vector4
	{
		public HYP_FLOAT[4] v;
		public struct
		{
			public HYP_FLOAT x, y, z, w;
		};
	}

	[CLink] public static extern int vector4_equals(vector4* self, vector4* vT);

	[CLink] public static extern vector4* vector4_zero(vector4* self);
	[CLink] public static extern vector4* vector4_set(vector4* self, vector4* vT);
	[CLink] public static extern vector4* vector4_setf4(vector4* self, HYP_FLOAT xT, HYP_FLOAT yT, HYP_FLOAT zT, HYP_FLOAT wT);
	[CLink] public static extern vector4* vector4_negate(vector4* self);
	[CLink] public static extern vector4* vector4_add(vector4* self, vector4* vT);
	[CLink] public static extern vector4* vector4_addf(vector4* self, HYP_FLOAT fT);
	[CLink] public static extern vector4* vector4_subtract(vector4* self, vector4* vT);
	[CLink] public static extern vector4* vector4_subtractf(vector4* self, HYP_FLOAT fT);
	[CLink] public static extern vector4* vector4_multiply(vector4* self, vector4* vT);
	[CLink] public static extern vector4* vector4_multiplyf(vector4* self, HYP_FLOAT fT);
	[CLink] public static extern vector4* vector4_divide(vector4* self, vector4* vT);
	[CLink] public static extern vector4* vector4_dividef(vector4* self, HYP_FLOAT fT);

	[CLink] public static extern vector4* vector4_normalize(vector4* self);
	[CLink] public static extern HYP_FLOAT vector4_magnitude(vector4* self);
	[CLink] public static extern HYP_FLOAT vector4_distance(vector4* v1, vector4* v2);

	[CLink] public static extern HYP_FLOAT vector4_dot_product(vector4* self, vector4* vT);
	[CLink] public static extern vector4* vector4_cross_product(vector4* vR, vector4* vT1, vector4* vT2);

	/* the length is the same as "magnitude" */
	// #define vector4_length(v) vector4_magnitude(v)

	/* BETA aliases */
	// #define vec4 struct vector4

	[CRepr, Union]
	public struct matrix2
	{
		public HYP_FLOAT[4] m; /* row-major numbering */
		public struct
		{
			/* reference the matrix [row][column] */
			public HYP_FLOAT[2][2] m22;
		};
		public struct
		{
			/* indexed (column-major numbering) */
			public HYP_FLOAT i00, i02;
			public HYP_FLOAT i01, i03;
		};
		public struct
		{
			/* col-row */
			public HYP_FLOAT c00, c10;
			public HYP_FLOAT c01, c11;
		};
		public struct
		{
			/* row-col */
			public HYP_FLOAT r00, r01;
			public HYP_FLOAT r10, r11;
		};
	}


	[CLink] public static extern int matrix2_equals(matrix2* self, matrix2* mT);

	[CLink] public static extern matrix2* matrix2_zero(matrix2* self);
	[CLink] public static extern matrix2* matrix2_identity(matrix2* self);
	[CLink] public static extern matrix2* matrix2_set(matrix2* self, matrix2* mT);
	[CLink] public static extern matrix2* matrix2_add(matrix2* self, matrix2* mT);
	[CLink] public static extern matrix2* matrix2_subtract(matrix2* self, matrix2* mT);

	[CLink] public static extern matrix2* matrix2_multiply(matrix2* self, matrix2* mT);
	[CLink] public static extern matrix2* matrix2_multiplyf(matrix2* self, HYP_FLOAT scalar);
	[CLink] public static extern vector2* matrix2_multiplyv2(matrix2* self, vector2* vT, vector2* vR);

	[CLink] public static extern matrix2* matrix2_transpose(matrix2* self);
	[CLink] public static extern HYP_FLOAT matrix2_determinant(matrix2* self);
	[CLink] public static extern matrix2* matrix2_invert(matrix2* self);
	[CLink] public static extern matrix2* matrix2_inverse(matrix2* self, matrix2* mR);

	[CLink] public static extern matrix2* matrix2_make_transformation_scalingv2(matrix2* self, vector2* scale);
	[CLink] public static extern matrix2* matrix2_make_transformation_rotationf_z(matrix2* self, HYP_FLOAT angle);

	[CLink] public static extern matrix2* matrix2_rotate(matrix2* self, HYP_FLOAT angle);
	[CLink] public static extern matrix2* matrix2_scalev2(matrix2* self, vector2* scale);

	[CLink] public static extern matrix2* _matrix2_transpose_rowcolumn(matrix2* self);
	[CLink] public static extern matrix2* _matrix2_transpose_columnrow(matrix2* self);

/* BETA aliases */
// #define mat2 struct matrix2

// #define mat2_equals matrix2_equals
// #define mat2_zero matrix2_zero
// #define mat2_identity matrix2_identity
// #define mat2_set matrix2_setm2
// #define mat2_add matrix2_add
// #define mat2_sub matrix2_subtract
// #define mat2_mul matrix2_multiply
// #define mat2_transpose matrix2_transpose

// #define mat2_rotate matrix2_rotate
// #define mat2_scalev2 matrix2_scalev2


/*#define m2 struct matrix2*/

// #define m2_equals matrix2_equals
// #define m2_zero matrix2_zero
// #define m2_identity matrix2_identity
// #define m2_set matrix2_set
// #define m2_add matrix2_add
// #define m2_sub matrix2_subtract
// #define m2_mul matrix2_multiply
// #define m2_transpose matrix2_transpose

// #define m2_rotate matrix2_rotate
// #define m2_scalev2 matrix2_scalev2

// #endif /* DOXYGEN_SHOULD_SKIP_THIS */

	[CRepr, Union]
	public struct matrix3
	{
		public HYP_FLOAT[9] m; /* row-major numbering */
		public struct
		{
			/* reference the matrix [row][column] */
			public HYP_FLOAT[3][3] m33;
		};
		public struct
		{
			/* indexed (column-major numbering) */
			public HYP_FLOAT i00, i03, i06;
			public HYP_FLOAT i01, i04, i07;
			public HYP_FLOAT i02, i05, i08;
		};
		public struct
		{
			/* col-row */
			public HYP_FLOAT c00, c10, c20;
			public HYP_FLOAT c01, c11, c21;
			public HYP_FLOAT c02, c12, c22;
		};
		public struct
		{
			/* row-col */
			public HYP_FLOAT r00, r01, r02;
			public HYP_FLOAT r10, r11, r12;
			public HYP_FLOAT r20, r21, r22;
		};
	}

	[CLink] public static extern int matrix3_equals(matrix3* self, matrix3* mT);

	[CLink] public static extern matrix3* matrix3_zero(matrix3* self);
	[CLink] public static extern matrix3* matrix3_identity(matrix3* self);
	[CLink] public static extern matrix3* matrix3_set(matrix3* self, matrix3* mT);
	[CLink] public static extern matrix3* matrix3_add(matrix3* self, matrix3* mT);
	[CLink] public static extern matrix3* matrix3_subtract(matrix3* self, matrix3* mT);

	[CLink] public static extern matrix3* matrix3_multiply(matrix3* self, matrix3* mT);
	[CLink] public static extern matrix3* matrix3_multiplyf(matrix3* self, HYP_FLOAT scalar);
	[CLink] public static extern vector2* matrix3_multiplyv2(matrix3* self, vector2* vT, vector2* vR);

	[CLink] public static extern matrix3* matrix3_transpose(matrix3* self);
	[CLink] public static extern HYP_FLOAT matrix3_determinant(matrix3* self);
	[CLink] public static extern matrix3* matrix3_invert(matrix3* self);
	[CLink] public static extern matrix3* matrix3_inverse(matrix3* self, matrix3* mR);

	[CLink] public static extern matrix3* matrix3_make_transformation_translationv2(matrix3* self, vector2* translation);
	[CLink] public static extern matrix3* matrix3_make_transformation_scalingv2(matrix3* self, vector2* scale);
	[CLink] public static extern matrix3* matrix3_make_transformation_rotationf_z(matrix3* self, HYP_FLOAT angle);

	[CLink] public static extern matrix3* matrix3_translatev2(matrix3* self, vector2* translation);
	[CLink] public static extern matrix3* matrix3_rotate(matrix3* self, HYP_FLOAT angle);
	[CLink] public static extern matrix3* matrix3_scalev2(matrix3* self, vector2* scale);

	[CLink] public static extern matrix3* _matrix3_transpose_rowcolumn(matrix3* self);
	[CLink] public static extern matrix3* _matrix3_transpose_columnrow(matrix3* self);

/* BETA aliases */
// #define mat3 struct matrix3

// #define mat3_equals matrix3_equals
// #define mat3_zero matrix3_zero
// #define mat3_identity matrix3_identity
// #define mat3_set matrix3_setm3
// #define mat3_add matrix3_add
// #define mat3_sub matrix3_subtract
// #define mat3_mul matrix3_multiply
// #define mat3_transpose matrix3_transpose

// #define mat3_translatev2 matrix3_translatev2
// #define mat3_rotate matrix3_rotate
// #define mat3_scalev2 matrix3_scalev2


// #define m3 struct matrix3

// #define m3_equals matrix3_equals
// #define m3_zero matrix3_zero
// #define m3_identity matrix3_identity
// #define m3_set matrix3_set
// #define m3_add matrix3_add
// #define m3_sub matrix3_subtract
// #define m3_mul matrix3_multiply
// #define m3_transpose matrix3_transpose

// #define m3_translatev2 matrix3_translatev2
// #define m3_rotate matrix3_rotate
// #define m3_scalev2 matrix3_scalev2

	[CRepr, Union]
	public struct matrix4
	{
		public HYP_FLOAT[16] m; /* row-major numbering */
		public struct
		{
			/* reference the matrix [row][column] */
			public HYP_FLOAT[4][4] m44;
		};
		public struct
		{
			/* indexed (column-major numbering) */
			public HYP_FLOAT i00, i04, i08, i12;
			public HYP_FLOAT i01, i05, i09, i13;
			public HYP_FLOAT i02, i06, i10, i14;
			public HYP_FLOAT i03, i07, i11, i15;
		};
		public struct
		{
			/* col-row */
			public HYP_FLOAT c00, c10, c20, c30;
			public HYP_FLOAT c01, c11, c21, c31;
			public HYP_FLOAT c02, c12, c22, c32;
			public HYP_FLOAT c03, c13, c23, c33;
		};
		public struct
		{
			/* row-col */
			public HYP_FLOAT r00, r01, r02, r03;
			public HYP_FLOAT r10, r11, r12, r13;
			public HYP_FLOAT r20, r21, r22, r23;
			public HYP_FLOAT r30, r31, r32, r33;
		};
	}

	[CLink] public static extern int matrix4_equals(matrix4* self, matrix4* mT);

	[CLink] public static extern matrix4* matrix4_zero(matrix4* self);
	[CLink] public static extern matrix4* matrix4_identity(matrix4* self);
	[CLink] public static extern matrix4* matrix4_set(matrix4* self, matrix4* mT);
	[CLink] public static extern matrix4* matrix4_add(matrix4* self, matrix4* mT);
	[CLink] public static extern matrix4* matrix4_subtract(matrix4* self, matrix4* mT);

	[CLink] public static extern matrix4* matrix4_multiply(matrix4* self, matrix4* mT);
	[CLink] public static extern matrix4* matrix4_multiplyf(matrix4* self, HYP_FLOAT scalar);
	[CLink] public static extern vector4* matrix4_multiplyv4(matrix4* self, vector4* vT, vector4* vR);
	[CLink] public static extern vector3* matrix4_multiplyv3(matrix4* self, vector3* vT, vector3* vR);
	[CLink] public static extern vector2* matrix4_multiplyv2(matrix4* self, vector2* vT, vector2* vR);

	[CLink] public static extern matrix4* matrix4_transpose(matrix4* self);
	[CLink] public static extern HYP_FLOAT matrix4_determinant(matrix4* self);
	[CLink] public static extern matrix4* matrix4_invert(matrix4* self);
	[CLink] public static extern matrix4* matrix4_inverse(matrix4* self, matrix4* mR);

	[CLink] public static extern matrix4* matrix4_make_transformation_translationv3(matrix4* self, vector3* translation);
	[CLink] public static extern matrix4* matrix4_make_transformation_scalingv3(matrix4* self, vector3* scale);
	[CLink] public static extern matrix4* matrix4_make_transformation_rotationq(matrix4* self, quaternion* qT);
	[CLink] public static extern matrix4* matrix4_make_transformation_rotationf_x(matrix4* self, HYP_FLOAT angle);
	[CLink] public static extern matrix4* matrix4_make_transformation_rotationf_y(matrix4* self, HYP_FLOAT angle);
	[CLink] public static extern matrix4* matrix4_make_transformation_rotationf_z(matrix4* self, HYP_FLOAT angle);

	[CLink] public static extern matrix4* matrix4_translatev3(matrix4* self, vector3* translation);
	[CLink] public static extern matrix4* matrix4_rotatev3(matrix4* self, vector3* axis, HYP_FLOAT angle);
	[CLink] public static extern matrix4* matrix4_scalev3(matrix4* self, vector3* scale);

	[CLink] public static extern matrix4* _matrix4_transpose_rowcolumn(matrix4* self);
	[CLink] public static extern matrix4* _matrix4_transpose_columnrow(matrix4* self);

// /* BETA aliases */
// #define mat4 struct matrix4

// #define mat4_equals matrix4_equals
// #define mat4_zero matrix4_zero
// #define mat4_identity matrix4_identity
// #define mat4_set matrix4_setm4
// #define mat4_add matrix4_add
// #define mat4_sub matrix4_subtract
// #define mat4_mul matrix4_multiply
// #define mat4_transpose matrix4_transpose

// #define mat4_translatev3 matrix3_translatev3
// #define mat4_rotatev3 matrix3_rotatev3
// #define mat4_scalev3 matrix3_scalev3


// #define m4 struct matrix4

// #define m4_equals matrix4_equals
// #define m4_zero matrix4_zero
// #define m4_identity matrix4_identity
// #define m4_set matrix4_set
// #define m4_add matrix4_add
// #define m4_sub matrix4_subtract
// #define m4_mul matrix4_multiply
// #define m4_transpose matrix4_transpose

// #define m4_translatev3 matrix3_translatev3
// #define m4_rotatev3 matrix3_rotatev3
// #define m4_scalev3 matrix3_scalev3

	[CRepr, Union]
	public struct quaternion
	{
		HYP_FLOAT[4] q;
		public struct
		{
			HYP_FLOAT x, y, z, w;
		};
		public struct
		{
			HYP_FLOAT i, j, k, a;
		};
	}


	[CLink] public static extern int quaternion_equals(quaternion* self, quaternion* vT);

	[CLink] public static extern quaternion* quaternion_identity(quaternion* self);
	[CLink] public static extern quaternion* quaternion_setf4(quaternion* self, HYP_FLOAT x, HYP_FLOAT y, HYP_FLOAT z, HYP_FLOAT w);
	[CLink] public static extern quaternion* quaternion_set(quaternion* self, quaternion* qT);
	[CLink] public static extern quaternion* quaternion_add(quaternion* self, quaternion* qT);
	[CLink] public static extern quaternion* quaternion_multiply(quaternion* self, quaternion* qT);
	[CLink] public static extern quaternion* quaternion_multiplyv3(quaternion* self, vector3* vT);
	[CLink] public static extern quaternion* quaternion_multiplyf(quaternion* self, HYP_FLOAT f);
	[CLink] public static extern quaternion* quaternion_subtract(quaternion* self, quaternion* qT);
	[CLink] public static extern quaternion* quaternion_negate(quaternion* self);
	[CLink] public static extern quaternion* quaternion_conjugate(quaternion* self);
	[CLink] public static extern quaternion* quaternion_inverse(quaternion* self);

	[CLink] public static extern c_short quaternion_is_unit(quaternion* self);
	[CLink] public static extern c_short quaternion_is_pure(quaternion* self);
	[CLink] public static extern HYP_FLOAT quaternion_norm(quaternion* self);
	[CLink] public static extern HYP_FLOAT quaternion_magnitude(quaternion* self);
	[CLink] public static extern quaternion* quaternion_normalize(quaternion* self);
	[CLink] public static extern HYP_FLOAT quaternion_dot_product(quaternion* self, quaternion* qT);

	[CLink] public static extern quaternion* quaternion_lerp(quaternion* start, quaternion* end, HYP_FLOAT percent, quaternion* qR);
	[CLink] public static extern quaternion* quaternion_nlerp(quaternion* start, quaternion* end, HYP_FLOAT percent, quaternion* qR);
	[CLink] public static extern quaternion* quaternion_slerp(quaternion* start, quaternion* end, HYP_FLOAT percent, quaternion* qR);

	[CLink] public static extern void quaternion_get_axis_anglev3(quaternion* self, vector3* vR, HYP_FLOAT* angle);

	[CLink] public static extern quaternion* quaternion_set_from_axis_anglev3(quaternion* self, vector3* axis, HYP_FLOAT angle);
	[CLink] public static extern quaternion* quaternion_set_from_axis_anglef3(quaternion* self, HYP_FLOAT x, HYP_FLOAT y, HYP_FLOAT z, HYP_FLOAT angle);

	[CLink] public static extern quaternion* quaternion_set_from_euler_anglesf3(quaternion* self, HYP_FLOAT ax, HYP_FLOAT ay, HYP_FLOAT az);
	[CLink] public static extern void quaternion_get_euler_anglesf3(quaternion* self, HYP_FLOAT* ax, HYP_FLOAT* ay, HYP_FLOAT* az);

	[CLink] public static extern quaternion* quaternion_get_rotation_tov3(vector3* from, vector3* to, quaternion* qR);

// /* BETA aliases */
// #define quat struct quaternion

// #define quat_equals quaternion_equals
// #define quat_identity quaternion_identity
// #define quat_lerp quaternion_lerp
// #define quat_nlerp quaternion_nlerp
// #define quat_slerp quaternion_slerp

	[CLink] public static extern quaternion* quaternion_rotate_by_quaternion_EXP(quaternion* self, quaternion* qT);
	[CLink] public static extern quaternion* quaternion_rotate_by_axis_angle_EXP(quaternion* self, vector3* axis, HYP_FLOAT angle);
	[CLink] public static extern quaternion* quaternion_rotate_by_euler_angles_EXP(quaternion* self, HYP_FLOAT ax, HYP_FLOAT ay, HYP_FLOAT az);
	[CLink] public static extern HYP_FLOAT quaternion_difference_EXP(quaternion* q1, quaternion* q2);
	[CLink] public static extern HYP_FLOAT quaternion_angle_between_EXP(quaternion* self, quaternion* qT);
	[CLink] public static extern void quaternion_axis_between_EXP(quaternion* self, quaternion* qT, quaternion* qR);
	[CLink] public static extern matrix4* matrix4_projection_perspective_fovy_rh_EXP(matrix4* self, HYP_FLOAT fovy, HYP_FLOAT aspect, HYP_FLOAT zNear, HYP_FLOAT zFar);
	[CLink] public static extern matrix4* matrix4_projection_ortho3d_rh_EXP(matrix4* self, HYP_FLOAT xmin, HYP_FLOAT xmax, HYP_FLOAT ymin, HYP_FLOAT ymax, HYP_FLOAT zNear, HYP_FLOAT zFar);
	[CLink] public static extern matrix4* matrix4_view_lookat_rh_EXP(matrix4* self, vector3* eye, vector3* target, vector3* up);
	[CLink] public static extern vector3* matrix4_multiplyv3_EXP(matrix4* m, vector3* vT, vector3* vR);
	[CLink] public static extern quaternion quaternion_cross_product_EXP(quaternion* self, quaternion* vT);
	[CLink] public static extern matrix4* matrix4_set_from_quaternion_EXP(matrix4* self, quaternion* qT);
	[CLink] public static extern matrix4* matrix4_set_from_axisv3_angle_EXP(matrix4* self, vector3* axis, HYP_FLOAT angle);
	[CLink] public static extern matrix4* matrix4_set_from_axisf3_angle_EXP(matrix4* self, HYP_FLOAT x, HYP_FLOAT y, HYP_FLOAT z, HYP_FLOAT angle);
	[CLink] public static extern matrix4* matrix4_set_from_euler_anglesf3_EXP(matrix4* self, HYP_FLOAT x, HYP_FLOAT y, HYP_FLOAT z);
	[CLink] public static extern vector3* matrix4_get_translation_EXP(matrix4* self, vector3* vT);
	[CLink] public static extern matrix4* matrix4_make_transformation_rotationv3_EXP(matrix4* self, vector3* vR);
	[CLink] public static extern matrix4* matrix4_transformation_compose_EXP(matrix4* self, vector3* scale, quaternion* rotation, vector3* translation);
	[CLink] public static extern uint8_t matrix4_transformation_decompose_EXP(matrix4* self, vector3* scale, quaternion* rotation, vector3* translation);
}