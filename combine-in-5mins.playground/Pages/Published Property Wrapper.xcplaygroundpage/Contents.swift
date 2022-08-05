/*:
![Swift](swift-logo.png)
 # @Published Property Wrapper
 ## Properties wrapped with @Published emit changes in the willSet property observer method. 👨🏻‍🏫
 ### Question: Are we recieving notifications *before* they have been applied to the property? 🤔
 */
import Combine // 👈 import the Combine framework
import Darwin // to use the sleep() function
//: Let's think of a scenario 🤔. We are going to make the next Netflix clalled StreamCentre and we will be streaming video to a paying audience. 📺👀
//: The Combine framework is a great choice to create streams and react to the changes that are published.
enum PlayStatus {
    case idle
    case buffering
    case readyToPlay
    case playing
    case finished
}

public class VideoPlaybackManager: ObservableObject {
    @Published var status = PlayStatus.idle
    
    func play() {
        print("Setting a new status")
        videoPlaybackManager.status = .buffering
        sleep(1)
        print("\nSetting a new status")
        videoPlaybackManager.status = .readyToPlay
        sleep(1)
        print("\nSetting a new status")
        videoPlaybackManager.status = .playing
        sleep(1)
        print("\nSetting a new status")
        videoPlaybackManager.status = .finished
    }
}
//: notice the addition of the @Published property wrapper? This is what converts a property into a Combine publisher.
var subscribers: [AnyCancellable] = []
let videoPlaybackManager = VideoPlaybackManager()
videoPlaybackManager.$status
    .sink { statusAboutToBeSet in
        print("Recieved new notification from Combine")
        let currentState = videoPlaybackManager.status
        print("current status: \(currentState)")
        print("combine notified us of: \(statusAboutToBeSet)")
        
    }
    .store(in: &subscribers)
//: We have just implemented our Combine infrastructure. Let's test what happens when the status is changed.
videoPlaybackManager.play()
// << 🔵 Run Point
//: Take a look at the console 👀.
//: We are recieving the event **before** the value has been set to the stored property. This is *very* important information because we will be reacting to an event **before** it has actually happened and taken effect.
//:
//: @Published property wrappers are extremely simple to setup.
//: ⚠️ Careful
//: But be careful, because you probably *DON'T* want to react to an event **before** it has taken place.
//: #thinkAboutIt 🤔
//: Now, all we have to do is to tidy up a little
subscribers.removeAll()
//: And so, our answer is: yes 😀🙃.
//: We are recieving the change *before* it has been set to the property 👍
//: [Apple Docs - @Published](https://developer.apple.com/documentation/combine/published)
/* Important Apple Quotes 👇
 ```
 Important
 The @Published attribute is class constrained. Use it with properties of classes, not with non-class types like structures.
 ```
 ```
 When the property changes, publishing occurs in the property’s willSet block, meaning subscribers receive the new value before it’s actually set on the property.
 ```
 */
//: [Previous](@previous) | [Next](@next)