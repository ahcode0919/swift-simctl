//
//  Device.swift
//
//
//  Created by Aaron Hinton on 1/5/22.
//

import Foundation

public struct Device: Decodable {
    public let dataPath: URL?
    public let logPath: URL?
    public let udid: UUID
    public let isAvailable: Bool?
    public let deviceTypeIdentifier: String?
    public let state: String
    public let name: String
}
