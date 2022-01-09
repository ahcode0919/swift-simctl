//
//  Pair.swift
//  
//
//  Created by Aaron Hinton on 1/8/22.
//

import Foundation

public struct Pair: Decodable {
    public let watch: Device
    public let phone: Device
    public let state: String
}
