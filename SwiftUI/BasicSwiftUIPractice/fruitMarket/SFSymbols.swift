//
//  SFSymbols.swift
//  fruitMarket
//
//  Created by Lia An on 11/17/24.
//

import SwiftUI

struct SFSymbols: View {
    var body: some View {

        // imageScale()로 크기 조정
        HStack(spacing:30) {
            Image(systemName: "book.fill").imageScale(.small)
            Image(systemName: "book.fill")
            Image(systemName: "book.fill").imageScale(.large)
        }.padding()
        
        // font()로 크기 조정
        HStack{
            Image(systemName: "speaker.3").font(.body)
            Image(systemName: "speaker.3").font(.title)
            Image(systemName: "speaker.3").font(.system(size: 40))
            Image(systemName: "speaker.3").imageScale(.large).font( .system(size: 40))
        }.padding()
        
        // weight()로 굵기 조정
        HStack{
            Image(systemName: "arrow.up").font(Font.title.weight(.black))
            Image(systemName: "arrow.left").font(Font.title.weight(.semibold))
            Image(systemName: "arrow.down").font(Font.title.weight(.light))
            Image(systemName: "arrow.right").font(Font.title.weight(.ultraLight))
            
        }
    }
}

#Preview {
    SFSymbols()
}
