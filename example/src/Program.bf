using System;
using System.Collections;
using System.Diagnostics;
using System.IO;
using System.Interop;
using System.Text;

using static hypatia_Beef.hypatia;

namespace example;

static class Program
{
	static int Main(params String[] args)
	{
		vector3 vec3 = ?;
		vector3_setf3(&vec3, 0, 3, 4);
		Debug.WriteLine($"({vec3.x}, {vec3.y}, {vec3.z})");
		Debug.WriteLine($"length: {vector3_magnitude(&vec3)}");

		return 0;
	}
}