//
//  NavigationLazyView.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/4/24.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let closure: () -> Content
    var body: some View {
        closure()
    }
    
    init(_ closure: @autoclosure @escaping () -> Content) {
        self.closure = closure
//        print("NavigationLazyView Init")
    }
}
