# Combine In 5 Mins ⏰

Learn the new Combine framework in just 5 mins! Your first interactive Combine tutorial to teach you the basics. Make sure to clone the repo!

## Sink 
Combine uses publishers to emit values.

We must subscribe to a publisher and respond to published events within a closure. The basic closure is called a sink 🚰

```Swift 
let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".publisher
let alphabetSubscriber = alphabet.sink { character in
    print(character)
}
```
Output 

```Swift 
A
B
C
D
E
//... and so on
```
## Sink Completion
The Sink function has a completion block providing a completion status; `.finished` or `.failure`

```Swift
var bucketListItems = ["skydiving", "travel", "triathalon", "snowboarding"].publisher
let subscriber = bucketListItems.sink(receiveCompletion: { completion in
    switch completion {
        case .finished:
            print("finished")
        case .failure(let error):
            print(error)
    }
}, receiveValue: { bucketListItem in
    print(bucketListItem)
})
```
Output 

```Swift 
skydiving
travel
triathalon
snowboarding
finished
```
## Published Property Wrapper
Combine contains a property wrapper converting stored properties into a publisher!

⚠️ Be careful though, as it emits values on `willSet` **not** `didSet`

```Swift
public class VideoPlaybackManager: ObservableObject {
    enum PlayStatus {
        case idle
        case buffering
        case readyToPlay
        case playing
        case finished
    }
    
    @Published var status = PlayStatus.idle
}

let videoPlaybackManager = VideoPlaybackManager()
let subscriber = videoPlaybackManager.$status
    .sink { status in
        print("Recieved new status: \(status)")
    }
```
Output 

```Swift 
Recieved new status: idle
Recieved new status: buffering
Recieved new status: readyToPlay
Recieved new status: playing
Recieved new status: finished
```

## Subjects
### PassThroughSubject Publisher
Subjects are the main publishers. 
A `PassThroughSubject` publisher simply passes values through the data stream to each subscriber.

```Swift
public class VideoPlaybackManager: ObservableObject {
    enum PlayStatus {
        case idle
        case buffering
        case readyToPlay
        case playing
        case finished
    }
    
    private(set) var status = PlayStatus.idle { didSet {
        statusPublisher.send(status)
        }
    }
    let statusPublisher = PassthroughSubject<PlayStatus, Never>() // 👈
}

let videoPlaybackManager = VideoPlaybackManager()
let subscriber = videoPlaybackManager.$status
    .sink { status in
        print("Recieved new status: \(status)")
    }
```
Output 

```Swift 
Recieved new status: idle
Recieved new status: buffering
Recieved new status: readyToPlay
Recieved new status: playing
Recieved new status: finished
```

### CurrentValueSubject Publisher
A `CurrentValueSubject` publisher behaves the same except it **also** emits the *current* value upon subscribing.

```Swift
public class VideoPlaybackManager: ObservableObject {
    enum PlayStatus {
        case idle
        case buffering
        case readyToPlay
        case playing
        case finished
    }
    
    private(set) var status = PlayStatus.idle { didSet {
        statusPublisher.send(status)
        }
    }
    let statusPublisher = CurrentValueSubject<PlayStatus, Never>(.idle) // 👈
}

let videoPlaybackManager = VideoPlaybackManager()
let subscriber = videoPlaybackManager.$status
    .sink { status in
        print("Recieved new status: \(status)")
    }
```
Output 

```Swift 
Recieved new status: idle
Recieved new status: buffering
Recieved new status: readyToPlay
Recieved new status: playing
Recieved new status: finished
```


# 🤷🏼‍♂️

Thanks 

for reading

@[MatthewpHarding](https://github.com/MatthewpHarding)

*written for the `Swift` community*

```Swift
let myLife = [learning, coding, happiness] 
```
### 🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
