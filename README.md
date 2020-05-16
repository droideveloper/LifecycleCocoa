# Lifecycle (1.0.0-alpha)

Lifecycle Cocoa is a helper library that will observe values on ```Value<T>``` or ```MutableValue<T>``` which is as named mutable version of first one, and another feature of this is when you use ```AbstractViewController``` you can register callback Selectors for proper lifecycle concept it will called on expected lifecycle method.

  - Observe Values bound to change in future
  - Define proper functions or selectors for lifecycle (sequencial at the moment)

You can create your own type of Mutable type of Value by simple extending it.

### Tech

Lifecycle Cocoa uses method exchange if you know about it, it will replace proper lifecycle methods into defined ones and call original functions super. (aka swizzle)

### Install

```pod
    pod "LifecycleCocoa", :git => "https://github.com/droideveloper/LifecycleCocoa.git", :branch => "release/1.0.0-alpha"
```

### How to use

in your AppDelegate implementation.
```swift
AbstractViewController.setup()
````
then implement your controllers from AbstractViewController
```swift

class SomeController: AbstractViewController {
    
    // called when viewDidLoad lifecycle event occur
    @objc override func setUp() {
        register(.viewWilApppear, #selector(viewWillApearNext(_:)) // can take args but we send only one for now
    }
    
    @objc override func attach(_ animated: Bool) {
        // called when viewWillAppear(_ :) then
    }
    
    @objc override func detach(_ animated: Bool) {
        // callend when viewWiilDisapear(_ :)
    }
    
    @objc func viewWillAppearNext(_ animated: Bool) {
        // callend after attach(_:) invoked
    }
}
```
License
----

MIT

Copyright 2019, Fatih Şen (aka [droideveloper](https://github.com/droideveloper))

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.