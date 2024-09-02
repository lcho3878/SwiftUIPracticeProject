//
//  ContentView.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("HELLO, \nMY POLAROID")
                    .font(.largeTitle)
                    .bold()
                .foregroundStyle(.blue)
                Image(uiImage: UIImage.launch)
                Spacer()
                NavigationLink {
                    MBTIView()
                } label: {
                    BottomButtonView(title: "시작하기")
                }
            }
        }
        


        
    }
}

struct BottomButtonView: View {
    let title: String
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            Text(title)
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(.capsule)
            .foregroundStyle(.white)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
