# Перевода чисел, заданных в двоично-восьмеричной в десятичную

Когда q=pm, где m-целое число представление числа в p- ичной с.с. совпадает с его представлением в смешанной <p-q>-ичной с.с.
	Так как 2^3 = 8,  3 - целое, то число из двоично-восьмеричной системы и число из двоичной системы равны. Задача сводится к переводу числа из двоичной системы в десятичную.


### Чтобы выполнить:
+ загружаем файлы 
+ переходим через терминал в папку, где хранятся файлы 
+  вызываем скрипт trancform2in10.bat (можно без расширения) и число (в двоичной системе, иначе ошибка)

### Примеры запуска:
C:\Users\Ann>trancform2in10 1.01
Answer:  1.25

C:\Users\Ann>trancform2in10 -1.01
Answer: -1.25

C:\Users\Ann>trancform2in10 -111.1
Answer: -7.5

C:\Users\Ann>trancform2in10 -111.100
Answer: -7.5

C:\Users\Ann>trancform2in10 -1171.100
symbol error

C:\Users\Ann>trancform2in10 -171.100
symbol error

C:\Users\Ann>trancform2in10 -1.1.100
too many dots

C:\Users\Ann>trancform2in10 -.1
error number

C:\Users\Ann>trancform2in10 -0.1
Answer: -0.5

C:\Users\Ann>trancform2in10 -01.1
error number
