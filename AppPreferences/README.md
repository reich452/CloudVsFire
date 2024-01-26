# Swift Property Wrappers for Preferences

This collection of property wrappers is designed to simplify the management of user preferences in Swift applications. It includes three main types:

- `DefaultPreference`: For preferences with a default value.
- `OptionalStandardPref`: For optional preferences that may or may not be present.
- `BindablePreference`: Specifically designed for SwiftUI, enabling two-way binding with user preferences.

## Installation

To use these property wrappers, simply include the source files in your Swift project. You can do this by copying the files directly into your project directory.

## Usage

### DefaultPreference

`DefaultPreference` is used to manage user preferences that have a default value.

#### Example

```swift
@DefaultPreference(key: .username, storedValue: "DefaultUser")
var username: String
```

Or set up an enum that can be used throughout the app.
This works great when you need to persist small amounts of data that come from another service.

```swift
public enum PreferenceKeys: String, StorageKey {
    case hasReachedMaxApiAttempts
}

public enum OnboardingState {
    @DefaultPreference(key: PreferenceKeys.hasReachedMaxApiAttempts, defaultValue: false)
    static var hasReachedMaxApiAttempts: Bool
}
```

#### Example 2: SwiftUI Read Only

`DefaultPreference` is primarily used for preferences with a default value. This is great for Read Only However, it is possible to capture its state for read-only purposes in SwiftUI views (See Example 3):

```swift
struct ContentView2: View {
    
   private var completed: Bool { OnboardingState.hasOnboardedCompleted }

    var body: some View {
        NavigationView {
            VStack {
                if completed {
                    Text("Welcome back!")
                    NavigationLink("Proceed to Main App", destination: MainAppView())
                } else {
                    Text("Please complete Onboarding")
                    Button("Complete Onboarding") {
                        OnboardingState.hasOnboardedCompleted = true
                    }
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

struct MainAppView: View {
    private var completed: Bool { OnboardingState.hasOnboardedCompleted }
    
    var body: some View {
        Text("Main App Content")
            .bold()
        Text("Completed Onboarding: \(completed ? "Yes" : "No")")
            .fontWeight(.light)
    }
}
```

#### Example 3: State & Binding

Using `DefaultPreference` with `@State` is not recommended because it doesn't leverage the full reactive binding pipeline. This example is included to demonstrate the limitations of `DefaultPreference` when it comes to SwiftUI writable binding and to showcase the ease of use of the `@BindablePreference` property wrapper for a more direct solution when working with SwiftUI views:

```swift
struct ContentView3: View {
    
    @State private var isCompleted: Bool
    
    init() {
        _isCompleted = State(initialValue: OnboardingState.hasOnboardedCompleted)
    }
    
    var body: some View {
        VStack {
            Text(isCompleted ? "Welcome back!" : "Welcome, new user!")
                .padding()

            Picker("Onboarding Status", selection: $isCompleted) {
                Text("Not Completed").tag(false)
                Text("Completed").tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}
```

### DefaultPreference Documentation Key Takeaways

- Initializes with a key and a default value.
- Automatically returns the stored value if no value is found in UserDefaults.
- Uses The `register(defaults:)` method is used to set up the initial values of certain user preferences (defaults).
See `UserDefaultsProvider` for further details on default values.

## OptionalStandardPref

- `OptionalStandardPref` is ideal for handling optional user preferences, especially when a preference value may or may not be present.
- Use OptionalStandardPref when you need to represent preferences that may or may not have a value set in UserDefaults.
- It's a suitable choice for scenarios where the presence or absence of a preference value is significant to your application's logic.
- This property wrapper allows you to work with optional values in a user-friendly manner.

### Example 1: Basic Use Uase

```swift
@OptionalStandardPref(key: .lastOpenedDate)
var lastOpenedDate: Date?
```

#### Example 2: Managing User Profile Pictures

Let's consider a practical example where you're building a user profile feature, and you want to allow users to set their profile picture. However, not all users may have set a profile picture yet. Here's how you can utilize @OptionalStandardPref to manage this optional preference:

```swift
struct UserProfile {
    @OptionalStandardPref(key: .profilePicture)
    var profilePicture: Data?
    
    // Other user profile properties and methods...
}
```

```swift
// Usage
var userProfile = UserProfile()

// Set the profile picture
let imageData: Data = // Load image data from a file or network
userProfile.profilePicture = imageData

// Check if a profile picture is set
if let profilePictureData = userProfile.profilePicture {
    // Display the user's profile picture
    // You can convert profilePictureData to an image and display it in your UI
} else {
    // User has not set a profile picture yet, show a placeholder or default image
}
```

In this example, UserProfile effectively manages the user's profile picture using @OptionalStandardPref. Users can set their profile picture, and the property wrapper makes it easy to determine if a profile picture is set or not, allowing you to customize your application's behavior accordingly.

### Documentation Key Takeaways

- Initializes with a key.
- Returns nil if no value is found in UserDefaults.

## BindablePreference

- `BindablePreference` harnesses SwiftUI's Binding mechanism to facilitate two-way data flow between views and preference storage.
- This property wrapper enables SwiftUI views to seamlessly bind to user preference values, automatically updating the view when these values change.
- It is designed exclusively for use with SwiftUI views.
- BindablePreference seamlessly integrates with SwiftUI, providing a bindable property that reflects user preferences and reacts to changes.

### Example 1

```swift
struct ContentView2: View {
    
    @BindablePreference(\.hasOnboarded) var hasOnboarded
    private let onboardingOptions = ["Not Completed", "Completed"]
    
    var body: some View {
        VStack {
            Text(hasOnboarded ? "Welcome back!" : "Welcome, new user!")
                .padding()

            Button("Toggle Onboarding Status") {
                hasOnboarded.toggle()
            }
            .padding()

            Picker("Onboarding Status", selection: $hasOnboarded) {
                Text("Not Completed").tag(false)
                Text("Completed").tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}
```

#### Documentation Key Takeaways

- Designed for SwiftUI.
- Provides a Binding to a user preference, allowing it to be used directly in SwiftUI views.

### Testing

The `UserDefaultsProvider` is used to make it easier to ensure the expected functionality via Unit Tests.

### Unit Test Basics

Unit tests for properties wrapped with these property wrappers follow the "3 A's" rule:

1. **Arrange**: Set up the initial state, including any necessary environment variables, dependencies, or configurations.
2. **Act**: Execute the specific action or method that triggers the property's behavior, such as setting or getting a preference value.
3. **Assert**: Verify the expected outcome by asserting that the property behaves as intended, either by directly examining its value or by checking the effect it has on your application.

## Contributing

Contributions to this project are welcome. Please ensure that any pull requests maintain the project's coding style and include appropriate tests and documentation.
