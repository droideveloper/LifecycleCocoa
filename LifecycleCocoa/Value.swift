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
  
  private var value: D?
  
  init(_ value: D? = nil) {
    self.value = value
  }
    
  func observe(_ lifecycleOwner: LifecycleOwner) {
    
  }
}
