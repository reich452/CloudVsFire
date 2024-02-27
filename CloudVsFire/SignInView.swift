//
//  SignInView.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 2/26/24.
//

import AuthenticationServices
import Firebase
import FirebaseAuth
import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Text("Sign In To Begin")
            if authViewModel.isSignedIn {
                // User is signed in, navigate to the next part of your app
                Text("Signed In!")
            } else {
                SignInWithAppleButton(.signIn) { _ in
                    authViewModel.signInWithApple()
                } onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        print("Authorization successful.")
                    case .failure(let error):
                        print("Authorization failed: \(error)")
                    }
                }
                .signInWithAppleButtonStyle(.black)
                .frame(height: 45)
                .padding()
            }
        }
    }
}

#Preview {
    SignInView()
    .environmentObject(AuthenticationViewModel())
}

class AuthenticationViewModel: NSObject, ObservableObject {
    @Published var isSignedIn = false
    var user: User? 
    
    private var currentNonce: String?
    
    func signInWithApple() {
        // Implementation will go here
    }
    
    private func firebaseAuthentication(withAppleIDCredential credential: ASAuthorizationAppleIDCredential) {
        // Implementation will go here
    }
}
