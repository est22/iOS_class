//
//  SignInWithAppleView.swift
//  SocialLoginTest
//
//  Created by Lia An on 11/26/24.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleView: View {
    @State var userId: String?
    @State var fulllName: PersonNameComponents?
    @State var email: String?
    var body: some View {
        VStack {
            Text("Social Login Demo").font(.largeTitle).fontWeight(.bold).padding()
            if let userId {
                VStack {
                    Text("User ID: \(userId)")
                    if let email {
                        Text("Email: \(email)")
                    }
                    if let fulllName {
                        Text("Full Name: \(fulllName.familyName!) \(fulllName.givenName!)")
                    }
                    
                }
                
            }
            SignInWithAppleButton(.signIn,
                                  onRequest: configureRequest,
                                  onCompletion:handleAuthorization)
            .frame(height:50).padding(.horizontal, 20)
            
            
            SignInWithAppleButton(.signIn,
                                  onRequest: configureRequest,
                                  onCompletion:handleAuthorization)
            .frame(height:50).padding(.horizontal, 20)
            
            
            SignInWithAppleButton(.signIn,
                                  onRequest: configureRequest,
                                  onCompletion:handleAuthorization)
            .frame(height:50).padding(.horizontal, 20)

        }
    }
    
    func configureRequest(request: ASAuthorizationAppleIDRequest){
        request.requestedScopes = [.email, .fullName]
    }
    
    func handleAuthorization(result: Result<ASAuthorization, Error>){
        switch result {
        case .success(let auth):
            if let credential = auth.credential as?
                ASAuthorizationAppleIDCredential {
                self.userId = credential.user
                self.email = credential.email
//                self.fullName = credential.fullName
            }
        case .failure(let error):
            print("Failed to sign in with Apple: \(error.localizedDescription)")
            
        }
    }
}

#Preview {
    SignInWithAppleView()
}
