# PstReader

Swift definitions for structures, enumerations and functions defined in [MS-PST](https://docs.microsoft.com/en-us/openspecs/office_file_formats/ms-pst)

## Example Usage

Add the following line to your project's SwiftPM dependencies:
```swift
.package(url: "https://github.com/hughbe/PstReader", from: "1.0.0"),
```

```swift
import PstReader

let data = Data(contentsOfFile: "<path-to-file>.pst")!
let file = try PstFile(data: data)
print(file.rootFolder)
```
