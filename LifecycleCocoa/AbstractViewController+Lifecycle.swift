//
//  BaseUIViewController+Lifecycle.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 13.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation
import UIKit

extension AbstractViewController {
  
  public static func setup() {
    
    exchange(self, #selector(viewDidLoad), #selector(didLoad))
    exchange(self, #selector(viewWillAppear(_:)), #selector(willAppear(_:)))
    exchange(self, #selector(viewDidAppear(_:)), #selector(didAppear(_:)))
    exchange(self, #selector(viewWillDisappear(_:)), #selector(willDisappear(_:)))
    exchange(self, #selector(viewDidDisappear(_:)), #selector(didDisappear(_:)))
    exchange(self, #selector(viewDidLayoutSubviews), #selector(didLayoutSubviews))
  }
  
  static internal func exchange(_ klazz: AnyClass?,_ selector: Selector, _ replaceSelector: Selector) {
    guard let method = class_getInstanceMethod(klazz, selector), let replaceMethod = class_getInstanceMethod(klazz, replaceSelector) else {
      fatalError("\(selector) not available in context \(String(describing: klazz))")
    }
    
    method_exchangeImplementations(method, replaceMethod)
  }
  
  @objc internal func didLoad() {
    if let zelf = self as? Self {
      zelf.perform(#selector(didLoad))
      zelf.lifecycle = .viewDidLoad
      zelf.dispatchDidLoadSelectors()
    }
  }
  
  @objc internal func willAppear(_ animated: Bool) {
    if let zelf = self as? Self {
      zelf.perform(#selector(willAppear(_:)), with: animated)
      zelf.lifecycle = .viewWillAppear
      zelf.dispatchWillAppearSelectors(animated)
    }
  }
  
  @objc internal func didAppear(_ animated: Bool) {
    if let zelf = self as? Self {
      zelf.perform(#selector(didAppear(_:)), with: animated)
      zelf.lifecycle = .viewDidAppear
      zelf.dispatchDidAppearSelectors(animated)
    }
  }
  
  @objc internal func willDisappear(_ aniamted: Bool) {
    if let zelf = self as? Self {
      zelf.perform(#selector(willDisappear(_ :)), with: aniamted)
      zelf.lifecycle = .viewWilDisappear
      zelf.dispatchDidDisappearSelectors(aniamted)
    }
  }
  
  @objc internal func didDisappear(_ animated: Bool) {
    if let zelf = self as? Self {
      zelf.perform(#selector(didDisappear(_ :)), with: animated)
      zelf.lifecycle = .viewDidDisappear
      zelf.dispatchDidDisappearSelectors(animated)
    }
  }
  
  @objc internal func didLayoutSubviews() {
    if let zelf = self as? Self {
      zelf.perform(#selector(didLayoutSubviews))
      zelf.dispatchDidLayoutSubviewsSelectors()
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
  
  internal func dispatchDidLayoutSubviewsSelectors() {
    if let zelf = self as? Self {
      if let selectors = zelf.lifecycleSelectors[.viewDidLayoutSubviews] {
        for selector in selectors {
          _ = zelf.perform(selector)
        }
      }
    }
  }
}
