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
  
  internal var lifecycleSelectors: Dictionary<Lifecycle, Array<Selector>> = {
    var cache = Dictionary<Lifecycle, Array<Selector>>()
    cache[.viewDidLoad] = [#selector(setUp)]
    cache[.viewWillAppear] = [#selector(attach(_:))]
    cache[.viewWilDisappear] = [#selector(detach(_:))]
    return cache
  }()
  
  /// You should call this method at #setUp() else it will not work adding .viewDidLoad lifecycle events
  /// event it will broke your code sequence
  public func register(_ lifecycle: Lifecycle, _ args: Selector...) {
    if lifecycle >= .viewWillAppear {
      var selectors: [Selector]
      if var previous = lifecycleSelectors[lifecycle] {
        previous.append(contentsOf: args)
        selectors = previous
      } else {
        selectors = args
      }
      lifecycleSelectors[lifecycle] = selectors
    } else {
      fatalError("viewDidLoad is not supported you should register your methods in #setUp() after overriding it.")
    }
  }
  
  public func lifecyle() -> Lifecycle {
    return lifecycle
  }
  
  @objc open func setUp() {
    /* called from setUp*/
  }
  
  @objc open func attach(_ animated: Bool) {
    /* called from attach */
  }
  
  @objc open func detach(_ animated: Bool) {
    /* called from detach */
  }
}
