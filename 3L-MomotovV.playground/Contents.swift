import UIKit

/*
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/


enum EngineState {
    case turnedOn, turnedOff
}

enum WindowsState {
    case windowsOpened, windowsClosed
}

enum CarAction{
    case setEngineState(EngineState)
    case setWindowsState(WindowsState)
    case loadTrunk(Int)
}

struct Car {
    let mark: String // enum
    let year: Int
    var trunkLoad: Int
    let maxTrunkLoad: Int
    var engineState: EngineState
    var windowsState: WindowsState
    
    init(mark: String, year: Int, maxTrunkLoad: Int) {
        self.mark = mark
        self.year = year
        self.trunkLoad = 0
        self.maxTrunkLoad = maxTrunkLoad
        self.engineState = .turnedOff
        self.windowsState = .windowsClosed
    }
    
    mutating func makeAction(carAction: CarAction) {
        switch carAction {
        case .loadTrunk(let load):
            if trunkLoad + load > maxTrunkLoad {
                print("Багажник заполнен")
            }
            else {
                self.trunkLoad += load
            }
        case .setEngineState(let engineState):
            self.engineState = engineState
        case .setWindowsState(let windowsState):
            self.windowsState = windowsState
        }
    }
    
    func describeSelf() {
        print("Это автомобиль марки \(mark), \(year) года выпуска, с заполненностью багажника \(trunkLoad) из \(maxTrunkLoad) .")
        if (engineState == .turnedOn) {
            print("Двигатель запущен.")
        } else {
            print("Двигатель выключен.")
        }
        if (windowsState == .windowsOpened) {
            print("Окна открыты.")
        } else {
            print("Окна закрыты.")
        }
        
        
    }
}

var sportCar = Car(mark: "SomeSportCar", year: 2016, maxTrunkLoad: 200)

sportCar.makeAction(carAction: .loadTrunk(250))
sportCar.makeAction(carAction: .loadTrunk(50))
sportCar.makeAction(carAction: .setEngineState(.turnedOn))
sportCar.describeSelf()

var trunkCar = Car(mark: "SomeTrunkCar", year: 1998, maxTrunkLoad: 4000)
trunkCar.makeAction(carAction: .loadTrunk(250))
trunkCar.makeAction(carAction: .loadTrunk(400))
trunkCar.makeAction(carAction: .setEngineState(.turnedOn))
trunkCar.makeAction(carAction: .setWindowsState(.windowsOpened))
trunkCar.describeSelf()
