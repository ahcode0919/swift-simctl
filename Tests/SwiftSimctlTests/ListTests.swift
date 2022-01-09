//
//  ListTests.swift
//  
//
//  Created by Aaron Hinton on 1/8/22.
//

import XCTest
@testable import SwiftSimctl

final class ListTests: XCTestCase {
    func testList() throws {
        let simctlList = try Simctl.list()
        XCTAssertNotNil(simctlList.deviceTypes)
        XCTAssertNotNil(simctlList.devices)
        XCTAssertNotNil(simctlList.pairs)
        XCTAssertNotNil(simctlList.runtimes)
    }
    
    func testListDevices() throws {
        let devices = try Simctl.listDevices()
        XCTAssertGreaterThan(devices.count, 0)
        
        let device = devices.first?.value[0]
        XCTAssertNotNil(device?.dataPath)
        XCTAssertNotNil(device?.deviceTypeIdentifier)
        XCTAssertNotNil(device?.isAvailable)
        XCTAssertNotNil(device?.logPath)
    }
    
    func testListDeviceTypes() throws {
        let deviceTypes = try Simctl.listDeviceTypes()
        XCTAssertGreaterThan(deviceTypes.count, 0)
        
        let deviceType = deviceTypes[0]
        XCTAssertNotNil(deviceType.bundlePath)
        XCTAssertNotNil(deviceType.maxRuntimeVersion)
        XCTAssertNotNil(deviceType.minRuntimeVersion)
        XCTAssertNotNil(deviceType.name)
        XCTAssertNotNil(deviceType.productFamily)
    }
    
    func testListPairs() throws {
        let pairs = try Simctl.listPairs()
        XCTAssertGreaterThan(pairs.count, 0)
        
        let pair = pairs.first?.value
        XCTAssertNotNil(pair)
    }
    
    func testListRuntimes() throws {
        let runtimes = try Simctl.listRuntimes()
        XCTAssertGreaterThan(runtimes.count, 0)
        
        let runtime = runtimes[0]
        XCTAssertGreaterThan(runtime.supportedDeviceTypes.count, 0)
    }
}
