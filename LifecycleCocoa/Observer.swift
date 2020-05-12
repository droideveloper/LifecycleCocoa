//
//  Observer.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 12.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation

open class Observer<D>: Hashable where D: Equatable {
  
  open func onChange(_ newValue: D) {
    // no opt
  }
  
  public func hash(into hasher: inout Hasher) {
    
  }
  
  public static func ==(lhs: Observer<D>, rhs: Observer<D>) -> Bool {
    return false
  }
}
