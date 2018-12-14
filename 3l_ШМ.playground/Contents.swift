import UIKit

// Перечисление марок легковых автомобилей
enum CBrand {
    case Lada, BMW, Mersedes
}

// Перечисление марок грузовых автомобилей
enum TBrand {
    case Gazel, MAN, Volvo
}

// Перечисление действий: запустить/заглушить двигатель, открыть/закрыть окна
enum Action {
    case nothingToDo
    case startEngine, stoppedEngine
    case openWindow, closeWindow
    }

// Описываем структуру легкового автомобиля: Марка, год выпуска, емкость багажника, заполненость багажника, груз
struct Car {
    let carBrand: CBrand
    let year: Int
    let trunkCapacity: Int
    var trunkFilled: Int
    var cargo: Int
    
// Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    var actionToDo: Action = .nothingToDo {
        willSet {
            print("will set new value = \(newValue) instead of old value = \(self.actionToDo)")
        }
        didSet {
            print("did set new value = \(self.actionToDo) instead of old value = \(oldValue)")
            self.makeActionToDo()
        }
    }
    
    // Начальная инициализация
    init(carBrand: CBrand, year: Int, trunkCapacity: Int, trunkFilled: Int, cargo: Int, actionToDo: Action) {
        self.carBrand = carBrand
        self.year = year
        self.trunkCapacity = trunkCapacity
        self.trunkFilled = trunkFilled
        self.cargo = cargo
        self.actionToDo = .nothingToDo
    }
    
    // Добавляем метод, который меняет свойства структуры в зависимости от действия и выводит информацию о структуре в консоль
    mutating func makeActionToDo() {
    // Вывод в консоль
        print("\(self.actionToDo) did done by \(self.carBrand) \(self.year), Trunk capacity: \(self.trunkCapacity), Trunk filled: \(self.trunkFilled), Cargo: \(cargo)")
    // Проверяем поместиться ли груз в багажник либо значение груза не должно быть отрицательным и добавляем значение груза к уже имеющемуся значению
        if (trunkFilled + cargo >= 0) && (trunkFilled + cargo <= trunkCapacity) {
                trunkFilled = trunkFilled + cargo
                cargo = 0
        } else {
            print("Invalid cargo value")
        }
    }

}

// Описываем структуру грузового автомобиля: Марка, год выпуска, емкость багажника, заполненость багажника, груз
struct Truck {
    let carBrand: TBrand
    let year: Int
    let trunkCapacity: Int
    var trunkFilled: Int
    var cargo: Int
    
    // Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    var actionToDo: Action = .nothingToDo {
        willSet {
            print("will set new value = \(newValue) instead of old value = \(self.actionToDo)")
        }
        didSet {
            print("did set new value = \(self.actionToDo) instead of old value = \(oldValue)")
            self.makeActionToDo()
        }
    }
    
    // Начальная инициализация
    init(carBrand: TBrand, year: Int, trunkCapacity: Int, trunkFilled: Int, cargo: Int, actionToDo: Action) {
        self.carBrand = carBrand
        self.year = year
        self.trunkCapacity = trunkCapacity
        self.trunkFilled = trunkFilled
        self.cargo = cargo
        self.actionToDo = .nothingToDo
    }
    
    // Добавляем метод, который меняет свойства структуры в зависимости от действия и выводит информацию о структуре в консоль
    mutating func makeActionToDo() {
        // Вывод в консоль
        print("\(self.actionToDo) did done by \(self.carBrand) \(self.year), Trunk capacity: \(self.trunkCapacity), Trunk filled: \(self.trunkFilled), Cargo: \(cargo)")
        // Проверяем поместиться ли груз в багажник либо значение груза не должно быть отрицательным и добавляем значение груза к уже имеющемуся значению
        if (trunkFilled + cargo >= 0) && (trunkFilled + cargo <= trunkCapacity) {
            trunkFilled = trunkFilled + cargo
            cargo = 0
        } else {
            print("Invalid cargo value")
        }
    }
    
}

// Инициализируем экземпляры и выводим значения в консоль
var car1 = Car(carBrand: .Mersedes, year: 2010, trunkCapacity: 400, trunkFilled: 234, cargo: 56, actionToDo: .closeWindow)
var truck1 = Truck(carBrand: .MAN, year: 2015, trunkCapacity: 5000, trunkFilled: 2500, cargo: 500, actionToDo: .startEngine)
var car2 = Car(carBrand: .Lada, year: 2018, trunkCapacity: 250, trunkFilled: 100, cargo: 23, actionToDo: .openWindow)
var truck2 = Truck(carBrand: .Gazel, year: 2017, trunkCapacity: 2000, trunkFilled: 1000, cargo: 300, actionToDo: .nothingToDo)

car1.actionToDo = .startEngine
car1.cargo = 23
car1.actionToDo = .closeWindow
car1.cargo = -57
car1.makeActionToDo()
car1.actionToDo = .nothingToDo
car2.actionToDo = .startEngine
car2.actionToDo = .stoppedEngine
car2.actionToDo = .closeWindow
car2.actionToDo = .nothingToDo
truck1.actionToDo = .startEngine
truck1.actionToDo = .closeWindow
truck1.cargo = 500
truck1.makeActionToDo()
truck1.actionToDo = .nothingToDo
truck2.actionToDo = .startEngine

