//
//  KakaoLoginView.swift
//  SocialLoginTest
//
//  Created by Lia An on 11/26/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKUser

struct KakaoLoginView: View {
    var body: some View {
        Button {
            kakaoLogin()
        } label: {
            Image("kakao_login_large_wide")
                .resizable().frame(maxWidth: .infinity, maxHeight: 55).padding()
        }

    }
    
    fileprivate func fetchUserInfo() {
        UserApi.shared.me { user, error in
            if let error {
                print(error.localizedDescription)
            } else {
                if let id = user?.id {
                    print("kakao_user_id: \(id)")
                }
            }
        }
    }
    
    func kakaoLogin(){
    
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { token, error in
                if let error {
                    print(error.localizedDescription)
                } else {
                    print(token!)
                    
                    fetchUserInfo()
                    
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { token, error in
                if let error {
                    print(error.localizedDescription)
                } else {
                    print(token!)
                }
            }
        }
    }
}

#Preview {
    KakaoLoginView()
}
