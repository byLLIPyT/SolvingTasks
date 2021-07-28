//
//  ViewController.swift
//  SolvingTasks
//
//  Created by Александр Уткин on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //******************************************************
        //Задача №1 -  Проверка символов в строке на уникальность
        //написать функцию, которая принимает строку и возвращает true, если строка содержит только уникальные символы
        
        //Решение 1:
        func sort1(input: String) -> Bool {
            var checkedSymbols = [Character]()
            
            for symbol in checkedSymbols {
                if checkedSymbols.contains(symbol) {
                    return false
                }
                checkedSymbols.append(symbol)
            }
            return true
        }
        //Решение 2:
        func sort2(input: String) -> Bool {
            return Set(input).count == input.count
        }
        //******************************************************
        
        //Задача №2 - является ли строка палиндромом
        
        //Решение:
        
        func check(input: String) -> Bool {
            let lowercased = input.lowercased()
            return String(lowercased.reversed()) == lowercased
        }
        
        //******************************************************
        //Задача №3
        //Написать функцию, если строки содержат одни и теже символы в любом порядке с учетом регистра
        
        //Решение:
        
        func check1(string1: String, string2: String) -> Bool {
            var checkString = string2
            for letter in string1 {
                if let index = checkString.firstIndex(of: letter) {
                    checkString.remove(at: index)
                }
                else {
                    return false
                }
            }
            return checkString.count == 0
        }
        
        func check2(string1: String, string2: String) -> Bool {
            return string1.sorted() == string2.sorted()
        }
        //******************************************************
        
        //Задача №4
        //Содержит ли одна строка другую?
        
        //Решение
        
        func customContains(str1: String, str2: String)-> Bool {
            return str1.lowercased().contains(str2.lowercased())
        }
        
        //******************************************************
        
        //Задача №5
        //Сколько раз символ встречается в строке,
        //Написать функцию, которая возвращает количество раз,сколько символ встречается в строке, с учетом регистра
        
        //Решение
        
        func howManyTimes(string: String, char: Character) -> Int {
            var letterCount = 0
            for element in string {
                if element == char {
                    letterCount += 1
                }
            }
            return letterCount
        }
        
        func howManyTimes2(input: String, char: Character) -> Int {
            return input.reduce(0) {
                $1 == char ? $0 + 1: $0
            }
        }
        
        //******************************************************
        
        //Задача №6
        //Написать функцию, которая принимает строку и возвращает эту строку с удаленными повторяющимися символами (hello -> helo)
        //Решение
        func sortString1(string: String) -> String {
            var arrayString = [Character]()
            
            for element in string {
                if !arrayString.contains(element) {
                    arrayString.append(element)
                }
            }
            return String(arrayString)
        }
        
        //******************************************************
        
        //Задача №7 Сокращение кличества пробелов в строке: "   abc   x" -> " abc x"
        //Решение
        
        func space(input: String) -> String {
            var seenSpace = false
            var returnValue = ""
            
            for letter in input {
                if letter == " " {
                    if seenSpace {
                        continue
                    }
                    seenSpace = true
                } else {
                    seenSpace = false
                }
                returnValue.append(letter)
            }
            return returnValue
        }
        //******************************************************
        
        //Задача №8 - вращение строки
        /*
         написать функцию, которая принмает две строки и возращает true, если одна строка является вращением другой,с учетом регистра
         вращение строки - это когда мы берем буквы с конца строки и переносим их в начало, например, строка "swift" при вращении на 2 символа станет "ftswi"
         */
        //Решение
        //двойная строка содержит в себе все возможные вращения
        
        func reverseString(string1: String, string2: String) -> Bool {
            guard string1.count == string2.count else {
                return false
            }
            let newStr = string1 + string1
            return newStr.contains(string2)
        }
        
        //******************************************************
        
        /*
         Задача №9 - являеся ли строка панграммой?
         Задание: написать функцию, которая принимает строку и возвращает true, если эта строка является панграммой, игнорируя регистр (панграмма - фраза, содержащая в себе все буквы алфавита)
         
         Решение:
         */
        
        func panrgam(input: String) -> Bool {
            let set = Set(input.lowercased())
            let letter = set.filter {
                $0 >= "a" && $0 <= "z"
            }
            return letter.count == 26
        }
        //******************************************************
        
        /*
         Задача №10 - Количество гласных и согласных
         Задание: написать функцию, которая принимает строку и возвращает tuple, содержащий число гласных и согласных букв данной строки.
         Решение:
         */
        func separate(input: String) -> (vowels: Int, consonants: Int) {
            let vowels = "aeiou"
            let consonants = "bcdfghjklmnpqrstvwxyz"
            
            var vowelsCount = 0
            var consonatCount = 0
            
            for letter in input.lowercased() {
                if vowels.contains(letter) {
                    vowelsCount += 1
                } else if consonants.contains(letter) {
                    consonatCount += 1
                }
            }
            return (vowelsCount, consonatCount)
        }
        
        //******************************************************
        
        /*
         Задача №11 - не более, чем 3 различные буквы
         Задание: написать функцию, которая принимает две строки и возвращает true, если они одинаковы по длине, но различаются по содержанию не более, чем на 3 буквы
         Решение:
         */
        
        func checkTheDifference(first: String, second: String) -> Bool {
            guard first.count == second.count else { return false }
            let firstArray = Array(first)
            let secondArray = Array(second)
            var differenceCount = 0
            
            for (index, element) in firstArray.enumerated() {
                if secondArray[index] != element {
                    differenceCount += 1
                    if differenceCount == 4 {
                        return false
                    }
                }
                
            }
            return true
        }
        //******************************************************
        
        /*
         Задача №12 - Поиск самого длинного префикса
         Задание: написать функцию, которая принимает строку, состоящую из слов с похожими префиксами, раздленных пробелами и возвращает самый длинный префикс, который встречается в каждом слове (swift switch swill swim  вернет swi)
         Решение:
         */
        func prefix(input: String) -> String {
            let parts = input.components(separatedBy: " ")
            guard let first = parts.first else { return "" }
            
            var currentPrefix = ""
            var bestPrefix = ""
            
            for element in first {
                currentPrefix.append(element)
                
                for word in parts {
                    if !word.hasPrefix(currentPrefix) {
                        return bestPrefix
                    }
                }
                bestPrefix = currentPrefix
            }
            return bestPrefix
        }
        
        //******************************************************
        
        /*
         Задача №13 - Повтороение символа в ряду
         Задание: написать функцию, которая принимает строку и возвращает строку, соодержащую символ и количество его повторений в ряду ("aaabbcccc" -> "a3b2c4")
         Решение:
         */
        
        func newString(input: String) -> String {
            var currentLetter: Character?
            var returnString = ""
            var letterCount = 0
            
            for letter in input {
                if letter == currentLetter {
                    letterCount += 1
                } else {
                    if let current = currentLetter {
                        returnString.append("\(current)\(letterCount)")
                    }
                    currentLetter = letter
                    letterCount = 1
                }
            }
            
            if let current = currentLetter {
                returnString.append("\(current)\(letterCount)")
            }
            
            return returnString
        }
        
        //******************************************************
        
        /*
         Задача №14 - перевернуть слова в строке
         Задание: написать функцию, которая принимает строку и возвращает эту же строку, каждое слово которой записано в обратном порядке, без использования цикла
         Решение:
         */
        
        func reverse(input: String) -> String {
            let parts = input.components(separatedBy: " ")
            let reversed = parts.map{ String($0.reversed()) }
            return reversed.joined(separator: " ")
        }
        
        //******************************************************
        
        /*
         Задача №15 - Остаток от деления
         Задание: написать функцию, которая считает от 1 до 100 и печатает Three если число делится на три, Five если на пять и Three five если на 3 и 5
         Решение:
         */
        
        func threeAndFive() {
            for item in 1...100 {
                if item % 3 == 0 && item % 5 == 0 {
                    print("Three Five")
                } else if item % 3 == 0 {
                    print("Three")
                } else if item % 5 == 0 {
                    print("Five")
                } else {
                    print(item)
                }
            }
        }
        
        //******************************************************
        
        /*
         Задача №16 - сгенерировать рандомное число из диапазона
         Задание: написать функцию, ктоорая принимает два числа, минимальное и наксимальное значение диапазона и возвращает рандомное число из этого диапазона,включительно
         Решение:
         */
        func random(min: Int, max: Int) -> Int {
            return Int.random(in: min...max)
        }
        
        //******************************************************
        
        /*
         Задача №17 - возведение одного числа в степень другого
         Задание: функция, принимает два положительных числа и возмодит первое в степень второго
         Решение:
         */
        func power(first: Double, second: Double) -> Double {
            guard first > 0, second > 0 else { return 0 }
            let inPower = pow(first, second)
            return inPower
        }
        
        //******************************************************
        
        /*
         Задача №18 - поменять два числа местами
         Задание: поменять два числа местами без использования промежуточной переменной
         Решение:
         */
        func reverse() {
            //first
            var a = 10
            var b = 5
            
            a = a + b
            b = a - b
            a = a - b
            //second
            swap(&a, &b)
            //third
            (a, b) = (b, a)
        }
        
        //******************************************************
        
        /*
         Задача №19 - найти простое число
         Задание: написать функцию, которая принимает число (Int) и возвращает true, если это число является простым (делится только на 1 и на себя)
         Решение:
         */
        func simpleValue(input: Int) -> Bool {
            guard input >= 2 else { return false }
            
            for i in 2 ..< input {
                if input % i == 0 {
                    return false
                }
            }
            return true
        }
        /*
         Задача №20 - числа в строке
         Задание: написать функцию, которая принимает строку и возвращает true если строка содержит только числа, например, цифры от 0 до 9
         Решение:
         */
        
        func strToInt(input: String) -> Bool {
            return UInt(input) != nil
        }
        
        //решение 2
        
        func strToInt2(input: String) -> Bool {
            for letter in input {
                if Int(String(letter)) == nil {
                    return false
                }
            }
            return true
        }
        //******************************************************
        
        /*
         Задача №21 - сложить числа в строке
         Задание: написать функцию,которая принимает строку, содержащую числа и буквы и возвращает сумму чисел в строке.
         Решение:
         */
        
        func sumToString(input: String) -> Int {
            var sum = 0
            for letter in input {
                
                if Int(String(letter)) != nil {
                    sum += Int(String(letter)) ?? 0
                }
            }
            return sum
        }
    }
}

