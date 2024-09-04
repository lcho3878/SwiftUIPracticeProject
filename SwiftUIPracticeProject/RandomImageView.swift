//
//  RandomImageView.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/4/24.
//

import SwiftUI

struct RandomImageView: View {
    enum Section: CaseIterable{
        case movie
        case drama
        case day
        case month
        case year
        
        var sectionTitle: String {
            switch self {
            case .movie:
                "영화"
            case .drama:
                "드라마"
            case .day:
                "일간 순위"
            case .month:
                "월간 순위"
            case .year:
                "연간 순위"
            }
        }
        
        var urls: [URL?] {
            return (0..<10).map { _ in
                return URL(string: "https://picsum.photos/id/\(Int.random(in: 1...100))/200/300")
            }
        }
    }
    private let sections = Section.allCases
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(sections, id: \.self) { section in
                    SectionView(section: section)
                }
            }
                .navigationTitle("My Random Image")
        }
    }
    
    struct SectionView: View {
        let section: Section
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(section.sectionTitle)
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0..<10) { item in
                            let urls = section.urls[item]
                            return NavigationLink {
                                RandomDetailView(title: section.sectionTitle, url: urls)
                            } label: {
                                RandomImage(url: urls)
                            }
                        }
                    }
                }
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
}

struct RandomDetailView: View {
    let title: String
    let url: URL?

    var body: some View {
        RandomImage(url: url)
        Text(title)
    }
}

#Preview {
    RandomImageView()
}
