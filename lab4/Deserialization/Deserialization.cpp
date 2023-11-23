#pragma once
#include "Deserialization.h"

namespace Deserialization {
	long DeserializeNumber(char* filePath) {

		ifstream reader(filePath);

		if (!reader.is_open()) {
			cout << "Не удалось открыть файл." << endl;
			return -1;
		}

		long resultNumber = 0;

		string buff;
		reader >> buff;
		buff.erase(0, 6);
		sscanf_s(buff.c_str(), "%x", &resultNumber);

		reader.close();
		return resultNumber;
	}
	void ConvertToAssembly(char* filePath, long longV, unsigned char byteV) {

		ofstream fileAsm(filePath);

		fileAsm ASM_HEAD;

		fileAsm << "LONGV   QWORD " << longV << endl;
		fileAsm << "BYTEV	BYTE " << (int)byteV << endl;

		fileAsm ASM_FOOTER;

		fileAsm.close();
	}
}