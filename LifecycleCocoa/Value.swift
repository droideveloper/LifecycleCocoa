//
//  Value.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 12.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation

class Value<D> where D: Equatable {
  
  private var cache = Dictionary<Observer<D>, LifecycleOwner>()
  private let lock = SpinLock()
  
  private var value: D
  
  init(_ defaultValue: D) {
    self.value = defaultValue
  }
    
  func observe(_ lifecycleOwner: LifecycleOwner, observer: Observer<D>) {
    lock.hold()
    cache[observer] = lifecycleOwner
    lock.release()
  }
  
  func observe(_ lifecycleOwner: LifecycleOwner,_ observer: @escaping (D) -> Void) {
    observe(lifecycleOwner, observer: CallbackObserver.wrap(callback: observer))
  }
}
