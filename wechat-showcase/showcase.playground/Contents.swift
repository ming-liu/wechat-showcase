//: Playground - noun: a place where people can play

import UIKit

print("Hello, playground")


// 1. let & var...
let a = 1
let b = "32"
var c = 3
c = 4
print(c)


let d : Double = 5
let e : Double = 6
print(a + c)
print(d + e)

// Playground execution failed: error: playground-showcase.playground:14:10: error: binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
// print(a + d) // fail


// 2. str
print("hello c=\(c) , good morning")


// 3.array
var array1 = [1,2,3,4,5]
var array2 = ["ab","bc","dd"]
let array3 = [String]()
let array4 = [Int32]()
// var array5 = []
// var array3 = [1,"abc"]
// Playground execution failed: error: playground-showcase.playground:26:14: error: heterogenous collection literal could only be inferred to '[Any]'; add explicit type annotation if this is intentional


print("array1[0]=\(array1[0]),    array2[2]=\(array2[2])      ")



// 4.map & directory
var map1 = ["000001":"平安银行","000005":"平安证券"]
var map2 = [String:Float]()
//var map3 = [:]
// var map2 = ["ab":1,"abc":2.2,"dd":"1"]
// Playground execution failed: error: playground-showcase.playground:36:12: error: heterogenous collection literal could only be inferred to '[String : Any]'; add explicit type annotation if this is intentional

map1["000001"]="华夏银行"
print("000001->\(map1["000001"])")


// 5.for in ,if
let table = [4,3,5,-3,-8]
var sum = 0
for each in table  {
    if(each > 0) {
        sum += each
    }
}
print("sum=\(sum)")

sum = 0
for each in 0..<101 {
    sum += each
}
print("sum=\(sum)")

sum = 0
for each in 0...100 {
    sum += each
}
print("sum=\(sum)")

// 6.Option String
var optionString : String? = "Hello"
print(optionString == nil)


var optionName : String? = "lily"
var greeting : String = "Hello !"
// optionName = nil
if let name = optionName {
    print(name)
} else {
    print("optionName is nil")
}

var lastName = optionName ?? "zizi"
optionName = nil
lastName = optionName ?? "zizi"




// 7.switch ,let where
var codeArray = [1,2,3,4,5]
for code in codeArray {
    switch code {
    case 1:
        print("just 1")
    case 2,3:
        print("just 2,3")
    case let c where c>=3:
        print("just try")
    default:
        print("just default")
    }
}

// 8.max num
var dataBase = [
    "first": [3,23,54],
    "second": [33,22,1],
    "third": [31,21,9]
]

var max = -100000
for (key,values) in dataBase {
    for v in values {
        if(v > max) {
            max = v
        }
    }
}

print(max)


// 9.while ,repeat-while
var current = 2
var times = 0
while current < 100 {
    times += 1
    current *= 2
}
print("current=\(current),after \(times) times")






// 10.function & closure

func greet(greet: String,name: String) -> String {
    return "\(greet) ! \(name) "
}

func greet1(_ greet: String,lable1 name: String) -> String {
    return "\(greet) ! \(name)"
}

print(greet(greet: "hello",name: "lili"))
print(greet1("hello", lable1: "zizi"))

func calculateStatistics(arrays:[Int]) -> (Int,Int) {
    var min = 10000
    var max = -10000
    for each in arrays {
        if min > each {
            min = each
        }
        if max < each {
            max = each
        }
    }
    
    return (min,max)
}
func calculateStatistics1(arrays:[Int]) -> (min:Int,max:Int) {
    return calculateStatistics(arrays: arrays)
}

print(calculateStatistics(arrays: [1,2,3,4,5]))
print(calculateStatistics1(arrays: [2,3,2,1]).min)

func sumOf(nums: Int...) -> Int {
    var sum = 0
    for each in nums {
        sum += each
    }
    return sum
}
print(sumOf(nums: 1,2,3))



// inner function
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

print(returnFifteen())

func fSum(v1: Int,v2: Int) -> Int{
    return v1 + v2
}

func fMinus(v1: Int,v2 :Int) ->Int {
    return v1 - v2
}


// outter () means a function,inner() means params
func getFunctions(condiction:Int) -> ((Int,Int)->Int) {
    if condiction == 1 {
        return fSum
    }
    return fMinus
}


getFunctions(condiction: 1)(1,2)
getFunctions(condiction: 2)(1,2)
var f1 = getFunctions(condiction: 3)
f1(2,1)


func invoke(options: ((Int,Int) -> Int),num1: Int) {
    options(num1,num1)
}
invoke(options: getFunctions(condiction: 1), num1: 3)


func invoke2(options:(([Int])->Int),num1:[Int]) {
    options(num1)
}

func sumArray(array:[Int]) -> Int{
    var sum = 0
    for each in array {
        sum += each
    }
    return sum
}

func sumArray2(array:Int ...) -> Int {
    var sum = 0
    for each in array {
        sum += each
    }
    return sum
}
func invokeSumArray2(option:((Int ...)->Int),num:Int ...) {
    // option(num)
    // fail option(1,2,3) cannot invoke option([])
}

invoke2(options: sumArray, num1: [1,23])

// closure {} closure witout a name

func finalInvoke(f: (Int,Int)->Int,num1: Int,num2: Int) -> Int{
    return f(num1,num2)
}

finalInvoke(f: {
    $0 + $1
}, num1: 3, num2: 4)

// When a closure is the only argument to a function, you can omit the parentheses entirely

// no params,no return value   ()->Void
func invokeSimple(f:(()->Void)) {
    f()
}

//invokeSimple(f: {})
func dd1() {
    print("dd1")
}
invokeSimple(f: dd1)
invokeSimple(f: {print("ddd") })
invokeSimple {print("ddd2") }


// class


class Person {
    var name : String?
    
    init(){}
    
    init(name: String) {
        self.name = name
    }
    func setName(n: String)  {
        name = n
    }
    func displayName() {
        print(name ?? "unkown")
    }
}


var p = Person(name:"")
//p.setName(n: nil)
p.displayName()
p.setName(n: "lili")
p.displayName()

var p22 : Person? = Person(name:"lili")
var strName = p22?.name
print("strName = \(strName)")
p22 = nil
strName = p22?.name
print("strName = \(strName)")

var p2 = Person(name: "lili")
p2.displayName()

class Student : Person {
    
    var idNo : String = "000001"
    var birthDay : String {
        get { return idNo}
    }
    
    var sexValue = 0
    var sex : String {
        get {
            if sexValue == 0 {
                return "female"
            }
            return "male"
        }
        set {
            if(newValue == "female") {
                sexValue = 0
            } else {
                sexValue = 1
            }
        }
        
    }
    override init() {
        super.init(name:"")
    }
    
    
}

var st1 = Student()
st1.idNo = "222"
print(st1.birthDay)

st1.sex = "male"
print("male value = \(st1.sexValue)")







// enum
print("Enum started....................................")

enum Tree : Int {
    case Songshu = 10 // define the first raw value,call super.init()
    case Baishu,Huaishu
    case Zaoshu
    
    func simpleDescription() -> String {
        switch self {
        case .Songshu:
            return "song"
        default:
            return "nothing"
        }
    }
}

enum OtherTree {
    case Songshu
    case Baishu
}




print(Tree.Songshu.rawValue)
print(Tree.Baishu)
print(Tree.Baishu.rawValue)

print(Tree.Huaishu.simpleDescription())


print("Enum atention....................................")

enum ServerResponse {
    case result(String,String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:00 pm")
let failure = ServerResponse.failure("out of range")


func determineResponse(s:ServerResponse) {
    switch s {
    case let .result(s1,s2):
        print("\(s1)\(s2)")
    case let .failure(s1):
        print("\(s1)")
    }
}

determineResponse(s: success)
determineResponse(s: failure)
determineResponse(s: ServerResponse.result("1-7", "8-10"))

enum ProcessResults {
    case result(msg:String)
    case exception(errorCode:String,msg:String)
}

print(ProcessResults.result(msg: "submit success"))
print(ProcessResults.exception(errorCode: "00000", msg: "failed for name"))



print("Enum ended.....................................")



print("protocol started....................................")

protocol DaoApi {
    var simpleDescription:String {get}
    mutating func getEntityName() -> String
}


class StudentDao : DaoApi {
    func getEntityName() -> String{
        return "Student"
    }
    
    internal var simpleDescription: String = "Student Dao"
    
}

var sd = StudentDao()
print(sd.getEntityName())


enum DaoFactory : DaoApi {
    func getEntityName() -> String {
        switch self {
        case let .Base(s1,_):
            return s1
        case let .Teacher(s1):
            return s1
        }
    }
    
    var simpleDescription: String {
        get {
            switch self {
            case let .Base(_,s2):
                return s2
            default:
                return "nothing"
            }
        }
    }
    
    case Base(String,String)
    case Teacher(String)
    
}
print(DaoFactory.Base("B1", "B2").getEntityName())
print(DaoFactory.Base("B1", "B2").simpleDescription)

enum PrinterError : Error {
    case NoInput
    case NoOutput
}

func throwFun(v: Int) throws ->String {
    if v == 1 {
        throw PrinterError.NoInput
    } else if v == 2 {
        throw PrinterError.NoOutput
    }
    
    return "\(v)"
}

let ccFun = try throwFun(v: 3)
print(ccFun)

print("fff")

do {
    let ccFun2 = try throwFun(v: 2)
} catch PrinterError.NoInput {
    print("no input")
} catch {
    print("no output")
}

let ccFun3 = try? throwFun(v: 1)
print("ccFun3=\(ccFun3)")
let ccFun4 = try? throwFun(v: 3)
print("ccFun4=\(ccFun4)")


class Dict<T> {
    var person : T?
    var next : T?
    
    func display() {
        print("\(person)---\(next)")
    }
}
var dic = Dict<Person>()
dic.person = Person(name: "lili")
dic.next = Person(name: "zizi")

dic.display()


func padding(bytes:[UInt8]) -> [UInt8] {
    let mod = bytes.count % 16
    if(mod != 0) {
        var result = bytes
        result.append(contentsOf: Array(repeating: 0, count: 16-mod))
        return result
    }
    return bytes
}

let str = "微信hello world ! 微信"
let bytes = [UInt8](str.utf8)
print(bytes.count)
let padded = padding(bytes: bytes)
print(padded.count)
print(padded)




