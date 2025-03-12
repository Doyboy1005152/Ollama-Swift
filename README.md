# Llama

## Overview
Llama is a Swift package that provides an easy way to interact with the [Ollama](https://ollama.com) AI framework. It allows users to send a text prompt and receive responses from an AI model, leveraging the local Ollama setup.

## Features
- Asynchronous text processing using `Process` in Swift.
- Supports macOS 10.15+.
- Simple integration with SwiftUI using `Binding<String>`.

## Installation

### Prerequisites
To use this package, you must have Ollama installed and configured on your macOS system.

#### 1. Install Ollama
You can install Ollama by running the following command:
```sh
curl -fsSL https://ollama.com/install.sh | sh
```

#### 2. Choose Your Model
Llama uses an AI model from Ollama. By default, it uses `mistral`, but you can change the model by modifying the `modelName` constant in `Llama.swift` to your preferred model.

If you want to use `mistral`, you can download it with:
```sh
ollama pull mistral
```

If you want to use another model, replace `mistral` with your preferred model name and install it with:
```sh
ollama pull <model_name>
```

### Adding Llama to Your Swift Package
To use Llama in your Swift project, add it as a dependency in `Package.swift`:

```swift
// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "YourProject",
    dependencies: [
        .package(url: "https://github.com/yourusername/Llama.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "YourProject",
            dependencies: ["Llama"]
        )
    ]
)
```

Then, in your Swift file:
```swift
import Llama
```

## File Structure
When setting up this package, your directory should be structured as follows:
```
Llama/
│── Sources/
│   ├── Llama/
│   │   ├── Llama.swift
│── Package.swift
```

## Usage
```swift
import SwiftUI
import Llama

@State private var response: String = ""

Task {
    await askLlama("Translate this sentence to French", $response)
}
```

## License
This project is licensed under the MIT License.

## Contributing
Pull requests are welcome! Feel free to improve and expand the package.

## Contact
For any issues or suggestions, please open an issue in the repository.

