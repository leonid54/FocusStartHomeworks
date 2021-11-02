import Foundation

struct Car: CustomStringConvertible {
    var description: String {
"""

    manufacturer: \(manufacturer)
    model: \(model)
    body: \(body.rawValue)
    yearOfIssue: \(yearOfIssue?.description ?? "-")
    \(carNumber != nil ? "carNumber: \(String(describing: carNumber))" : "")

"""
    }
    var manufacturer: String
    var model: String
    var body: Body
    var yearOfIssue: Int?
    var carNumber: String?
}

enum Body: String {
    case sedan = "sedan"
    case coupe = "coupe"
    case cabriolet = "cabriolet"
    case nonSelectedBody = "nonSelectedBody"
}

var listOfCars = [Car]()

func printMenu() {
    print("""
    What are you want to do?
    1 - Do you want append a new car?
    2 - Do you want see all cars?
    3 - Do you want see kind cars for body?
    0 - Do you want go away?
    """)

    while true {
        let choice = readLine()
        switch choice {
        case "1":
            assembleNewCar()
        case "2":
            showAllCars()
        case "3":
            showFilteredCars()
        case "0":
            print("See you later, good bye!")
            return
        default:
            print("Error, try again")
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
    sedan
    coupe
    cabriolet
    """)
    let typeOfBody = readLine()
    body = Body(rawValue: typeOfBody ?? "nonSelectedBody") ?? Body.nonSelectedBody

    print("Write year of the car issue")
    yearOfIssue = Int(readLine() ?? "-")

    print("Write the car number")
    carNumber = readLine() ?? "-"
    listOfCars.append(Car(manufacturer: manufacturer, model: model, body: body,
                                   yearOfIssue: yearOfIssue, carNumber: carNumber))
}

func showAllCars() {
    print(listOfCars.description)
}

func showFilteredCars() {
    print("""
    Write body of the car:
    sedan
    coupe
    cabriolet
    """)
    let typeOfBody = readLine()
    let selectedBody = Body(rawValue: typeOfBody ?? "nonSelectedBody") ?? Body.nonSelectedBody
    let filteredList = listOfCars.filter {
        $0.body == selectedBody
    }
    print(filteredList)
}

printMenu()
