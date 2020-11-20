import UIKit

/*
1. Написать функцию, которая определяет, четное число или нет.
2. Написать функцию, которая определяет, делится ли число без остатка на 3.
3. Создать возрастающий массив из 100 чисел.
4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
*/


func isEven(_ number: Int) -> Bool {
    return number % 2 == 0
}

func isDivideableBy3(_ number: Int) -> Bool {
    return number % 3 == 0
}

var array = [Int]()
for i in 0...99 {
    array.append(i)
}

var index = 0;
while index < array.count {
    if isEven(array[index]) || !isDivideableBy3(array[index]) {
        array.remove(at: index)
        index -= 1
    }
    
    index += 1;
}

print(array)
