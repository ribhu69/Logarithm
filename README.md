# Logarithm

**Logarithm** is a general-purpose logging library built on top of the `Logger` framework. It simplifies logging setup for developers, ensuring data is logged efficiently while keeping privacy in check.

## Key Features

- **OSLog Support**: Full support for all major formats of logging provided by [OSLog](https://developer.apple.com/documentation/os/oslog).
- **Simplified Setup**: Predefined options to help you get started quickly.
- **Privacy Conscious**: Keeps your logs aligned with Apple's privacy best practices.

---

## Installation

You can integrate Logarithm into your project using [Swift Package Manager (SPM)](https://swift.org/package-manager/).

### Adding Logarithm as a Dependency

1. Open your Xcode project.
2. Go to **File > Add Packages...**.
3. In the search bar, enter:
   ```
   https://github.com/ribhu69/Logarithm
   ```
4. Select the package and choose the appropriate version.
5. Add it to your project target.

Alternatively, add the following dependency to your `Package.swift` file:

```swift
// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "YourProjectName",
    dependencies: [
        .package(url: "https://github.com/ribhu69/Logarithm", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "YourTargetName",
            dependencies: ["Logarithm"]
        )
    ]
)
```

---

## Getting Started

### Basic Usage

Here's a quick example to get you started:

```swift
import Foundation
import UIKit
import Logarithm

class MyViewController: UIViewController {

    let sensitiveLogger = Logarithm(subSystem: "com.logarithm.log", category: "sensitive")
    let analysisLogger = Logarithm(subSystem: "com.logarithm.log", category: "analysis")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the button
        let button = UIButton(type: .system)
        button.setTitle("Launch AttachX", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Add the button to the view
        view.addSubview(button)
        
        // Center the button on the screen
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonTapped() {
       
        sensitiveLogger.log(message: "Testing log debug", type: .debug)
        sensitiveLogger.log(message: "Testing error debug", type: .error)
        sensitiveLogger.logCriticalMessage(message: "Testing critical message", privacyOption: .privateHashed)
        sensitiveLogger.logNotice(message: "Testing notice message", privacyOption: .privateGeneric)
        sensitiveLogger.logFault(message: "Testing fault message", privacyOption: .privateGeneric)
        
        
        analysisLogger.log(message: "Testing log debug", type: .debug)
        analysisLogger.log(message: "Testing error debug", type: .error)
        analysisLogger.logCriticalMessage(message: "Testing critical message", privacyOption: .privateHashed)
        analysisLogger.logNotice(message: "Testing notice message", privacyOption: .privateGeneric)
        analysisLogger.logFault(message: "Testing fault message", privacyOption: .privateGeneric)
    }
}
```
## Output
<img width="783" alt="Screenshot 2025-01-13 at 11 58 25 PM" src="https://github.com/user-attachments/assets/becf845d-8c17-4a6a-9676-daf529e2e061" />

**Note:** Ensure the app is not attached to a debugger. Logs will only appear in the Console when the app runs independently.

## Contributing

Feel free to submit issues or pull requests to enhance the library. Contributions are always welcome!
---

## License

Logarithm is available under the MIT License. See the [LICENSE](https://github.com/ribhu69/Logarithm/blob/main/LICENSE) file for details.
