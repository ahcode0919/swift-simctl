//
//  Runtime.swift
//  
//
//  Created by Aaron Hinton on 1/8/22.
//

import Foundation

public struct Runtime: Decodable {
    public let buildVersion: String
    public let bundlePath: URL
    public let identifier: String // "com.apple.CoreSimulator.SimRuntime.iOS-14-5"
    public let isAvailable: Bool
    public let name: String
    public let runtimeRoot: URL
    public let supportedDeviceTypes: [DeviceType]
    public let version: String
    
    public enum CodingKeys: String, CodingKey {
        case buildVersion = "buildversion"
        case bundlePath
        case identifier
        case isAvailable
        case name
        case runtimeRoot
        case supportedDeviceTypes
        case version
    }
}
