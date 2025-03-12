import Foundation
import SwiftUI

#if os(macOS)
@available(macOS 10.15, *)
public func askLlama(_ text: String, _ translation: Binding<String>, _ otherInfo: String = "") async {
    let modelName = "mistral"
    let command = "echo 'You are a helpful assistant who follows these instructions: \"\(otherInfo)\". Do not include any formatting (besides newlines). Make sure your sentence(s) maintain clarity. They are saying \"\(text)\"' | /usr/local/bin/ollama run \(modelName)"
    
    let process = Process()
    process.launchPath = "/bin/bash"
    process.arguments = ["-c", command]

    let pipe = Pipe()
    process.standardOutput = pipe

    await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
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
}
#endif
