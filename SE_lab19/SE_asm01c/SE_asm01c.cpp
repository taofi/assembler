﻿#include <iostream>
//#include "SE_Asm01a.lib"
#pragma comment(lib, "SE_asm01a.lib")

extern "C" {
    int getmin(int* arr, int len);
    int getmax(int* arr, int len);
}

int main() {
    int myArray[10] = { 10, 5, 8, 2, 7, 1, 6, 3, 9, 4 };

    int min = getmin(myArray, 10);
    int max = getmax(myArray, 10);
    int sum = min + max;

    std::cout << "getmax + getmin = " << sum << std::endl;
    system("pause");
    return 0;
}