// Lab3_ass_static.cpp : This file contains the 'main' function. Program execution begins and ends there.
//


#include "pch.h"
#include <iostream>
#include "Header.h"
    using namespace std;
    char str1[256];
    int main()
    {
        int len = 0;

        cout << "Input str:";
        cin.getline(str1, 256);
        cout << "Len: ";
        cin >> len;
        process(str1, str1, len);
        cout << "Result: " << str1 << endl;
        system("pause");
        return 0;
    }


