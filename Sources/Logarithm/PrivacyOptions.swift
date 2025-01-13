//
//  BaseLogger.swift
//  Logarithm
//
//  Created by Arkaprava Ghosh on 13/01/25.
//
import OSLog
import Foundation

public enum PrivacyOptions: String {
    case sensitiveDefault
    case sensitiveGeneric
    case sensitiveHashed
    case publicAccess
    case privateDefault
    case privateGeneric
    case privateHashed
}
