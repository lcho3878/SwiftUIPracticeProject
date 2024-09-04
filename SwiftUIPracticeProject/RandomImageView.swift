//
//  RandomImageView.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/4/24.
//

import SwiftUI

struct RandomImageURL {
    static func randomUrl() -> [URL?]  {
        return (0..<10).map { _ in
            return URL(string: "https://picsum.photos/id/\(Int.random(in: 1...100))/200/300")
        }
    }
}

struct RandomImageView: View {
    init() {
        print("RandomImageView 다시 그려짐")
    }
    
    struct Section: Hashable {
        let id = UUID()
        let index: Int
        var title: String
    }
    
    let randomUrls = [
        RandomImageURL.randomUrl(),
        RandomImageURL.randomUrl(),
        RandomImageURL.randomUrl(),
        RandomImageURL.randomUrl(),
    ]
    
    @State private var sections = [
        Section(index: 0, title: "첫번째 섹션"),
        Section(index: 1, title: "두번째 섹션"),
        Section(index: 2, title: "세번째 섹션"),
        Section(index: 3, title: "네번째 섹션"),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                print("스크롤뷰")
            
            return ForEach($sections, id: \.id) { $section in
                SectionView(section: $section, urls: randomUrls[section.index])
                }
            }
            .navigationTitle("My Random Image")
        }
    }
    
    struct SectionView: View {
        @Binding var section: Section
        let urls: [URL?]
        
        var body: some View {
            print("sectionview")
            return VStack(alignment: .leading) {
                Text(section.title)
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0..<10) { item in
                            Navigation(section: $section, item: item, urls: urls)
                        }
                    }
                }
            }
        }
    
    }
    struct Navigation: View {
        @Binding var section: Section
        let item: Int
        let urls: [URL?]
        
        var body: some View {
            return NavigationLink {
                RandomDetailView(section: $section, url: urls[item])
            } label: {
                RandomImage(url: urls[item])
            }
        }
        
        
    }
    
}

struct RandomImage: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url)
            .frame(width: 120, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
    
    init(url: URL?) {
        self.url = url
    }
}

struct RandomDetailView: View {
    @Binding var section: RandomImageView.Section
    let url: URL?
    
    var body: some View {
        RandomImage(url: url)
        Text(section.title)
        TextField("수정하자", text: $section.title)
    }
} 

#Preview {
    RandomImageView()
}
