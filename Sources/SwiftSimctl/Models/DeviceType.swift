//
//  DeviceType.swift
//  
//
//  Created by Aaron Hinton on 1/8/22.
//

import Foundation

public struct DeviceType: Decodable {
    public let bundlePath: String?
    public let identifier: String
    public let minRuntimeVersion: Int?
    public let maxRuntimeVersion: Int?
    public let name: String?
    public let productFamily: String?
}
