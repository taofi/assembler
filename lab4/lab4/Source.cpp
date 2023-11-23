#include "stdafx.h"
#include "Serialization.h"

void main() {
	Serialization::Serialize((char*)"D:\\projects\\asmL\\lab4\\Serialization\\serNumLong.txt", (long)7181234);
	Serialization::Serialize((char*)"D:\\projects\\asmL\\lab4\\Serialization\\serNums.txt", new long[5]{1, 2, 3, 4, 5}, 5);
	Serialization::Serialize((char*)"D:\\projects\\asmL\\lab4\\Serialization\\serNumByte.txt", (unsigned char)25);
}