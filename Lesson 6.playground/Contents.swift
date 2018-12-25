import UIKit

// Протокол значений свойств name, lastname, age
protocol PropertiesValue {
    var name: String { get }
    var lastname: String { get }
    var age: Int { get }
}

// Создаем класс Persons, который наследует протокол значений свойств PropertiesValue и стандартный протокол вывода значений в консоль CustomStringConvertible.
class Persons:PropertiesValue, CustomStringConvertible {
    var name: String
    let lastname: String
    let age: Int
    // Описываем свойство description стандартного протокола вывода в консоль CustomStringConvertible
    var description: String {
        return "\(name) \(lastname), Age: \(age)"
    }
    //Инициализация
    init(name: String, lastname: String, age: Int) {
        self.name = name
        self.lastname = lastname
        self.age = age
    }
}

//Создаем структуру Queue, Generics с типом данных Т, поддерживающий класс Persons
struct Queue<T: Persons> {
    private var elements: [T] = [] // Массив элементов типа Т
    //Метод push: добавляем элемента типа Т в массив
    mutating func push(element: T) {
        elements.append(element)
    }
    //Метод pop: удаляем последний элемент типа Т из массива
    mutating func pop () -> T? {
        return elements.removeLast()
    }
    //Метод вывода Generics структуры Queue с типом данных T: Persons в консоль
    func printQueue() {
        return print(self.elements)
    }
   //Метод создания массива PersonsArray() Generics структуры Queue с типом данных T: Persons
    func personsArray() -> [T] {
        var iPersons: [T] = []
        var i = 0
        while i < self.elements.count {
            iPersons.append(self.elements[i])
            i += 1
        }
        return iPersons
    }
    //Метод subscripting элемента массива с индексом, если элемента с заданным индексом нет в массиве возвращаем значение nil
    subscript(index: Int) -> T? {
        if self.elements.count > index {
            return self.elements[index]
        } else {
            return nil
        }
    }
    //Метод subscripting элементов массива с заданными индексами
    subscript(indexes: Int ...) -> [T] {
        var IPersons: [T] = []
        for index in indexes {
            if self.elements.count > index {
               IPersons.append(self.elements[index])
            }
    }
            return IPersons
    }
    
}

// Метод фильтрации массива по заданному условию
func filter(array:[Persons], predicate: (Persons) -> Bool ) -> [Persons] {
    var tmpArray = [Persons] ()
    for element in array {
        if predicate(element) {
            tmpArray.append(element)
        }
    }
    return tmpArray
}

//queuePersons структуры Queue
var queuePersons = Queue<Persons>()

// Добавляем экземпляры queuePersons
queuePersons.push(element: Persons(name: "Петр", lastname: "Петров", age: 25))
queuePersons.push(element: Persons(name: "Семен", lastname: "Семенович", age: 50))
queuePersons.push(element: Persons(name: "Сергей", lastname: "Сергеев", age: 38))
queuePersons.push(element: Persons(name: "Анастасия", lastname: "Афанасьева", age: 28))
queuePersons.push(element: Persons(name: "Алла", lastname: "Федорова", age: 65))
queuePersons.push(element: Persons(name: "Григорий", lastname: "Летов", age: 14))
// Вывод в консоль
queuePersons.printQueue()
// Удаляем последний элемент из queuePersons
queuePersons.pop()
queuePersons.printQueue()

// Вывод в консоль результата функции filter к экземплярам queuePersons массива personsArray с заданным условием фильтрации: по возрасту, по имени, по фамилии
print("Фильтр по возрасту: ", filter(array: queuePersons.personsArray()) {$0.age > 34})
print("Фильтр по возрасту: ", filter(array: queuePersons.personsArray()) {$0.age < 34})
print("Фильтр по имени: ", filter(array: queuePersons.personsArray()) {$0.name == "Алла"})
print("Фильтр по фамилии: ", filter(array: queuePersons.personsArray()) {$0.lastname == "Петров"})

// Вывод в консоль результата subscript экземпляров с заданными индексами
print("subscript с заданными индексами: ",(queuePersons[0, 2, 1]))
//subscript экземпляра с индексом
print("subscript с заданным индексом: ",queuePersons[4])
print("subscript с заданным индексом: ",queuePersons[9])


