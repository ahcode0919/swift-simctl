//
//  File.swift
//  
//
//  Created by Aaron Hinton on 1/8/22.
//

import Foundation

extension String {
    /// Remove metal error from Simctl JSON output
    func stripMetalError() -> String? {
        guard let firstIndex = self.firstIndex(of: "{"), let lastIndex = self.lastIndex(of: "}") else {
            return nil
        }
        return String(self[firstIndex...lastIndex])
    }
}
