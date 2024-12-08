# ShopApp

ShopApp is a Swift-based iOS application designed to provide users with a seamless shopping experience. 
It features product browsing, detail views, and efficient service integration for fetching product data. 
The project is built using SwiftUI and employs modern architectural patterns and libraries to ensure scalability, testability, and maintainability.

## Project Overview

### Features
- **Product List**: Displays products.
- **Product Details**: Shows detailed information about a selected product and functinality to add to cart.
- **Error Handling**: Provides informative error messages and retry functionality for service calls.
- **Async Data Loading**: Utilizes Swift concurrency (`async/await`) for smooth data fetching and UI updates.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/ntobekosikithi/ShopApp.git
   cd ShopApp

2. Install dependencies using CocoaPods:
   ```bash
   pod install

3. Open the workspace in Xcode:
   ```bash
   open ShopApp.xcworkspace

4. Build and run the project on a simulator or physical device.

## Architectural Decisions

- **MVVM Pattern**: The app uses the Model-View-ViewModel architecture for clear separation of concerns.
- **Dependency Injection**: The Swinject library is used for dependency injection, allowing flexible and testable service integration.
- **SwiftUI**: The UI is built using SwiftUI for declarative and modern UI development.

## Assumptions
- **Network Layer**: Assumes a RESTful API for fetching product data. The API provides data in JSON format.
- **Static Height for Product Items**: Each product item in the grid has a fixed height of 150 points for consistency.
- **Data Caching**: Data is not cached; it is fetched fresh on every app launch.|

## Library Choices
- **CocoaPods**
Why CocoaPods? CocoaPods is a robust dependency manager for Swift and Objective-C projects, ensuring easy integration and management of third-party libraries.

###  Alamofire (5.10.2)

- ****Purpose***: Simplifies HTTP networking.
- ****Why?***: Provides an elegant, chainable API for making API calls and handling responses.
- ****Usage****: Used for API requests in the app's service layer.

 ### Swinject (2.9.1)

- ****Purpose****: Enables dependency injection for improved modularity and testability.
- ****Why?****: Reduces coupling and facilitates mocking dependencies for unit testing.
- ****Usage****: Registers dependencies.

## Testing
Unit tests are supported through dedicated targets, to run unit tests switch to the test scheme:
- **ShopAppTests**: Contains unit tests for business logic.
- **ShopAppUITests**: Not implemented.

## Future Enhancements
- **Data Caching**: Implement caching to improve performance and offline capabilities.
- **Dark Mode**: Enhance UI for dark mode compatibility.
- **Analytics Integration**: Track user interactions for insights and improvements.
- **Advanced Error Handling**: Categorize and handle different error types with better user feedback.
