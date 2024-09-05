//
//  CoinView.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/4/24.
//

import SwiftUI
/*
 star 연동
 push
 search
 */

struct CoinView: View {
    @State private var market: Markets = []
    @State private var name = ""
    @State private var searchText = ""
    @State private var list: Markets = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                bannerView()
                listView()
            }
            .searchable(text: $searchText, prompt: "코인 검색")
            .onSubmit(of: .search) {
                list = searchText.isEmpty ? market : market.filter {$0.koreanName.contains(searchText)}
                print(searchText)
            }
            .refreshable {
                name =  market.randomElement()?.koreanName ?? "sadf"
            }
            .navigationTitle("My Money")
        }
        .task {
            do {
                let result = try await UpbitAPI.fetchMarket()
                market = result
                list = market
            }
            catch {
                
            }
        }
        
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach($list, id: \.id) { market in
                NavigationLink {
                    NavigationLazyView(CoinDetailView(market: market))
                } label: {
                    RowView(market: market)
                }

            }
        }
    }
    
    
    
    func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.green)
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .scaleEffect(2)
                        .offset(x: -60, y: 10)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(height: 150)
                .padding()
            VStack(alignment: .leading) {
                Spacer()
                Text(name)
                    .font(.callout)
                Text("345,000,000원")
                    .font(.title)
                    .bold()
            }
            .foregroundStyle(.white)
            .padding(40)
            .frame(maxWidth: .infinity, alignment: .leading)

        }
    }
}

struct RowView: View {
    @Binding var market: Market
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(market.koreanName)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(market.market)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(market.englishName)
            Button(action: {
                market.star.toggle()
            }, label: {
                Image(systemName: market.star ? "star.fill" : "star")
            })
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 6)
    }
}

#Preview {
    CoinView()
}
