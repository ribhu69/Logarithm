//
//  Logarithm.swift
//  Logarithm
//
//  Created by Arkaprava Ghosh on 13/01/25.
import Foundation
import OSLog
public class Logarithm {
    private var logger: Logger
    
    /// Initializes a `Logarithm` instance with the specified subsystem and category.
    ///
    /// - Parameters:
    ///   - subSystem: A string that identifies the subsystem, typically representing the module or component of the application.
    ///                For example, "com.example.networking".
    ///   - category: A string that categorizes the logs, often used to group logs by functionality or purpose,
    ///               such as "authentication" or "database".
    ///
    /// This initializer sets up the logger with the provided subsystem and category,
    /// which are used to organize and filter logs in system diagnostic tools like Console.
    public init(subSystem: String, category: String) {
        logger = Logger(subsystem: subSystem, category: category)
    }
    
    public func log(message: String, type: LogType, privacyOption: PrivacyOptions = .privateDefault) {
        var logType : OSLogType
        switch type {
        case .debug:
            logType = .debug
        case .info:
            logType = .info
        case .error:
            logType = .error
        case .fault:
            logType = .fault
        }
        
        switch privacyOption {
        case .sensitiveDefault:
            logger.log(level: logType, "\(message,privacy: .sensitive)")
        case .sensitiveGeneric:
            logger.log(level: logType, "\(message,privacy: .sensitive(mask: .none))")
        case .sensitiveHashed:
            logger.log(level: logType, "\(message,privacy: .sensitive(mask: .hash))")
        case .publicAccess:
            logger.log(level: logType, "\(message,privacy: .public)")
        case .privateDefault:
            logger.log(level: logType, "\(message,privacy: .private)")
        case .privateGeneric:
            logger.log(level: logType, "\(message,privacy: .private(mask: .none))")
        case .privateHashed:
            logger.log(level: logType, "\(message,privacy: .private(mask: .hash))")
        }
    }
    
    public func logFault(message: String, privacyOption: PrivacyOptions = .privateDefault) {
        switch privacyOption {
        case .sensitiveDefault:
            logger.fault("\(message,privacy: .sensitive)")
        case .sensitiveGeneric:
            logger.fault("\(message,privacy: .sensitive(mask: .none))")
        case .sensitiveHashed:
            logger.fault("\(message,privacy: .sensitive(mask: .hash))")
        case .publicAccess:
            logger.fault("\(message,privacy: .public)")
        case .privateDefault:
            logger.fault( "\(message,privacy: .private)")
        case .privateGeneric:
            logger.fault("\(message,privacy: .private(mask: .none))")
        case .privateHashed:
            logger.fault("\(message,privacy: .private(mask: .hash))")
        }
    }
    
    public func logCriticalMessage(message: String, privacyOption: PrivacyOptions = .privateDefault) {
        switch privacyOption {
        case .sensitiveDefault:
            logger.critical("\(message,privacy: .sensitive)")
        case .sensitiveGeneric:
            logger.critical("\(message,privacy: .sensitive(mask: .none))")
        case .sensitiveHashed:
            logger.critical("\(message,privacy: .sensitive(mask: .hash))")
        case .publicAccess:
            logger.critical("\(message,privacy: .public)")
        case .privateDefault:
            logger.critical( "\(message,privacy: .private)")
        case .privateGeneric:
            logger.critical("\(message,privacy: .private(mask: .none))")
        case .privateHashed:
            logger.critical("\(message,privacy: .private(mask: .hash))")
        }
    }
    
    public func logNotice(message: String, privacyOption: PrivacyOptions = .privateDefault) {
        switch privacyOption {
        case .sensitiveDefault:
            logger.notice("\(message,privacy: .sensitive)")
        case .sensitiveGeneric:
            logger.notice("\(message,privacy: .sensitive(mask: .none))")
        case .sensitiveHashed:
            logger.notice("\(message,privacy: .sensitive(mask: .hash))")
        case .publicAccess:
            logger.notice("\(message,privacy: .public)")
        case .privateDefault:
            logger.notice( "\(message,privacy: .private)")
        case .privateGeneric:
            logger.notice("\(message,privacy: .private(mask: .none))")
        case .privateHashed:
            logger.notice("\(message,privacy: .private(mask: .hash))")
        }
    }

       
}
