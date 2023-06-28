//
//  LaunchView.swift
//  CryptoApp
//
//  Created by Eduardo Hernandez on 27/06/23.
//

import SwiftUI

struct LaunchView: View {
    @State private var viewState = CGSize(width: 5, height: 0)
    @State private var navigateReached: Bool = false
    @State private var textOpacity = 1.0
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Image("img_transfer_worldwide")
                    .resizable()
                    .scaledToFit()
                
                Text("Crypto App")
                    .font(.system(size: 42, weight: .bold, design: .monospaced))
                
                Text("Crypto is the future of money")
                    .font(.system(size: 24, weight: .light, design: .rounded))
                
                Spacer()
                
                ZStack(alignment: .leading) {
                    NavigationLink(destination: SignInView(), isActive: $navigateReached, label: {})
                        .disabled(true)
                    
                    Text("Get started")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .opacity(textOpacity)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.black)
                            .frame(width: 70, height: 60)
                            .offset(x: viewState.width)
                            .gesture(DragGesture()
                                .onChanged { value in
                                    if !viewOutOfBounds(viewState: value.translation) {
                                        viewState = value.translation
                                    }
                                    
                                    if didReachedRange(width: viewState.width) && !navigateReached {
                                        initialValues()
                                        navigateReached = true
                                    }
                                }
                                .onEnded { value in
                                    withAnimation(.spring()) {
                                        initialValues()
                                    }
                                }
                            )
                        
                        Image(systemName: "arrow.forward")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 24, height: 24)
                            .offset(x: viewState.width)
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("AccentColor").opacity(0.9))
                        .frame(height: 75)
                        .frame(maxWidth: .infinity)
                )
                .padding(30)
            }
        }
    }
    
    func initialValues() {
        viewState = CGSize(width: 5, height: 0)
        textOpacity = 1.0
    }
    
    func viewOutOfBounds(viewState: CGSize) -> Bool {
        let initialWidth = 5.0
        return viewState.width < initialWidth ? true : false
    }
    
    func didReachedRange(width: CGFloat) -> Bool {
        let paddingWidth = 67.0
        let viewWidth = UIScreen.screenWidth - paddingWidth - paddingWidth
        let viewRange = UIScreen.screenWidth - paddingWidth
        let closedRange = viewWidth..<viewRange
        textOpacity = 100 / width
        
        return closedRange.contains(width)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
