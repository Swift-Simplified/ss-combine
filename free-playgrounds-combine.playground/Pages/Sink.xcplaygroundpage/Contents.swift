/*: ![Swift](matt-harding-logo.png)
 
 */
//: # Swift Simplified
//: ## A Free Playground
//: ## Demonstrating: Combine
//: ![instructor](instructor.png) [*with Matthew Harding*](https://www.udemy.com/user/iosbfree/)
//:
//: Swift v5.7 | π *Simplified for fast learning*
//:
//: -------------------
//: ## Welcome ππΏππ»ππ½
//: Welcome to a small playground demonstrating how to use the Combine framework.
//:
//: Execute the run points π΅ below.
//:
//: Edit and experiment with the code!
//:
//: Don't stop writing code until you can see why things work the way they do.
//-----code-play-area


// #practice #practice #practice



//-----code-play-area
//:
//: -------------------
//: ## Sink - Subscribing to Events
//: The example below creates a
//:
//: π Execute the next run point to
// MARK: - π¦ Sourcecode
//: First, import the Combine framework
import Combine // π 
//: Combine uses publishers to emit values.
let myExamTestResults = [45, 75, 68, 91, 0]
//: To respond to a publishers emitted values we can apply a `sink` to respond to each change in value.
let examResultsSubscriber = myExamTestResults.publisher.sink { testResult in
    print(testResult)
}
// << π΅ Run Point
//: Wow. We recieved all of the values all at once. Let's try again.
print("\n")
let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let alphabetSubscriber = alphabet.publisher.sink { character in
    print(character)
}
// << π΅ Run Point
//: All of the values in a collection are emitted one by one
print("\n")
var occupations = ["Matthew": "iOS Developer", "James": "Doctor", "Shariah": "Scientist"]
let occupationSubscriber = occupations.publisher.sink { (name, occupation) in
    print(name + " " + occupation)
}
occupations.publisher.append(["Tony": "Teacher"])
// << π΅ Run Point
//:
//: -------------------
//: π€© **Congratulations** π
//:
//: You learned something new - hopefully. π€
//:
//: Use this playground to play about and edit the code - have some fun! It's a great opportunity to practice something new. ππΌππΎπ
//:
//: -------------------
//: [Previous](@previous) | [Next](@next)
//:
//: -------------------
//: ## Created by [SwiftSimplified.com](https://www.swiftsimplified.com)
//: [SwiftSimplified.com](https://www.swiftsimplified.com)
//:
//: This playground is intended as extra resource for students taking our Swift Simplified online course - or for anyone else learning Swift.
//:
//: ![instructor](instructor.png) Created by [Matthew Harding](https://github.com/MatthewpHarding) | [GitHub](https://github.com/MatthewpHarding)| [Website](https://www.swiftsimplified.com) | [Our Courses](https://www.udemy.com/user/iosbfree/)
//:
//: π€© *..let's live a better life, by learning Swift* π 
//:
//: ### π§π»ππ½ββοΈπ¨πΏβπΌπ©πΌβπΌπ©π»βπ»ππΌββοΈπ¨πΌβπΌππ»ββοΈππ»ββοΈπ©πΌβπ»ππΏππ½ββοΈππ½ββοΈππΏββοΈπ§πΎππΌββοΈ
