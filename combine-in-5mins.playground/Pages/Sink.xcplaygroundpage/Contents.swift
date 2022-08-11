/*:
![Swift](swift-logo.png)
 # Combine In 5Mins ⏰
 # Sink 👨🏻‍🏫
 ## All values go down the sink.
 */
//: First, import the Combine framework
import Combine // 👈 
//: Combine uses publishers to emit values.
let myExamTestResults = [45, 75, 68, 91, 0].publisher
//: To respond to a publishers emitted values we apply a sink to catch them all and react to their state.
//: Advice: Don't react anywhere else in the pipeline 👨‍🔧 other than at the end.
let examResultsSubscriber = myExamTestResults.sink { testResult in
    print(testResult)
}
// << 🔵 Run Point
//: Wow. We recieved all of the values all at once. Let's try again.
print("\n")
let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".publisher
let alphabetSubscriber = alphabet.sink { character in
    print(character)
}
// << 🔵 Run Point
//: All of the values in a collection are emitted one by one
print("\n")
var occupations = ["Matthew": "iOS Developer", "James": "Doctor", "Shariah": "Scientist"].publisher
let occupationSubscriber = occupations.sink { (name, occupation) in
    print(name + " " + occupation)
}
// << 🔵 Run Point
occupations.append(["Tony": "Teacher"])
// << 🔵 Run Point
//: ### Question
//: Why didn't we recieve a notification from our publisher?
//:
//: Arrays, Dictionarys and Strings are value types in Swift and are immutable (they cannot change). If we add an element to our occupations dictionary a new dictionary is created in memory. A new dictionary with a new publisher - a publisher we never subscribed to.
//:
//: The sink function also provides a completion event to be notified of errors and when the publisher stops emitting values.
//:
//: Click **next** below to continue to the next section.
//:
//: [Next](@next)
