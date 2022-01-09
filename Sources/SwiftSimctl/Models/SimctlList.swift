//
//  SimctlList.swift
//
//
//  Created by Aaron Hinton on 1/5/22.
//
import Foundation

public struct SimctlList: Decodable {
    public var deviceTypes: [DeviceType]?
    public var runtimes: [Runtime]?
    public var devices: [RuntimeIdentifier: [Device]]?
    public var pairs: [PairIdentifier: Pair]?
    
    public enum CodingKeys: String, CodingKey {
        case deviceTypes = "devicetypes"
        case runtimes
        case devices
        case pairs
    }
}
