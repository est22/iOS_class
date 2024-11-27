//
//  ContentView.swift
//  SocialLoginTest
//
//  Created by Lia An on 11/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SignInWithAppleView()
            KakaoLoginView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
