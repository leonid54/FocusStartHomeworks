import Foundation

struct Car: Equatable{
    var manufacturer: String
    var model: String
    var body: Body
    var yearOfIssue: Int?
    var carNumber: String?
}

enum Body: Int, CaseIterable {
    case sedan
    case coupe
    case cabriolet
}

var array = [Car]()

func printMenu() {
    print("""
What are you want to do?
1 - Do you want append a new car?
2 - Do you want see all cars?
3 - Do you want see kind cars for body?
""")
}

printMenu()
while let answer = readLine() {
    if answer == "1" {
        print("Write manufacturer of the car")
        let manuf = readLine()
        print("Write model of the car")
        let mod = readLine()
        print("Write year of the car issue")
        let issue = readLine()
        print("Write the car number")
        let number = readLine()
        print("""
Write body of the car:
0 - sedan
1 - coupe
2 - cabriolet
""")
            if let bod = readLine() {
                var boddy = Body(rawValue: Int(bod) ?? 0)
                switch boddy  {
                case .cabriolet:
                    print("you choose carbriolet")
                    array.append(Car(manufacturer: manuf ?? "", model: mod ?? "", body:.cabriolet  , yearOfIssue: Int(issue ?? "-"), carNumber: number ?? ""))
                case .coupe:
                    print("you choose coupe")
                    array.append(Car(manufacturer: manuf ?? "", model: mod ?? "", body:.coupe  , yearOfIssue: Int(issue ?? "-"), carNumber: number ?? ""))
                case .sedan:
                    print("you choose sedan")
                    array.append(Car(manufacturer: manuf ?? "", model: mod ?? "", body: .sedan  , yearOfIssue: Int(issue ?? "-"), carNumber: number ?? ""))
                default:
                    print("you choose nothing")
                }
        }
        printMenu()
    } else if answer == "2" {
    print(array)
    printMenu()
    } else if answer == "3" {
        print("""
Choose cars for body:
1 - cabriolet
2 - coupe
3 - sedan
""")
        while let choose = readLine() {
            if choose == "1" {
                let filter = array.filter { car in
                    return car.body == .cabriolet
                }
                print(filter)
                break
            }
            else if answer == "2" {
                let filter = array.filter { car in
                    return car.body == .coupe
                }
                print(filter)
                break
            }  else if answer == "3" {
                let filter = array.filter { car in
                    return car.body == .sedan
                }
                print(filter)
                break
            }
        }
        printMenu()
    }
}
