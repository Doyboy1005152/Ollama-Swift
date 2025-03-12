# Llama

## Overview
Llama is a Swift package that provides an easy way to interact with the [Ollama](https://ollama.com) AI framework. It allows users to send a text prompt and receive responses from an AI model, leveraging the local Ollama setup.

## Features
- Asynchronous text processing using `Process` in Swift.
- Supports macOS 10.15+.
- Simple integration with SwiftUI using `Binding<String>`.
- Customizable model and instruction parameters.

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

### Adding Llama to Your Swift Project
To use Llama as a local package dependency in your project:

1. Go to **File** → **Add Package Dependencies** in Xcode.
2. Click **Add Local**.
3. Select the folder containing the Llama package.
4. Click **Add Package**.

Then, in your Swift file, import `Llama` and use it as needed:
```swift
import SwiftUI
import Llama

@State private var response: String = ""

Task {
    await askLlama("Translate this sentence to French", $response)
}
```

### Customizing Instructions
The `askLlama` function supports an optional third parameter, `otherInfo`, which allows you to provide custom instructions to modify the AI's behavior. For example:
```swift
await askLlama("Summarize this article", $response, "Limit the response to 3 sentences.")
```
This lets you tailor the AI's response style or constraints as needed.

## License
This project is licensed under the MIT License.

## Contributing
Pull requests are welcome! Feel free to improve and expand the package.

## Contact
For any issues or suggestions, please open an issue in the repository.

