//
//  CategoryView.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/5/24.
//

import SwiftUI

struct CategoryView: View {
    let item = ["SF", "가족", "스릴러"]
    
    struct Category: Identifiable {
        let id = UUID()
        let name: String
        let count: Int
    }
    
    @State private var searchText = ""
    @State private var list: [Category] = [

    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(list, id: \.id) { item in
                    HStack {
                        Image(systemName: "person")
                        Text("\(item.name)(\(item.count))")
                    }
                }
            }
                .navigationTitle("영화검색")
                .toolbar() {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            list.append(Category(name: item.randomElement()!, count: .random(in: 1...100)))
                        }, label: {
                            Text("추가")
                        })
                    }
                }
        }
        .searchable(text: $searchText, prompt: "영화를 검색해보세요.")
        
    }
}

#Preview {
    CategoryView()
}
