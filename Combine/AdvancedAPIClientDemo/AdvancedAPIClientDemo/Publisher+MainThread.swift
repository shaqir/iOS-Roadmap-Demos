//
//  Publisher+MainThread.swift
//  AdvancedAPIClientDemo
//
//  Created by Sakir Saiyed on 2025-06-07.
//

import Combine
import Foundation

extension Publisher {
    /// Ensures the publisher emits values on the main thread.
    func receiveOnMain() -> Publishers.ReceiveOn<Self, DispatchQueue> {
        self.receive(on: DispatchQueue.main)
    }
}
