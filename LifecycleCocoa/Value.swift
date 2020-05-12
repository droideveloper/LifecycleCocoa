//
//  Value.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 12.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation

public class Value<D> where D: Equatable {
  
  private var cache = Dictionary<Observer<D>, LifecycleOwner>()
  private let lock = SpinLock()
  
  internal var value: D {
    didSet {
      dispatchDataIfChanged(value)
    }
  }
  
  init(_ defaultValue: D) {
    self.value = defaultValue
  }
    
  public func observe(_ lifecycleOwner: LifecycleOwner, observer: Observer<D>) {
    lock.hold()
    cache[observer] = lifecycleOwner
    lock.release()
  }
  
  public func observe(_ lifecycleOwner: LifecycleOwner,_ observer: @escaping (D) -> Void) {
    observe(lifecycleOwner, observer: CallbackObserver.wrap(callback: observer))
  }
  
  private func dispatchDataIfChanged(_ newValue: D) {
    lock.hold()
    cache.forEach { observer, lifecycleOwner in
      let state = lifecycleOwner.lifecyle()
      if state > .viewDidLoad && state <= .viewWilDisappear {
        observer.onChange(newValue)
      }
    }
    lock.release()
  }
}
