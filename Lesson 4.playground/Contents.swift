import UIKit

// Перечисление марок автомобилей
enum CBrand {
    case Volvo, BMW, Mersedes
}

// Перечисление действий: запустить/заглушить двигатель, открыть/закрыть окна
enum CarWindowState {
    case open, close
}

enum CarEngineState {
    case start, stop
}
// Перечисление действий для Sportcar: открыть/закрыть люк
enum CarHatchState {
    case open, close
}

// Перечисление действий для Trunkcar: добавить/убрать прицеп
enum CarTrailerState {
    case add, remove
}

// Класс Car с общими для автомобилей свойствами: Марка, год выпуска, открыты ли окна, запущен ли двигатель
class Car {
    let carBrand: CBrand
    let year: Int
    var windowState: CarWindowState
    var engineState: CarEngineState
    
// Начальная инициализация
    init(carBrand: CBrand, year: Int, windowState: CarWindowState, engineState: CarEngineState) {
        self.carBrand = carBrand
        self.year = year
        self.windowState = .close
        self.engineState = .stop
    }
    
// Добавляем методы и вывод в консоль
    func openWindow() {
        windowState = .open
        print("\(self.carBrand) \(self.year): Оpen window")
    }
    
    func closeWindow() {
        windowState = .close
        print("\(self.carBrand) \(self.year): Close window")
    }
    
    func startEngine() {
        engineState = .start
        print("\(self.carBrand) \(self.year): Start engine")
    }
    
    func stopEngine() {
        engineState = .stop
        print("\(self.carBrand) \(self.year): Stop engine")
    }
}

// Класс SportCar наследует свойства класса Car, а также имеет специфичные свойства: данные о мощности двигателя и данные о состоянии люка.
class SportCar: Car {
    let enginePower: Int
    var hatchState: CarHatchState

//Начальная инициализация с учетом наследуемого класса Car
    init(carBrand: CBrand, year: Int, windowState: CarWindowState, engineState: CarEngineState, enginePower: Int, hatchState: CarHatchState) {
        self.enginePower = enginePower
        self.hatchState = .close
        super.init(carBrand: carBrand, year: year, windowState: windowState, engineState: engineState)
    }
// Добавляем специфичные методы для этого класса и вывод в консоль
    func openHatch() {
        hatchState = .open
        print("\(self.carBrand) \(self.year): Оpen hatch")
    }
    
    func closeHatch() {
        hatchState = .close
        print("\(self.carBrand) \(self.year): Close hatch")
    }
}

// Класс TrunkCar наследует свойства класса Car, а также имеет специфичные свойства: данные о наличии прицепа.
class TrunkCar: Car {
    var trailerState: CarTrailerState

//Начальная инициализация с учетом наследуемого класса Car
    init(carBrand: CBrand, year: Int, windowState: CarWindowState, engineState: CarEngineState, trailerState: CarTrailerState) {
        self.trailerState = .remove
        super.init(carBrand: carBrand, year: year, windowState: windowState, engineState: engineState)
    }

// Добавляем специфичные методы для этого класса и вывод в консоль
    func addTrailer() {
        trailerState = .add
        print("\(self.carBrand) \(self.year): Add trailer")
    }
    
    func removeTrailer() {
        trailerState = .remove
        print("\(self.carBrand) \(self.year): Remove trailer")
    }
}

// Инициализируем экземпляры и выводим значения в консоль
var car1 = Car(carBrand: .Mersedes, year: 2010, windowState: .open, engineState: .stop)
car1.openWindow()
car1.startEngine()
car1.stopEngine()

var sportcar1 = SportCar(carBrand: .BMW, year: 2017, windowState: .close, engineState: .start, enginePower: 600, hatchState: .close)
sportcar1.openHatch()
sportcar1.startEngine()

var trunkcar1 = TrunkCar(carBrand: .Volvo, year: 2016, windowState: .open, engineState: .start, trailerState: .add)
trunkcar1.removeTrailer()
trunkcar1.startEngine()

