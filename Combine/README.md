# AdvancedAPIClientDemoApp

A SwiftUI demo project showcasing a modern, testable, and flexible API client built using Swift's `async/await`, `Combine`, and dependency injection principles.

## 🚀 Features

- ✅ Generic APIService to decode any `Decodable` model
- ✅ Async/Await support for clean, readable networking
- ✅ Combine support for reactive programming
- ✅ URLSession abstraction for easy unit testing and mocking
- ✅ Clean SwiftUI UI for testing API calls
- ✅ JSONPlaceholder API used for dummy data

## 🧱 Architecture

- `APIService.swift`: Core logic for API calling, decoding, and error handling
- `ContentView.swift`: SwiftUI interface to trigger async and Combine API calls
- `User.swift`: Sample model used for decoding the user API response

## 📦 Dependencies

- No external dependencies; uses only Swift standard libraries

## 🧪 How to Run

1. Open Xcode
2. Create a new iOS App project using SwiftUI
3. Replace your default `ContentView.swift` with the provided one
4. Add `APIService.swift` and `User.swift` into your project
5. Run on Simulator or real device

## 🌐 API Used

- `https://jsonplaceholder.typicode.com/users/1`

Returns:

```json
{
  "id": 1,
  "name": "Leanne Graham",
  "email": "Sincere@april.biz"
}
```
