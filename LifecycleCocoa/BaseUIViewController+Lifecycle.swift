//
//  BaseUIViewController+Lifecycle.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 13.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation
import UIKit

extension BaseUIViewController {
  
  static func setup() {
    
    exchange(self, #selector(viewDidLoad), #selector(didLoad))
    exchange(self, #selector(viewWillAppear(_:)), #selector(willAppear(_:)))
    exchange(self, #selector(viewDidAppear(_:)), #selector(didAppear(_:)))
    exchange(self, #selector(viewWillDisappear(_:)), #selector(willDisappear(_:)))
    exchange(self, #selector(viewDidDisappear(_:)), #selector(didDisappear(_:)))
  }
  
  static internal func exchange(_ klazz: AnyClass?,_ selector: Selector, _ replaceSelector: Selector) {
    guard let method = class_getInstanceMethod(klazz, selector), let replaceMethod = class_getInstanceMethod(klazz, replaceSelector) else {
      fatalError("\(selector) not available in context \(String(describing: klazz))")
    }
    
    method_exchangeImplementations(method, replaceMethod)
  }
  
  @objc internal func didLoad() {
    self.didLoad()
    lifecycle = .viewDidLoad
  }
  
  @objc internal func willAppear(_ animated: Bool) {
    self.willAppear(animated)
    lifecycle = .viewWillAppear
  }
  
  @objc internal func didAppear(_ animated: Bool) {
    self.didAppear(animated)
    lifecycle = .viewDidAppear
  }
  
  @objc internal func willDisappear(_ aniamted: Bool) {
    self.willDisappear(aniamted)
    lifecycle = .viewWilDisappear
  }
  
  @objc internal func didDisappear(_ animated: Bool) {
    self.didDisappear(animated)
    lifecycle = .viewDidDisappear
  }
}
