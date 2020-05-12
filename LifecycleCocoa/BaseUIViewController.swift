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
  
  var lifecycle: Lifecycle = .viewInit
  
  public func lifecyle() -> Lifecycle {
    return lifecycle
  }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    lifecycle = .viewDidLoad
  }
  
  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    lifecycle = .viewWillAppear
  }
  
  open override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    lifecycle = .viewDidAppear
  }
  
  open override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    lifecycle = .viewWilDisappear
  }
  
  open override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    lifecycle = .viewDidDisappear
  }
}
