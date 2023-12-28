//
//  ContentView.swift
//  AnimatingText
//
//  Created by Pouya Sadri on 28/12/2023.
//

import SwiftUI
//MARK: - Main View
struct ContentView: View {
    var body: some View {
        AnimatedTextView()
    }
}

//MARK: - Animated Text
struct AnimatedTextView : View {
	
	// state for rotation angle
	@State private var rotationAngle : Double = 0.0
	
	var body: some View {
		ZStack{
			LinearGradient(gradient: Gradient(colors: [Color.black,Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
				.ignoresSafeArea()
			VStack{
				Spacer()
				ZStack{
					ForEach(0..<20){
						index in
						RotatingText()
							.offset(x:-100)
							.rotation3DEffect(
								Angle(degrees: rotationAngle + Double(index) * 10.0),
													  axis: (x: 0.0, y: 1.0, z: 0.0)
							)
							.opacity(1.0 - Double(index) * 0.09)
					}
				}
				.onAppear{
					withAnimation(Animation.linear(duration: 6.0).repeatForever(autoreverses: false)){
						rotationAngle = 360.0
					}
				}
				Spacer()
			}
		}
	}
}

//MARK: - Rotataing Text
struct RotatingText : View {
	var body: some View {
		ZStack{
			Text("Hello")
				.foregroundStyle(.white)
				.font(.system(size: 120))
				.fontWeight(.regular)
				.rotationEffect(.degrees(90))
				.opacity(1)
		}
	}
}

#Preview {
    ContentView()
}
