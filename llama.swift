import Foundation
import SwiftUI

@available(macOS 10.15, *)
public func askLlama(_ text: String, _ translation: Binding<String>, _ otherInfo: String = "") async {
    let command = "echo 'You are a helpful assistant who follows these instructions: \"\(otherInfo)\". Do not include any formatting (besides newlines). Make sure yout sentence(s) maintain clarity. They are saying \"\(text)\"' | /usr/local/bin/ollama run \(modelName)"
    let modelName = "mistral"
    let process = Process()
    process.launchPath = "/bin/bash"
    process.arguments = ["-c", command]

    let pipe = Pipe()
    process.standardOutput = pipe

    if #available(macOS 10.15, *) {
        await withCheckedContinuation { continuation in
            DispatchQueue.global(qos: .background).async {
                process.launch()
                process.waitUntilExit()
                
                let data = pipe.fileHandleForReading.readDataToEndOfFile()
                if let output = String(data: data, encoding: .utf8) {
                    let translationResult = output.trimmingCharacters(in: .whitespacesAndNewlines)
                    DispatchQueue.main.async {
                        translation.wrappedValue = translationResult
                    }
                }
                continuation.resume()
            }
        }
    } else {
        // Fallback on earlier versions
    }
}
