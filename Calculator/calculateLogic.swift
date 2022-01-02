//
//  calculateLogic.swift
//  Calculator
//
//  Created by Connor Reed on 1/2/22.
//

import Foundation

enum Operator{
    case mul, div, add, sub, open, close, pow
}


func parseExpression(input:String)->[[Any]]{
    var numbers:[Float] = []
    var operators:[Operator] = []
    //clean up input
    var currentNumberString = "";
    func resetCurrentNumberString(){
        if currentNumberString != ""{
            var currentNumber =  Float(currentNumberString) ?? 0
            numbers.append(currentNumber)
            currentNumberString = ""
        }
    }
    for char in input{
        if char == "+"{
            operators.append(Operator.add)
            resetCurrentNumberString()
        } else if char == "-" {
            operators.append(Operator.sub)
            resetCurrentNumberString()
        } else if char == "*"{
            operators.append(Operator.mul)
            resetCurrentNumberString()
        } else if char == "/" {
            operators.append(Operator.div)
            resetCurrentNumberString()
        } else if char == "^"{
            operators.append(Operator.pow)
            resetCurrentNumberString()
        } else if char == "("{
            operators.append(Operator.open)
            resetCurrentNumberString()
        } else if char == ")"{
            operators.append(Operator.close)
            resetCurrentNumberString()
        } else{
            if char == "˗"{
                currentNumberString = "-" + currentNumberString
            } else{
                currentNumberString += String(char)
            }
        }
    }
    resetCurrentNumberString()
    return [numbers, operators]
}
func closingParenthacesAfter(arr:[Operator], num:Int) -> Int{
    var level:Int = 0
    for i in num..<arr.count{
        if arr[i] == Operator.close{
            level -= 1
        } else if arr[i] == Operator.open{
            level += 1
        }
        if level == 0{
            return i
        }
    }
    return -1
}
func evaluateExpression(input: [[Any]])->Float{
    var res:Float = 0;
    var numbers = input[0] as! [Float]
    var operators = input[1] as! [Operator]
    //var parenthacesOpened = 0;
    func getAccurateOperatorNum(operatorNum:Int) -> Int{
        var res:Int = 0
        for i in 0...operatorNum{
            if operators[i] != Operator.open && operators[i] != Operator.close{
                res += 1
            }
        }
        return res
    }
    func applyOperation(num:Int, type:Operator){
        var res:Float = 0
        var delete = true
        print(numbers)
        print(operators)
        switch type{
        case .mul:
            //print(num)
            //print(numbers)
            res = numbers[num] * numbers[num + 1]
        case .div:
            res = numbers[num] / numbers[num + 1]
        case .add:
            res = numbers[num] + numbers[num + 1]
        case .sub:
            res = numbers[num] - numbers[num + 1]
        case .pow:
            res = pow(numbers[num], numbers[num + 1])
        case .open:
            let closingOperator = closingParenthacesAfter(arr: operators, num: num)
            let closingNumber = getAccurateOperatorNum(operatorNum: closingOperator)
            //print(operators)
            //print(numbers)
            //print(closingOperator)
            //print(num)
            let pnumbers = Array(numbers[num...closingNumber])
            //print(pnumbers)
            //print(closingNumber)
            let poperators = Array(operators[(num + 1)..<closingOperator])
            //print(pnumbers)
            let presult = evaluateExpression(input: [pnumbers, poperators])
            res = presult
            delete = false
            //remove the parenthaces differently from the rest
            numbers.removeSubrange(num..<closingNumber + 1)
            operators.removeSubrange(num..<(closingOperator + 1))
            //print(operators)
        case .close:
            break
        default:
            print("unknown operator")
        }
        if delete{
            numbers.remove(at: num)
            numbers.remove(at: num)
            operators.remove(at: num)
        }
        numbers.insert(res, at: num)
        operatorNum = 0
        //print("\n\n")
        //print(numbers)
        //print(operators)
        
    }
    //open parenthace
    var operatorNum = 0
    while operators.count > operatorNum {
        var operatorType = operators[operatorNum]
        if operatorType == Operator.open{
            applyOperation(num:operatorNum, type: operatorType)
            //parenthacesOpened += 1;
            operatorNum -= 1;
        }
        operatorNum += 1;
    }
    //pow
    operatorNum = 0
    while operators.count > operatorNum {
        var operatorType = operators[operatorNum]
        if operatorType == Operator.pow{
            applyOperation(num:operatorNum, type: operatorType)
            //parenthacesOpened += 1;
            operatorNum -= 1;
        }
        operatorNum += 1;
    }
    //mul/div
    operatorNum = 0
    while operators.count > operatorNum {
        var operatorType = operators[operatorNum]
        if operatorType == Operator.mul || operatorType == Operator.div{
            applyOperation(num:operatorNum, type: operatorType)
            operatorNum -= 1;
        }
        operatorNum += 1;
    }
    //add/sub
    operatorNum = 0
    while operators.count > operatorNum {
        var operatorType = operators[operatorNum]
        if operatorType == Operator.add || operatorType == Operator.sub{
            applyOperation(num:operatorNum, type: operatorType)
            operatorNum -= 1;
        }
        operatorNum += 1;
    }
    res = numbers[0]
    return res;
}
func evaluate(input:String)->Float{
    var parsed = parseExpression(input: input)
    var evaluated = evaluateExpression(input: parsed)
    return evaluated;
}
