#include "stdaxf.h"
#include "Deserialization.h"

void main() {
	long longV = Deserialization::DeserializeNumber((char*)"D:\\projects\\asmL\\lab4\\Serialization\\serNumLong.txt");
	cout << longV << endl;

	unsigned char byteV = Deserialization::DeserializeNumber((char*)"D:\\projects\\asmL\\lab4\\Serialization\\serNumByte.txt");
	cout << (int)byteV << endl;

	Deserialization::ConvertToAssembly((char*)"D:\\projects\\asmL\\lab4\\Assembler\\asm4.asm", longV, byteV);
}