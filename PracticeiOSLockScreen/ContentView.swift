//
//  ContentView.swift
//  PracticeiOSLockScreen
//
//  Created by Michael Grant on 8/5/20.
//  Copyright © 2020 Michael Grant. All rights reserved.
//

import SwiftUI


struct LockScreenButton: View {
    @State private var pressed = false
    @State private var activate = false
    
    
    let image: String
    var body: some View {
        Image(systemName: image)
            .font(.title)
            .frame(width: 50, height: 50)
            .background(activate ? Color.white : Color.black.opacity(pressed ? 0.8 : 0.4))
            .foregroundColor(activate ? .black : .white)
            
            .clipShape(Circle())
            .scaleEffect(pressed ? 1.5 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.7))
            .onLongPressGesture(minimumDuration: 0.4, pressing: { (bool) in
                self.pressed = bool
            }) {
                self.activate.toggle()
                self.pressed = false
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("bigsur")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: geo.size.width)
                
                Color.black.opacity(0.15)
                VStack(spacing: 0) {
                    Image(systemName: "lock.fill")
                        .font(.largeTitle)
                        .padding(.top , 60)
                    Text("9:41")
                        .font(.system(size: 92, weight: .thin))
                    
                    
                    
                    Text("August Not Friday, 2020")
                        .font(.title)
                        .offset(y: -10)
                    Spacer()
                    
                    HStack {
                        LockScreenButton(image: "flashlight.off.fill")
                        Spacer()
                        LockScreenButton(image: "camera.fill")
                    }
                    .padding([.leading, .trailing, .bottom])
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 150, height: 5)
                        .padding(.bottom, 10)
                }
                    
                .padding([.leading, .trailing])
                .foregroundColor(.white)
                
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
