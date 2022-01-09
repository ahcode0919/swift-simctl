//
//  DeviceTypeList.swift
//  
//
//  Created by Aaron Hinton on 1/8/22.
//

import Foundation

struct DeviceTypeList: Decodable {
    let deviceTypes: [DeviceType]
    
    enum CodingKeys: String, CodingKey {
        case deviceTypes = "devicetypes"
    }
}
