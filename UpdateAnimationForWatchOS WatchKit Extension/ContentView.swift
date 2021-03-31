//
//  ContentView.swift
//  UpdateAnimationForWatchOS WatchKit Extension
//
//  Created by Ramill Ibragimov on 31.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.0
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                progressView(progress: $progress)
                    .padding()
                Image(systemName: "swift")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear() {
            _ = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true, block: { (timer) in
                withAnimation {
                    progress = progress + 0.1
                    if progress >  1 {
                        progress = 0
                    }
                }
            })
        }
    }
}

struct progressView: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 4, dash: [1, 2]))
                .opacity(0.3)
                .foregroundColor(.blue)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 4, dash: [1, 2]))
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 270))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
