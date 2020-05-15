//
//  MutableValue.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 12.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation

public class MutableValue<D>: Value<D> where D: Equatable {
  
  public override init(_ defaultValue: D) {
    super.init(defaultValue)
  }
  
  public func post(_ newValue: D) {
    if newValue != value {
      self.value = newValue
    }
  }
  
  public func postOnDispatcher(_ newValue: D) {
    DispatchQueue.main.async { [weak self] in
      self?.post(newValue)
    }
  }
}
