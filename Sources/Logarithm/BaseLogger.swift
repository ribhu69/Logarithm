//
//  BaseLogger.swift
//  Logarithm
//
//  Created by Arkaprava Ghosh on 13/01/25.
//
import OSLog
import Foundation

public enum LogType : String {
    case debug
    case info
    case error
    case fault
    
    func toOSLogLevel() -> OSLogType {
        switch self {
        case .debug:
            return .debug
        case .info:
            return .info
        case .error:
            return .error
        case .fault:
            return .fault
        }
    }
}
public class BaseLogger {
    private var logger: Logger
    
    /// Initializes a `BaseLogger` instance with the specified subsystem and category.
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
    
    public func log(
        level: LogType,
        message: String,
        needToGarble: Bool = false,
        includeMarkers: Bool = false,
        emojify: Bool = false
    ) {
        let logLevel = level.toOSLogLevel()
       
        
        if includeMarkers {
            var message = message
            if emojify {
                switch logLevel {
                case .debug:
                    message = "🤨 " + message
                case .info:
                    message = "😮‍💨 " + message
                case .error:
                    message = "😡 " + message
                case .fault:
                    message = "😬 " + message
                default:
                    break
                }
            }
            else {
                switch logLevel {
                case .debug:
                    message = "🦧 " + message
                case .info:
                    message = "✅ " + message
                case .error:
                    message = "❌ " + message
                case .fault:
                    message = "⚠️ " + message
                default:
                    break
                }
            }
            if needToGarble {
                logger.log(level: logLevel, "\(message,privacy: .sensitive)")
            }
            else {
                logger.log(level: logLevel, "\(message)")
            }
            
        }
        else {
            if needToGarble {
                logger.log(level: logLevel, "\(message,privacy: .sensitive)")
            }
            else {
                logger.log(level: logLevel, "\(message)")
            }
        }
    }
}
