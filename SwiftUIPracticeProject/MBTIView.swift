//
//  MBTIView.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/2/24.
//

import SwiftUI

struct MBTI: Hashable {
    let title: String
    let index: Int
}

struct MBTIView: View {
    @State private var nickname = ""
    @State private var selectedIndex = Set<Int>()
    
    private let item1 = [
        MBTI(title: "E", index: 0),
        MBTI(title: "S", index: 1),
        MBTI(title: "T", index: 2),
        MBTI(title: "J", index: 3)
        ]
    private let item2 = [
        MBTI(title: "I", index: 4),
        MBTI(title: "N", index: 5),
        MBTI(title: "F", index: 6),
        MBTI(title: "P", index: 7),
    ]
//
//    private lazy var item1 = Array(mbti.prefix(4))
//    private lazy var item2 = Array(mbti.suffix(4))
    
    let columns = [
        GridItem(.adaptive(minimum: 50))
    ]
    
    var body: some View {
        VStack {
//            ProfileImage()
            NavigationLink {
                ProfileImageSelectView()
            } label: {
                ProfileImageView(image: Image(uiImage: UIImage.profile0))
            }

            
            TextField("닉네임을 입력해주세요 :)", text: $nickname)
                .padding()
            
            HStack(alignment: .top) {
                Text("MBTI")
                    .font(.title)
                    .bold()
                    .padding(.leading)
                Spacer()
                Grid() {
                    GridRow {
                        ForEach(item1, id: \.self) { item in
                            MBTIButtonView(selectedIndex: $selectedIndex, item: item)
                        }
                    }
                    GridRow {
                        ForEach(item2, id: \.self) { item in
                            MBTIButtonView(selectedIndex: $selectedIndex, item: item)
                        }
                    }
                }
                .padding(.trailing)
            }
            Spacer()
            NavigationLink {
                CompleteView()
            } label: {
               BottomButtonView(title: "완료")
            }

        }
        .navigationTitle("PROFILE SETTING")
    }
    

}

struct ProfileImageView: View {
    let image: Image
    var body: some View {
        image
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(.circle)
            .overlay(Circle().stroke(.blue, lineWidth: 3))
    }
}

struct MBTIButtonView: View {
    @Binding var selectedIndex: Set<Int>
    let item: MBTI
    var body: some View {
        Button(action: {
            if selectedIndex.contains(item.index) {
                selectedIndex.remove(item.index)
            }
            else {
                selectedIndex.insert(item.index)
                selectedIndex.remove(item.index >= 4 ? item.index - 4 : item.index + 4)
            }
        }, label: {
            Text(item.title)
                .frame(minWidth: 50, minHeight: 50)
                .background(selectedIndex.contains(item.index) ? .blue : .gray)
                .foregroundStyle(selectedIndex.contains(item.index) ? .white : .black)
                .clipShape(.circle)
        })
    }
}

#Preview {
    MBTIView()
}
