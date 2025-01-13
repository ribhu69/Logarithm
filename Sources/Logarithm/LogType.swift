//
//  LogType.swift
//  Logarithm
//
//  Created by Arkaprava Ghosh on 14/01/25.
//
public enum LogType: Int, CaseIterable {
    case debug = 0
    case info = 1
    case error = 2
    case fault = 3

    /// A computed property to get a description or other details if needed
    var description: String {
        switch self {
        case .debug: return "Debug - Development-level information."
        case .info: return "Info - General information."
        case .error: return "Error - Recoverable issue."
        case .fault: return "Fault - Serious issue affecting functionality."
        }
    }
}
