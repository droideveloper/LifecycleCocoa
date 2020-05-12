//
//  LifecycleOwner.swift
//  LifecycleCocoa
//
//  Created by Fatih Sen on 12.05.2020.
//  Copyright © 2020 Fatih Sen. All rights reserved.
//

import Foundation

public protocol LifecycleOwner: class {
  
  func lifecyle() -> Lifecycle
}
