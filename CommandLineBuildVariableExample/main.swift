//
//  main.swift
//  CommandLineBuildVariableExample
//
//  Created by Kevin Conner on 2022-09-28.
//

import Foundation

if let someSetting = BuildVariables.shared.someSetting {
    print("someSetting:", someSetting)
} else {
    print("someSetting is nil")
}
