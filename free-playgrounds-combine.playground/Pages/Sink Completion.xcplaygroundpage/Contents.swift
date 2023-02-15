/*: ![Swift](matt-harding-logo.png)
 
 */
//: # Swift Simplified
//: ## A Free Playground
//: ## Demonstrating: Combine
//: ![instructor](instructor.png) [*with Matthew Harding*](https://www.udemy.com/user/iosbfree/)
//:
//: Swift v5.7 | 🚀 *Simplified for fast learning*
//:
//: -------------------
//: # Sink Completion
//: The Sink function has is overloaded with a completion block parameter. The block is called upon successful completion or when an error has occured.
import Combine // 👈 remember to import Combine
//: The publisher will fire a completion block when all values have been published or an error has occured.
var bucketListItems = ["skydiving", "travel", "triathalon", "snowboarding"].publisher
let subscriber = bucketListItems.sink(receiveCompletion: { completion in
    switch completion {
        case .finished:
            print("→ finished")
        case .failure(let associatedValue):
            print(associatedValue)
    }
}, receiveValue: { bucketListItem in
    print(bucketListItem)
})
// << 🔵 Run Point
//: The completion block was called with a .finished value after each element in our array had been published.
//:
//: The completion enum contains two values; .finished and .failure. The .failure case has an associated value for handling errors. There's 3 different scenarios for this value; `Error`, `Never` or a custom value. `Never` is a special case, informing us that the publisher will Never fail.
//:
//: - Experiment:
//: We want to be notified when a our bucket list has new elements. Combine offers a property wrapper publisher that's not yet supported for top-level code - so let's embedd one within a class.
print("\n")

class MyBucketList {
//    enum Status {
//        case thinkingAboutIt
//        case schedulingDates
//        case inProgress
//        case completed
//    }
    
    @Published var items = ["skydiving", "travel", "triathalon", "snowboarding"]
//    @Published var status = Status.thinkingAboutIt
}

let myBucketList = MyBucketList()
let myBucketListSubscriber = myBucketList.$items.sink { completion in
    switch completion {
        case .finished:
            print("finished")
        case .failure(_): // _ means we ignore this value
            print("Will never happen")
    }
} receiveValue: { value in
    print(value)
}
// << 🔵 Run Point 1
myBucketList.items.append("marriage")
// << 🔵 Run Point 2
//: The contents of the array are now being publshed - not individual items one at a time. We're starting to see some differences of using a Combine property wrapper publisher!
//:
//: We also haven't recieved a completion block inidcating that the publisher has finished publishing. In fact, when we added a new element to our bucket list we recieved another notification. 😃
//: - Experiment:
//: Uncomment the Status enum logic and subscribe to the MyBucketList status property. Then change the status to .schedulingDates, .inProgress and .completed. Can you successfully get notified of each change?
//experiment workspace
//let bucketListStatusSubscriber = myBucketList.$status.sink { status in
//    print(status)
//}
//myBucketList.status = .schedulingDates
// << 🔵 Run Point

//: [Previous](@previous) | [Next](@next)
//:
//: -------------------
//: ## Created by [SwiftSimplified.com](https://www.swiftsimplified.com)
//: This playground is intended as extra resource for students taking our Swift Simplified online course - or for anyone else learning Swift.
//:
//: ![instructor](instructor.png) Created by [Matthew Harding](https://github.com/MatthewpHarding) | [GitHub](https://github.com/MatthewpHarding)| [Website](https://www.swiftsimplified.com) | [Our Courses](https://www.udemy.com/user/iosbfree/)
//:
//: 🤩 *..let's live a better life, by learning Swift* 🛠
//:
//: ### 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️

