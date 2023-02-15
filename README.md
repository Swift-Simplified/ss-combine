# Combine - in a Swift Playground 🛝

[Download](https://github.com/MatthewpHarding/FREE-PLAYGROUND-combine/archive/refs/heads/main.zip) this Swift playground file to run the example given in [Xcode](https://developer.apple.com/xcode).

## This Playground Teaches 👨🏻‍🏫
How to use the Combine framework in order to publish and subscribe to events.

Combine is an event publishing framework and broadcasts messages to subscribers who want to listen to changes in data. This Swift playground demonstrates how all the basics need to use Combine.

The code to publish and subscribe will look something like this:

```Swift
// MARK: - 📦 Sourcecode

var bucketListItems = ["skydiving", "travel", "triathalon", "snowboarding"]
let subscriber = bucketListItems.publisher.sink(receiveCompletion: { completion in
    switch completion {
        case .finished:
            print("finished")
        case .failure(let error):
            print(error)
    }
}, receiveValue: { bucketListItem in
    print(bucketListItem)
})
// << 🔵 Run Point
```

## How To Download ⬇️
You can download this Swift playground by clicking the `Code` button at the top of this page. 

## How To Run 🏃🏾‍♂️
Swift playground files run within [Xcode](https://developer.apple.com/xcode) *(the tool used by developers to build apps)* and you simply need to double click the file.

## Why Learn In A Playground 🛝
Swift playgrounds allow for rapid developmemt and provide a very fast and fluid thought-to-code process. There is no time taken to compile, build or install an app to an iOS simulator. Instead, the compilation time is fast and results are viewed almost immediately. 

The term "playground" is a very fitting name for both the feature and the file extension itself. It may be safe to assume that this feature was designed for "playing around"... or "learning" as we like to call it. 😆

## Thanks for reading 📖
👨🏼‍💻
@[MatthewpHarding](https://github.com/MatthewpHarding)

*written for the `Swift Simplified` learning community*

```Swift
let myLife = [learning, coding, happiness] 
```
### 🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️
