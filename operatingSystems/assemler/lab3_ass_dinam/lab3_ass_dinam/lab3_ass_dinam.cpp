// lab3_ass_dinam.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <cstdio>
#include <windows.h>
#include <iostream>

using namespace std;

#define _CRT_SECURE_NO_WARNINGS 

typedef void(_stdcall* LibraryFunction)(char*, char*, int);// Объявляем тип для указателя на библиотечную функцию 

int main()

{

    HMODULE  hLib;

    LibraryFunction f;

    TCHAR res[100];

    hLib = LoadLibraryEx(TEXT("C:\\Users\\Ann\\source\\repos\\lab3_ass_dinam\\lab.dll"), NULL, DONT_RESOLVE_DLL_REFERENCES);

    if (hLib == NULL) // Проверяем результат загрузки библиотеки 

    {

        wsprintf(res, L"Unable to load library");
        cout << res << endl;

    }

    else

    {

        f = (LibraryFunction)GetProcAddress(hLib, "process");

        if (!f)// Проверяем полученный указатель 

        {

            wsprintf(res, L"Unable to load function");

            cout << res << endl;

        }

        else

        {

            char str1[256];
            int len = 0;
            cout << "Input string:";
            cin.getline(str1, 256);
            cout << "Len: ";
            cin >> len;
            f(str1, str1, len);

            cout << "Result: " << str1 << endl;


        }

        FreeLibrary(hLib);// Освобождаем библиотеку 

    }

    system("pause");

    return 0;

}
