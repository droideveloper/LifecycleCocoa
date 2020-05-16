//
//  Lifecycle.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 12.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation

public enum Lifecycle: Int, Comparable {
  case viewInit// for sanity check
  case viewDidLayoutSubviews // will use it and it will only used for layout subviews
  case viewDidLoad// create
  case viewWillAppear// start
  case viewDidAppear// resume
  case viewWilDisappear// pause
  case viewDidDisappear// stop
  
  public static func < (lhs: Lifecycle, rhs: Lifecycle) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
}
