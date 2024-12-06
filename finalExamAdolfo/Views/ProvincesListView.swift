//
//  ProvincesListView.swift
//  finalExamAdolfo
//
//  Created by David Romero on 2024-12-06.
//

import SwiftUI

struct ProvincesListView: View {
    var body: some View {
        @EnvironmentObject var vm : ProvincesViewModel
        NavigationStack{
            Form{
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }.navigationTitle("ProvincesListView")
        }
    }
}

#Preview {
    ProvincesListView()
}
