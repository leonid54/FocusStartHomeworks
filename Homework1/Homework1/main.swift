import Foundation

struct Car {
    var manufacturer: String
    var model: String
    var body: Body
    var yearOfIssue: Int?
    var carNumber: String?
}

enum Body {
    case sedan
    case coupe
    case cabriolet
    case nonSelectedBody
}

var ListOfCars = [Car]()

func printMenu() {
    print("""
    What are you want to do?
    1 - Do you want append a new car?
    2 - Do you want see all cars?
    3 - Do you want see kind cars for body?
    0 - Do you want go away?
    """)
    
    let answer: Bool = true
    
    while answer {
        let choice = readLine()
        if choice == "1" {
            assembleNewCar()
        } else if choice == "2" {
            showAllCars()
        } else if choice == "3" {
            showFilteredCars()
        } else if choice == "0" {
            print("See you later, good bye!")
            break
        }
    }
}

func assembleNewCar() {
    let manufacturer: String
    let model: String
    let body: Body
    let yearOfIssue: Int?
    let carNumber: String?
    
    print("Write manufacturer of the car")
    manufacturer = readLine() ?? ""
    
    print("Write model of the car")
    model = readLine() ?? ""
    
    print("""
    Write body of the car:
    1 - sedan
    2 - coupe
    3 - cabriolet
    """)
    let typeOfBody = readLine()
    body = selectBody(typeOfBody: typeOfBody ?? "")
    
    print("Write year of the car issue")
    yearOfIssue = Int(readLine() ?? "-")
    
    print("Write the car number")
    carNumber = readLine() ?? "-"
    appendAssembledCar(newCar: Car(manufacturer: manufacturer, model: model, body: body,
                                   yearOfIssue: yearOfIssue, carNumber: carNumber))
}

func appendAssembledCar(newCar : Car) {
    ListOfCars.append(newCar)
}

func selectBody(typeOfBody: String) -> Body{
    switch (typeOfBody) {
    case "1":
        return .sedan
    case "2":
        return .coupe
    case "3":
        return .cabriolet
    default:
        return .nonSelectedBody
    }
}

func showAllCars() {
    print(ListOfCars)
}

func showFilteredCars() {
    print("""
    Choose cars for body:
    1 - sedan
    2 - coupe
    3 - cabriolet
    """)
    let typeOfBody = readLine()
    let selectedBody = selectBody(typeOfBody: typeOfBody ?? "")
    let filteredList = ListOfCars.filter {
        $0.body == selectedBody
    }
    print(filteredList)
}

printMenu()
