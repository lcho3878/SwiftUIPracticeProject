//
//  SearchView.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/2/24.
//

import SwiftUI

struct SearchView: View {
    @State private var text = ""
    
    let list = [
        "Michael",
        "Jessica",
        "Christopher",
        "Ashley",
        "Matthew",
        "Brittany",
        "Joshua",
        "Amanda",
        "Daniel",
        "Sarah",
        "Andrew",
        "Jennifer",
        "David",
        "Emily",
        "James",
        "Samantha",
        "Joseph",
        "Elizabeth",
        "John",
        "Megan"
    ].sorted()
    var filterList: [String] {
        return text.isEmpty ? list : list.filter { $0.contains(text) }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterList, id: \.self) { item in
                    HStack {
                        Text("\(item.first!)")
                            .padding()
                            .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                        Text(item)
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "star")
                        })
                    }
                }
            }
            .searchable(text: $text, prompt: "Search")
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
