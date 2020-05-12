//
//  AtomicValue.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 12.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation

public class AtomicValue<T> where T: Equatable {
  
  private let lock = SpinLock()
  
  private var atomicValue: T
  
  public var value: T {
    get {
      return atomicValue
    }
    set(newValue) {
      if newValue != atomicValue {
        lock.hold()
        atomicValue = value
        lock.release()
      }
    }
  }
  
  init(_ defaultValue: T) {
    self.atomicValue = defaultValue
  }
}
