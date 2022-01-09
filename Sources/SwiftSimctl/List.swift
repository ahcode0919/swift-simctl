//
//  List.swift
//  
//
//  Created by Aaron Hinton on 1/8/22.
//

import Fast
import Foundation
import SwiftShell

public extension Simctl {
    
    /// Retrieve full Simctl list of Device types, Devices, Runtimes and Pairs
    /// - Throws: Parse error if unable to retrieve and process Simctl output
    /// - Returns: Full Simctl list of Device types, Devices, Runtimes and Pairs
    static func list() throws -> SimctlList {
        let output = try Shell.execute(.xcrun, args: ["simctl", "list", "--json"])
        
        guard let normalizedOutput = output?.chomp().stripMetalError(),
              let data = normalizedOutput.data(using: .utf8) else {
            throw SimctlError.parseError
        }
        
        return try JSONDecoder().decode(SimctlList.self, from: data)
    }
    
    /// Lists available simulator devices
    /// - Parameters:
    ///     - booted:
    /// - Throws: Parse error if unable to retrieve and process Simctl output
    /// - Returns: Available devices
    static func listDevices(booted: Bool = false) throws -> [RuntimeIdentifier: [Device]] {
        var args = ["simctl", "list", "devices", "-j"]
        if booted {
            args.append("booted")
        }

        let output = try Shell.execute(.xcrun, args: args)

        guard let normalizedOutput = output?.chomp().stripMetalError(),
              let data = normalizedOutput.data(using: .utf8) else {
            throw SimctlError.parseError
        }
        
        let devices = try JSONDecoder().decode(DevicesList.self, from: data)
        return devices.devices
    }
    
    /// Lists available simulator device types
    /// - Throws: Parse error if unable to retrieve and process Simctl output
    /// - Returns: Available device types
    static func listDeviceTypes() throws -> [DeviceType] {
        let output = try Shell.execute(.xcrun, args: ["simctl", "list", "devicetypes", "-j"])

        guard let normalizedOutput = output?.chomp().stripMetalError(),
              let data = normalizedOutput.data(using: .utf8) else {
            throw SimctlError.parseError
        }
        
        let deviceTypes = try JSONDecoder().decode(DeviceTypeList.self, from: data)
        return deviceTypes.deviceTypes
    }
    
    /// Lists available simulator device pairs
    /// - Throws: Parse error if unable to retrieve and process Simctl output
    /// - Returns: Available device pairs
    static func listPairs() throws -> [PairIdentifier: Pair] {
        let output = try Shell.execute(.xcrun, args: ["simctl", "list", "pairs", "-j"])

        guard let normalizedOutput = output?.chomp().stripMetalError(),
              let data = normalizedOutput.data(using: .utf8) else {
            throw SimctlError.parseError
        }
        
        let pairs = try JSONDecoder().decode(PairList.self, from: data)
        return pairs.pairs
    }
    
    /// Lists available simulator runtimes
    /// - Throws: Parse error if unable to retrieve and process Simctl output
    /// - Returns: Available runtimes
    static func listRuntimes() throws -> [Runtime] {
        let output = try Shell.execute(.xcrun, args: ["simctl", "list", "runtimes", "-j"])

        guard let normalizedOutput = output?.chomp().stripMetalError(),
              let data = normalizedOutput.data(using: .utf8) else {
            throw SimctlError.parseError
        }

        let runtimes = try JSONDecoder().decode(RuntimeList.self, from: data)
        return runtimes.runtimes
    }
}
