#pragma once
#include "stdafx.h"

namespace Serialization {
	void Serialize(char* filePath, long number);
	void Serialize(char* filePath, long numbers[], int size);
	void Serialize(char* filePath, unsigned char number);
}