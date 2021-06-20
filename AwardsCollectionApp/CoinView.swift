//
//  CoinView.swift
//  AwardsCollectionApp
//
//  Created by Виталий Оранский on 20.06.2021.
//

import SwiftUI

struct CoinView: View {
    
    @State private var rotation = 1.0
    @State private var coinTuggle = false
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Button(action: buttonAction) {
                    Image(systemName:
                            coinTuggle ? "bitcoinsign.circle" : "rublesign.circle")
                        .resizable()
                        .frame(
                            width: geometry.size.width * 0.9,
                            height: geometry.size.height * 0.9
                        )
                        
                        .foregroundColor(.yellow)
                        .rotation3DEffect(
                            Angle(degrees: rotation),
                            axis: (x: 10.0, y: 30.0, z: 15.0)
                        )
                        .animation(.easeIn)
                }
                .offset(
                    CGSize(width: geometry.size.width / 20,
                           height: geometry.size.height / 20)
                )
            }
            
        }
        .frame(width: width, height: height)
        
    }
    
    private func buttonAction() {
        withAnimation {
            rotation += 360
            coinTuggle.toggle()
            
        }
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(width: 200, height: 200)
    }
}


