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
  
  public static func setup() {
    
    exchange(self, #selector(viewDidLoad), #selector(lifecycle_didLoad))
    exchange(self, #selector(viewWillAppear(_:)), #selector(lifecycle_willAppear(_:)))
    exchange(self, #selector(viewDidAppear(_:)), #selector(lifecycle_didAppear(_:)))
    exchange(self, #selector(viewWillDisappear(_:)), #selector(lifecycle_willDisappear(_:)))
    exchange(self, #selector(viewDidDisappear(_:)), #selector(lifecycle_didDisappear(_:)))
  }
  
  static internal func exchange(_ klazz: AnyClass?,_ selector: Selector, _ replaceSelector: Selector) {
    guard let method = class_getInstanceMethod(klazz, selector), let replaceMethod = class_getInstanceMethod(klazz, replaceSelector) else {
      fatalError("\(selector) not available in context \(String(describing: klazz))")
    }
    
    method_exchangeImplementations(method, replaceMethod)
  }
  
  @objc internal func lifecycle_didLoad() {
    if let zelf = self as? Self {
      zelf.perform(#selector(lifecycle_didLoad))
      zelf.lifecycle = .viewDidLoad
      zelf.dispatchDidLoadSelectors()
    }
  }
  
  @objc internal func lifecycle_willAppear(_ animated: Bool) {
    if let zelf = self as? Self {
      zelf.perform(#selector(lifecycle_willAppear(_:)), with: animated)
      zelf.lifecycle = .viewWillAppear
      zelf.dispatchWillAppearSelectors(animated)
    }
  }
  
  @objc internal func lifecycle_didAppear(_ animated: Bool) {
    if let zelf = self as? Self {
      zelf.perform(#selector(lifecycle_didAppear(_:)), with: animated)
      zelf.lifecycle = .viewDidAppear
      zelf.dispatchDidAppearSelectors(animated)
    }
  }
  
  @objc internal func lifecycle_willDisappear(_ aniamted: Bool) {
    if let zelf = self as? Self {
      zelf.perform(#selector(lifecycle_willDisappear(_ :)), with: aniamted)
      zelf.lifecycle = .viewWilDisappear
      zelf.dispatchDidDisappearSelectors(aniamted)
    }
  }
  
  @objc internal func lifecycle_didDisappear(_ animated: Bool) {
    if let zelf = self as? Self {
      zelf.perform(#selector(lifecycle_didDisappear(_ :)), with: animated)
      zelf.lifecycle = .viewDidDisappear
      zelf.dispatchDidDisappearSelectors(animated)
    }
  }
  
  // we do perform selectors in here this way
  internal func dispatchDidLoadSelectors() {
    if let zelf = self as? Self {
      if let selectors = zelf.lifecycleSelectors[.viewDidLoad] {
      for selector in selectors {
          _ = zelf.perform(selector)
        }
      }
    }
  }
  
  internal func dispatchWillAppearSelectors(_ animated: Bool) {
    if let zelf = self as? Self {
      if let selectors = zelf.lifecycleSelectors[.viewWillAppear] {
        for selector in selectors {
          _ = zelf.perform(selector, with: animated)
        }
      }
    }
  }
  
  internal func dispatchDidAppearSelectors(_ animated: Bool) {
    if let zelf = self as? Self {
      if let selectors = zelf.lifecycleSelectors[.viewDidAppear] {
        for selector in selectors {
          _ = zelf.perform(selector, with: animated)
        }
      }
    }
  }
  
  internal func dispatchWillDisappearSelectors(_ animated: Bool) {
    if let zelf = self as? Self {
      if let selectors = zelf.lifecycleSelectors[.viewWilDisappear] {
        for selector in selectors {
          _ = zelf.perform(selector, with: animated)
        }
      }
    }
  }
  
  internal func dispatchDidDisappearSelectors(_ animated: Bool) {
    if let zelf = self as? Self {
      if let selectors = zelf.lifecycleSelectors[.viewDidDisappear] {
        for selector in selectors {
          _ = zelf.perform(selector, with: animated)
        }
      }
    }
  }
}
