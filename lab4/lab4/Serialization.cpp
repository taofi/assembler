#include "Serialization.h"

namespace Serialization {
	void Serialize(char* filePath, long number) {

		ofstream writer(filePath);

		if (!writer.is_open()) {
			cout << "Не удалось открыть файл." << endl;
			return;
		}

		writer << "0x01" << "0x" << setfill('0') << setw(16) << hex << number;

		writer.close();
	}

	void Serialize(char* filePath, long numbers[], int size) {

		ofstream writer(filePath);

		if (!writer.is_open()) {
			cout << "Не удалось открыть файл." << endl;
			return;
		}

		writer << "0x01" << "0x" << setfill('0') << setw(2) << hex << size;

		for (unsigned char i = 0; i < size; i++) {
			writer << "0x" << setfill('0') << setw(16) << hex << numbers[i];
		}

		writer.close();
	}

	void Serialize(char* filePath, unsigned char number) {

		ofstream writer(filePath);

		if (!writer.is_open()) {
			cout << "Не удалось открыть файл." << endl;
			return;
		}

		writer << "0x02" << "0x" << setfill('0') << setw(2) << hex << (int)number;

		writer.close();
	}
	
}