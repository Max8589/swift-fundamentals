import UIKit

// Перечисление марок автомобилей
enum CBrand {
    case Lada, Volvo, BMW, Mersedes, Peugeot, Renault
}

// Перечисление действий: запустить/заглушить двигатель
enum CarEngineState {
    case start, stop
}

// Ошибки
enum CarError: Error {
    case engineIsAlreadyStopped  //Двигатель уже запущен
    case engineIsAlreadyStarted  //Двигатель заглушен
    case outOfFuel               //Нет бензина
    case invalidYearFormat       //Ошибка даты выпуска автомобиля
}


// Класс Car со свойствами: марка, год выпуска, запущен ли двигатель, запас бензина
class Car {
    var carBrand: CBrand
    let year: Int
    var engineState: CarEngineState
    var fuel = 2
    
//  Инициализация
    init(carBrand: CBrand, year: Int) {
        self.year = year
        self.carBrand = carBrand
        self.engineState = .stop
    }

//Проверка корректности ввода года выпуска автомобиля
    func yearPrint() -> (Int?, CarError?) {
        // Возвращаем год выпуска автомобиля и ошибку
        guard self.year > 1900 else {
            // Возвращаем nil если год выпуска автомобиля ранее 1900 и ошибку
            return (nil, CarError.invalidYearFormat)
        }
        guard self.year < 2018 else {
            // Возвращаем nil если год выпуска автомобиля позднее 2018 и ошибку
            return (nil, CarError.invalidYearFormat)
        }
        // Возвращаем год выпуска автомобиля и nil вместо ошибки
        return (self.year, nil)
    }

// Метод startEngine и обработка ошибок
    func startEngine() throws {
        // Закончился бензин
        guard fuel > 0 else {
            throw CarError.outOfFuel
        }
        // Двигаетель уже запущен
        guard engineState != .start else {
            throw CarError.engineIsAlreadyStarted
        }
        // Счетчик бензина -1
        fuel -= 1
        // Меняем значение startEngine на start
        engineState = .start
        // Вывод в консоль
        print("\(self.carBrand) \(self.yearPrint()): Start engine")
    }
// Метод stopEngine и обработка ошибок
    func stopEngine() throws {
        // Двигатель уже остановлен
        guard engineState != .stop else {
            throw CarError.engineIsAlreadyStopped
        }
        // Меняем значение startEngine на stop
        engineState = .stop
        // Вывод в консоль
        print("\(self.carBrand) \(self.yearPrint()): Stop engine")
    }
}


// Инициализируем экземпляры
var car1 = Car(carBrand: .Mersedes, year: 2015)
var car2 = Car(carBrand: .Lada, year: 218)

// Обработка ошибок при запуске двигателя car1 и вывод в консоль
do {
    try car1.startEngine()
} catch CarError.engineIsAlreadyStarted {
    print ("\(car1.carBrand) \(car1.yearPrint()): Engine is already started")
} catch CarError.outOfFuel {
    print ("\(car1.carBrand) \(car1.yearPrint()): Out of fuel")
} catch let error {
    print (error.localizedDescription)
}

do {
    try car1.startEngine()
} catch CarError.engineIsAlreadyStarted {
    print ("\(car1.carBrand) \(car1.yearPrint()): Engine is already started")
} catch CarError.outOfFuel {
    print ("\(car1.carBrand) \(car1.yearPrint()): Out of fuel")
} catch let error {
    print (error.localizedDescription)
}

// Обработка ошибок при остановке двигателя car1 и вывод в консоль
do {
    try car1.stopEngine()
} catch CarError.engineIsAlreadyStopped {
    print ("\(car1.carBrand) \(car1.yearPrint()): Engine is already stopped")
} catch let error {
    print (error.localizedDescription)
}

do {
    try car1.startEngine()
} catch CarError.engineIsAlreadyStarted {
    print ("\(car1.carBrand) \(car1.yearPrint()): Engine is already started")
} catch CarError.outOfFuel {
    print ("\(car1.carBrand) \(car1.yearPrint()): Out of fuel")
} catch let error {
    print (error.localizedDescription)
}

do {
    try car1.startEngine()
} catch CarError.engineIsAlreadyStarted {
    print ("\(car1.carBrand) \(car1.yearPrint()): Engine is already started")
} catch CarError.outOfFuel {
    print ("\(car1.carBrand) \(car1.yearPrint()): Out of fuel")
} catch let error {
    print (error.localizedDescription)
}

// Обработка ошибок car2 и вывод в консоль
do {
    try car2.startEngine()
} catch CarError.engineIsAlreadyStarted {
    print ("\(car2.carBrand) \(car2.yearPrint()): Engine is already started")
} catch CarError.outOfFuel {
    print ("\(car2.carBrand) \(car2.yearPrint()): Out of fuel")
} catch let error {
    print (error.localizedDescription)
}

do {
    try car2.stopEngine()
} catch CarError.engineIsAlreadyStopped {
    print ("\(car2.carBrand) \(car2.yearPrint()): Engine is already stopped")
} catch let error {
    print (error.localizedDescription)
}

do {
    try car2.stopEngine()
} catch CarError.engineIsAlreadyStopped {
    print ("\(car2.carBrand) \(car2.yearPrint()): Engine is already stopped")
} catch let error {
    print (error.localizedDescription)
}

do {
    try car2.startEngine()
} catch CarError.engineIsAlreadyStarted {
    print ("\(car2.carBrand) \(car2.yearPrint()): Engine is already started")
} catch CarError.outOfFuel {
    print ("\(car2.carBrand) \(car2.yearPrint()): Out of fuel")
} catch let error {
    print (error.localizedDescription)
}

do {
    try car2.startEngine()
} catch CarError.engineIsAlreadyStarted {
    print ("\(car2.carBrand) \(car2.yearPrint()): Engine is already started")
} catch CarError.outOfFuel {
    print ("\(car2.carBrand) \(car2.yearPrint()): Out of fuel")
} catch let error {
    print (error.localizedDescription)
}
