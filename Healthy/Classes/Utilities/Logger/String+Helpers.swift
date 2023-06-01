import Foundation
extension String {
    func appendLineToURL(fileURL: URL) throws {
        let data = self + "\n"
        try data.appendToURL(fileURL: fileURL)
    }
    func appendToURL(fileURL: URL) throws {
        if let data = self.data(using: String.Encoding.utf8) {
            if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
                defer {
                    fileHandle.closeFile()
                }
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
            } else {
                try data.write(to: fileURL, options: .atomic)
            }
        }
    }
}
