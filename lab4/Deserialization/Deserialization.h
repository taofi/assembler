#pragma once
#include "stdaxf.h"
#include "AssemblyDefault.h"

namespace Deserialization {
	long DeserializeNumber(char* filePath);
	void ConvertToAssembly(char* filePath, long longV, unsigned char byteV);
}