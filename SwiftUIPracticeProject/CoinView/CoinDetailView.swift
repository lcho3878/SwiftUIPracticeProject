//
//  CoinDetailView.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/4/24.
//

import SwiftUI

struct CoinDetailView: View {
    @Binding var market: Market
    
    var body: some View {
        RowView(market: $market)
    }
}

#Preview {
    CoinView()
}
