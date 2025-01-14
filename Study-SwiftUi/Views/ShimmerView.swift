//
//  ShimmerView.swift
//  Study-SwiftUi
//
//  Created by Lucas Tavares on 11/10/22.
//

//fonte: https://medium.com/@Mary_Dort/shimmer-effect-with-swiftui-cbe02946c12f

import SwiftUI

@available(iOS 13.0, *)
public struct ShimmerView: View {
    
    private struct Constants {
        static let duration: Double = 0.9
        static let minOpacity: Double = 0.25
        static let maxOpacity: Double = 1.0
        static let cornerRadius: CGFloat = 2.0
    }
    
    @State private var opacity: Double = Constants.minOpacity
    
    public init() {}
    
    public var body: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(Color.gray)
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = Constants.maxOpacity
                }
        }
    }
}

#if DEBUG
@available(iOS 13.0, *)
public struct ShimmerView_Previews: PreviewProvider {
    public static var previews: some View {
        VStack {
            ShimmerView()
                .frame(width: 100, height: 100)
            
            ShimmerView()
                .frame(height: 20)
            
            ShimmerView()
                .frame(height: 20)
            
            ShimmerView()
                .frame(height: 100)
            
            ShimmerView()
                .frame(height: 50)
            
            ShimmerView()
                .frame(height: 20)
            
            ShimmerView()
                .frame(height: 100)
            
            ShimmerView()
                .frame(height: 50)
            
            ShimmerView()
                .frame(height: 20)
        }
        .padding()
    }
}
#endif
