//
//  DevicesList.swift
//  
//
//  Created by Aaron Hinton on 1/8/22.
//

import Foundation

struct DevicesList: Decodable {
     var devices: [RuntimeIdentifier: [Device]]
}
