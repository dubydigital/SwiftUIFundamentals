//
//  FlipCounterView.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/23/25.
//

import SwiftUI

/*
struct FlipCounterView: View {
    @State private var counter: Int = 0
    @State private var flip: Bool = false

    var body: some View {
        VStack {
            Text("\(counter)")
                .font(.system(size: 80, weight: .bold, design: .monospaced))
                .padding()
                .rotation3DEffect(
                    .degrees(flip ? 360 : 0),
                    axis: (x: 1.0, y: 0.0, z: 0.0),
                    perspective: 0.5
                )
                .animation(.easeInOut(duration: 0.5), value: flip)

            Button("Increment") {
                counter += 1
                flip.toggle()
            }
            .font(.title)
            .padding()
        }
    }
}
*/


struct FlipScoreboardView: View {
    @State private var score: Int = 5
    @State private var isFlipping = false

    var body: some View {
        VStack {
            Text("New Score")
                .font(.headline)
                .padding(.top, 20)

            FlipBoardView(number: score, isFlipping: isFlipping)
                .frame(width: 150, height: 200)

            HStack {
                Button(action: {
                    flipNumber(up: true)
                }) {
                    Image(systemName: "chevron.up.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }

                Button(action: {
                    flipNumber(up: false)
                }) {
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }
    }

    private func flipNumber(up: Bool) {
        withAnimation(.easeInOut(duration: 0.6)) {
            isFlipping = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            score = up ? (score + 1) % 10 : (score - 1 + 10) % 10
            isFlipping = false
        }
    }
}

struct FlipBoardView: View {
    let number: Int
    let isFlipping: Bool

    var body: some View {
        ZStack {
            // Static backplate showing the final number
            VStack(spacing: 0) {
                Text("\(number)")
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .frame(width: 150, height: 100)
                    .clipped()
                Text("\(number)")
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .frame(width: 150, height: 100)
                    .clipped()
            }

            // Top half flipping animation
            VStack {
                Text("\(number)")
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .frame(width: 150, height: 100)
                    .clipped()
            }
            .rotation3DEffect(.degrees(isFlipping ? -90 : 0), axis: (x: 1, y: 0, z: 0), perspective: 0.6)
            .offset(y: -50)

            // Bottom half flipping animation
            VStack {
                Text("\((number + 1) % 10)")
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .frame(width: 150, height: 100)
                    .clipped()
            }
            .rotation3DEffect(.degrees(isFlipping ? 0 : 90), axis: (x: 1, y: 0, z: 0), perspective: 0.6)
            .offset(y: 50)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}


#Preview {
//    FlipCounterView()
    FlipScoreboardView()
}
