//
//  InstagramPractice.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/4/24.
//

import SwiftUI

struct InstagramPractice: View {
    
    var body: some View {
        NavigationView(content: {
            ScrollView(content: {
                StroyView()
                FeedView()
            })
                .navigationTitle("Instagram")
        })
    }
    
    struct StroyView: View {
        var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach((0...11), id: \.self) { num in
                       ProfileImage(num: num)
                    }
                }
                .padding()
            }
        }
    }
    
    struct ProfileImage: View {
        let num: Int
        var body: some View {
            Image(uiImage: UIImage(named: "profile_\(num)")!)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(.circle)
                .overlay(Circle().stroke(.blue, lineWidth: 3))
           
        }
    }
    
    struct FeedView: View {
        var body: some View {
            Rectangle()
                .frame(height: 400)
        }
    }
}

#Preview {
    InstagramPractice()
}
