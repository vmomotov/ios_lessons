import UIKit

/*
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.
*/

enum EngineState {
    case turnedOn, turnedOff
}

enum WindowsState {
    case windowsOpened, windowsClosed
}

protocol Car {
    var mark: String { get}
    var year: Int { get }
    var trunkLoad: Int { get set }
    var maxTrunkLoad: Int { get }
    var engineState: EngineState { get set }
    var windowsState: WindowsState { get set }

}

extension Car {
    mutating func setEngineState(engineState: EngineState ) {
        self.engineState = engineState
    }
    
    mutating func setWindowsState(windowsState: WindowsState ) {
        self.windowsState = windowsState
    }
    
    mutating func loadTrunk(trunkLoad: Int ) {
        if self.trunkLoad + trunkLoad > self.maxTrunkLoad {
            print("Багажник заполнен")
        }
        else {
            self.trunkLoad += trunkLoad
        }
    }
}


class SportCar : Car, CustomStringConvertible {
    
    
    var mark: String
    var year: Int
    var trunkLoad: Int
    var maxTrunkLoad: Int
    var engineState: EngineState
    var windowsState: WindowsState
    
    var hasNitro: Bool // отличие спорткара
    
    init(mark: String, year: Int, maxTrunkLoad: Int) {
        self.mark = mark
        self.year = year
        self.trunkLoad = 0
        self.maxTrunkLoad = maxTrunkLoad
        self.engineState = .turnedOff
        self.windowsState = .windowsClosed
        self.hasNitro = true
    }
    
    var description: String {
        return "Это спорткар"
    }
    
    
}

class TrunkCar : Car, CustomStringConvertible {
    var mark: String
    var year: Int
    var trunkLoad: Int
    var maxTrunkLoad: Int
    var engineState: EngineState
    var windowsState: WindowsState
    
    var wagonsCount: Int // отличие грузовика
    
    init(mark: String, year: Int, maxTrunkLoad: Int) {
        self.mark = mark
        self.year = year
        self.trunkLoad = 0
        self.maxTrunkLoad = maxTrunkLoad
        self.engineState = .turnedOff
        self.windowsState = .windowsClosed
        self.wagonsCount = 1
    }
    
    var description: String {
        return "Это грузовик"
    }
}


var sportCar = SportCar(mark: "SomeSportCar", year: 2016, maxTrunkLoad: 200)
sportCar.setEngineState(engineState: .turnedOn)
print(sportCar)


var trunkCar = TrunkCar(mark: "SomeTrunkCar", year: 1998, maxTrunkLoad: 4000)
trunkCar.setWindowsState(windowsState: .windowsOpened)
print(trunkCar)
