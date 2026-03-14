# iOS Roadmap Demos

A collection of 46 focused demos and practice projects covering the iOS development roadmap — from Swift fundamentals through production architecture patterns.

Reference: [roadmap.sh/ios](https://roadmap.sh/ios?fl=1)

## Projects by Category

### SwiftUI Apps (5 projects)

| Project | Description | Key Concepts |
|---------|------------|-------------|
| **Appetizers** | Food ordering app with network layer | MVVM, URLSession, TabView, error handling |
| **WeatherSwiftUIApp** | Weather display with API integration | API calls, custom colors, location data |
| **Avatar Demo** | Profile avatar showcase | Image assets, List presentation, custom styling |
| **BookShelf Demo** | Book catalog browser | Data models, multi-size assets |
| **SwiftUI Demos** | UI component exploration | SwiftUI fundamentals |

### SwiftData (4 projects)

| Project | Description | Key Concepts |
|---------|------------|-------------|
| **WatchList** | Movie watchlist manager | @Model, enums, PageTabView, form views |
| **Paws** | Pet management app | External photo storage, edit flows, ContentUnavailableView |
| **GroceryListApp** | Shopping list with tips | SwiftData persistence, item management |
| **WishListApp** | Wish item tracker | SwiftData basics, CRUD operations |

### Networking (3 projects)

| Project | Description | Key Concepts |
|---------|------------|-------------|
| **Advanced API Client** | Generic API service architecture | Combine, async/await, DI, unit tests |
| **Alamofire Demo** | HTTP networking with Alamofire | SwiftUI integration, async patterns |
| **Background Downloads** | Large file downloader | URLSession background tasks, progress tracking |

### Combine Framework (1 project)

| Project | Description | Key Concepts |
|---------|------------|-------------|
| **Combine API Client** | Reactive data flow demo | Publishers, MainThread dispatch, loading states |

### Testing (2 projects)

| Project | Description | Key Concepts |
|---------|------------|-------------|
| **Cart XCTest** | Unit testing demo | XCTest, code coverage, test cases |
| **AsyncDemo XCTest** | Async testing | Swift Testing framework, async/await tests |

### Swift Playgrounds (31 playgrounds)

**Fundamentals (20):** Variables, Data Types, Strings, Operators, I/O, Loops, Flow Control, Optionals, OOP, Functions, Collections, Extensions, Access Control, Error Handling, Equatable, Hashable, Strong/Weak References, Generics, TypeAlias, Enums & Structs

**Collections & Algorithms (9):** Count Occurrences, Find Max/Min, Most Frequent Element, Pair Sum to Target, Remove Duplicates, Reverse Array (7 methods), Sort Without Sort, String Manipulations, Sum Even Numbers

**Type Deep Dives (2):** Enum, Struct

## Tech Stack

- **Languages:** Swift, Objective-C
- **UI:** SwiftUI, UIKit
- **Data:** SwiftData, Core Data
- **Networking:** URLSession, Alamofire, Combine
- **Testing:** XCTest, Swift Testing
- **Architecture:** MVVM, Dependency Injection
- **Concurrency:** async/await, GCD

## Requirements

- Xcode 15+
- iOS 17+ (for SwiftData projects)
- iOS 16+ (for SwiftUI projects)
- Swift 5.9+

## Usage

Each project is self-contained. Open individual `.xcodeproj` or `.xcworkspace` files in Xcode, or run playgrounds directly.

```bash
git clone https://github.com/shaqir/iOS-Roadmap-Demos.git
cd iOS-Roadmap-Demos
open <ProjectName>/<ProjectName>.xcodeproj
```

## Author

**Sakir Saiyed** — Senior iOS Engineer

## License

MIT
