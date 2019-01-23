//
//  main.swift
//  Lesson 5
//
//  Created by admin on 21/12/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

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

// Протокол Car с общими для всех автомобилей свойствами: марка, год выпуска, открыты ли окна, запущен ли двигатель
protocol Car {
    var carBrand: CBrand {get set}
    var year: Int {get set}
    var windowState: CarWindowState {get set}
    var engineState: CarEngineState {get set}
    
    // Добавляем методы
    func openWindow()
    func closeWindow()
    func startEngine()
    func stopEngine()
}

//Расширение протокола Car, и реализация методов конкретных действий
extension Car {
    mutating func openWindow() {
       windowState = .open
    }
    
    mutating func closeWindow() {
        windowState = .close
    }
    
    mutating func startEngine() {
        engineState = .start
    }
    
    mutating func stopEngine() {
        engineState = .stop
    }
}

//Создаем протокол ConsolePrintable, который наследует стандартный протокол вывода значений в консоль CustomStringConvertible
protocol ConsolePrintable: CustomStringConvertible {
//Создаем метод вывода значений в консоль
    func printDescription()
}

//Расширяем протокол ConsolePrintable
extension ConsolePrintable {
//Реализуем метод для вывода в консоль поля description
    func nameprintDescription() {
//Само поле description определено в CustomStringConvertible
        print(description)
    }
}

// Создаем класс SportCar, имплементирующий протоколы Car и ConsolePrintable, а также имеет дополнительные свойства для SportCar: hatchState - данные о состоянии люка.
class SportCar: Car, ConsolePrintable {
    var carBrand: CBrand
    var year: Int
    var windowState: CarWindowState
    var engineState: CarEngineState

    // Описываем свойство description и реализуем требования стандартного протокола вывода в консоль CustomStringConvertible
    var description: String {
        return "Brand: \(self.carBrand), Year: \(self.year), Engine power: \(self.enginePower), Window: \(self.windowState), Engine:  \(self.engineState), Hatch:  \(self.hatchState)"
    }
   
    // Описываем характерные для SportCar свойства
    var hatchState: CarHatchState
    let enginePower: Int

    // Начальная инициализация для класса SportCar
    init(carBrand: CBrand, year: Int, enginePower: Int) {
        self.carBrand = carBrand
        self.year = year
        self.windowState = .close
        self.engineState = .stop
        self.hatchState = .close
        self.enginePower = enginePower
    }
    // Методы
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
    
    // Методы характерные только для класса SportCar
    func closeHatch() {
        hatchState = .close
        print("\(self.carBrand) \(self.year): Close hatch")
    }
    
    func openHatch() {
        hatchState = .open
        print("\(self.carBrand) \(self.year): Open hatch")
    }
    
    // Метод вывода в консоль
    func printDescription() {
        print(description)
    }
}

// Создаем класс TrunkCar, имплементирующий протоколы Car и ConsolePrintable, а также имеет дополнительные свойства для TrunkCar: trailerState - данные о наличии прицепа.
class TrunkCar: Car, ConsolePrintable {
    var carBrand: CBrand
    var year: Int
    var windowState: CarWindowState
    var engineState: CarEngineState
    
// Описываем характерные для TrunkCar свойства
    var trailerState: CarTrailerState //Добавлен/убран прицеп
    let trunkCapacity: Int //Емкость машины
    var trunkFilled: Int //Заполненность машины
    
// Описываем свойство description и реализуем требования стандартного протокола вывода в консоль CustomStringConvertible
    var description: String {
        return "Brand: \(self.carBrand), Year: \(self.year), Window: \(self.windowState), Engine:  \(self.engineState), Trunk capacity: \(self.trunkCapacity), Trunk filled: \(self.trunkFilled), Trailer:  \(self.trailerState)"
    }
// Начальная инициализация для класса TrunkCar
    init(carBrand: CBrand, year: Int, trunkCapacity: Int, trunkFilled: Int) {
        self.carBrand = carBrand
        self.year = year
        self.windowState = .close
        self.engineState = .stop
        self.trailerState = .remove
        self.trunkCapacity = trunkCapacity
        self.trunkFilled = trunkFilled
    }
// Методы
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

// Методы характерные только для класса TrunkCar
    func addTrailer() {
        trailerState = .add
        print("\(self.carBrand) \(self.year): Add trailer")
    }
    
    func removeTrailer() {
        trailerState = .remove
        print("\(self.carBrand) \(self.year): Remove trailer")
    }
// Метод, состояния загрузки машины, который расчитывает возможно ли загрузить или выгрузить заданный груз
    func addCargo(cargo: Int) {
        if (trunkFilled + cargo >= 0) && (trunkFilled + cargo <= trunkCapacity) {
            trunkFilled += cargo
            print("Brand: \(self.carBrand), Year: \(self.year), Trunk capacity: \(self.trunkCapacity), Trunk filled: \(self.trunkFilled), Cargo: \(cargo)")
        } else {
            print("Brand: \(self.carBrand), Year: \(self.year), Trunk capacity: \(self.trunkCapacity), Trunk filled: \(self.trunkFilled), Cargo: \(cargo) invalid cargo value")
        }
    }
    
// Метод вывода в консоль
    func printDescription() {
        print(description)
    }
}

var sportcar1 = SportCar(carBrand: .BMW, year: 2017, enginePower: 600)
sportcar1.printDescription()
sportcar1.openHatch()
sportcar1.startEngine()
sportcar1.printDescription()

var trunkcar1 = TrunkCar(carBrand: .Volvo, year: 2016, trunkCapacity: 400, trunkFilled: 234)
trunkcar1.printDescription()
trunkcar1.startEngine()
trunkcar1.openWindow()
trunkcar1.addTrailer()
trunkcar1.addCargo(cargo: 56)
trunkcar1.addCargo(cargo: -453)
trunkcar1.printDescription()

