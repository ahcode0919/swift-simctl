//
//  PairList.swift
//  
//
//  Created by Aaron Hinton on 1/8/22.
//

import Foundation

struct PairList: Decodable {
    let pairs: [PairIdentifier: Pair]
}
