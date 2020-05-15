//
//  SpinLock.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 12.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation

class SpinLock: Lock {
  
  private var obj = os_unfair_lock_s()
  
  func hold() {
    if #available(iOS 10.0, *) {
      os_unfair_lock_lock(&obj)
    }
  }
  
  func release() {
    if #available(iOS 10.0, *) {
      os_unfair_lock_unlock(&obj)
    }
  }
}
