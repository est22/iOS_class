//
//  Stack.swift
//  fruitMarket
//
//  Created by Lia An on 11/17/24.
//

import SwiftUI

struct HStackView: View {
    var body: some View {
        // alignment: .top | .center | .bottom
        HStack(alignment: .top) {
            Rectangle().fill(.green).frame(width: 150, height: 150)
            Rectangle().fill(.yellow).frame(width: 150, height: 550)
        }
        
        HStack {
            Text("HStack").font(.title).foregroundColor(.blue)
            Text("은 뷰를 가로로 배열합니다")
            Text("!")
        }
        .padding()
        .border(.black)
        .font(.subheadline) // font 수식어는 자식뷰에 일괄 적용
        
        
        HStack {
            Spacer().frame(width:100) // Spacer 길이 제한
            Text("Spacer").font(.title).background(.yellow)
        }.background(.blue)
     
        Spacer()
        
        // Spacer minLength
        HStack{
            Text("Spacer MinLength").font(.title).foregroundColor(.white)
            Spacer(minLength: 100)
            Text("Spacer").font(.title).background(.yellow)
        }.background(.blue)
    }
    
   
    

    
    
}

#Preview {
    HStackView()
}
