//
//  CallbackObserver.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 12.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation

class CallbackObserver<D>: Observer<D> where D: Equatable {
  
  static func wrap(callback: @escaping (D) -> Void) -> Observer<D> {
    return CallbackObserver(callback: callback)
  }
  
  private let callback: (D) -> Void
  
  init(callback: @escaping (D) -> Void) {
    self.callback = callback
  }
  
  override func onChange(_ newValue: D) {
    callback(newValue)
  }
}
