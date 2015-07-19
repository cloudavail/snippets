//: Playground - noun: a place where people can play

import Cocoa

func characterCount(name: String) -> Int {
    var numberOfCharacters = count(name)
    return numberOfCharacters
}

var name = "Colin"

var nameCharacterCount = characterCount(name)
println("The name \(name) has \(nameCharacterCount) characters")
