# Swift Property Wrapper for Preferences

A dynamically linked library designed used to simplify the management of user preferences storage. It includes three main types:

- `BindablePreference`: Property wrapper. Specifically designed for SwiftUI, enabling two-way binding with user preferences.
- `PreferenceKey`: A type safe enum that holds all the apps UserDefault keys. 
- 'PreferenceStore`: Where the data is stored. 

## Installation

To use this property wrapper, simply include the source files in your Swift project. You can do this by copying the files directly into your project directory.
This makes use of SPM's dynamically linked library.


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

### Example 2
    PreferenceStore is capable of saving data outsied of a SwiftUI view. 

```
class SomeViewModel

   func nextPage() {
        if isLastPage {
            // Mark onboarding as complete in preferences
            PreferenceStore.shared.hasCompletedOnboarding = true
        } else {
            currentPage += 1
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
