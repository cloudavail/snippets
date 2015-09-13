//: Playground - noun: a place where people can play

import UIKit

// the class "ball" is a base class
// the "ball" base class does not inherit from any other classes
// the class "ball" is also a superclass - because it has subclasses

class Ball {
    // the shape of a ball is typically a circle
    var shape: String = "circle"
    // the ball does have a circumference, but we aren't able to define
    var circumference: Double?
    // most calls can bounce
    func bounce() -> String {
        return "Bounces Predictably"
    }
}

class Football: Ball {
    var inflationPressure: (Double, Double) = (8.5, 15.6)
    override init () {
        // super.init() - ensures the parent class has created an instance
        // the above is terrible, btw - you are required to
        // super.init() before overriding
        // at this point, the superclass / subclass implementation seems to be a hack
        super.init()
        shape = "prolate spheroid"
        circumference = 27.5
    }
    override func bounce() -> String {
        return "Bounces Unpredictably"
    }
}

class Basketball: Ball {
    var inflationPressure: (Double, Double) = (7.5, 8.5)
    override init () {
        // super.init() - ensures the parent class has created an instance
        super.init()
        circumference = 27.5
    }
}

class Baseball: Ball {
    override init () {
        super.init()
        circumference = 9.25
    }
    override func bounce() -> String {
        return "Bounces Poorly"
    }
}

let ball = Ball()
let baseball = Baseball()
let basketball = Basketball()
let football = Football()

println("Baseball Circumference: \(baseball.circumference!)")
println("Basketball Circumference: \(basketball.circumference!)")
println("Football Circumference: \(football.circumference!)")

println("Baseball: \(baseball.bounce())")
println("Basketball: \(basketball.bounce())")
println("Football: \(football.bounce())")
