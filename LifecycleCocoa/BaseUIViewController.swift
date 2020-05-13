//
//  BaseUIViewController.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 12.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation
import UIKit

open class BaseUIViewController: UIViewController, LifecycleOwner {
  
  internal var lifecycle: Lifecycle = .viewInit
  
  internal var lifecycleSelectors = Dictionary<Lifecycle, Array<Selector>>()
  
  public func lifecyle() -> Lifecycle {
    return lifecycle
  }
  
  open func setUp() {
    /* called from setUp*/
  }
  
  open func attach(_ animated: Bool) {
    /* called from attach */
  }
  
  open func detach(_ animated: Bool) {
    /* called from detach */
  }
}
