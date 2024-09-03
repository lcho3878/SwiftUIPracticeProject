//
//  ProfileImageSelectView.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/3/24.
//

import SwiftUI

struct ProfileImageSelectView: View {
    
    @State private var index = 0
    
    let test: [Int] = (0...11).map{ $0 }
    let columns = [GridItem(.adaptive(minimum: 100))]
//    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        VStack {
            ProfileImageView(image: Image(uiImage: UIImage.profile0))
            LazyVGrid(columns: columns) {
                ForEach(test, id: \.self) { item in
                    ProfileImage(selectedIndex: $index, index: item)
                }
            }
        }
        .navigationTitle("PROFILE SETTING")
    }
    
    struct ProfileImage: View {
        @Binding var selectedIndex: Int
        let index: Int
        var image: Image {
            return Image(uiImage: UIImage(named: "profile_\(index)")!)
        }
        var isSelected: Bool {
            return selectedIndex == index
        }
        var body: some View {
            Button(action: {
                selectedIndex = index
            }, label: {
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                    .overlay(Circle().stroke(.blue, lineWidth: isSelected ? 3 : 0))
            })
        }
    }
}

#Preview {
    ProfileImageSelectView()
}
