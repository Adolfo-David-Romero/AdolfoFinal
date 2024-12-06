//
//  ProvinceComponentView.swift
//  finalExamAdolfo
//
//  Created by David Romero on 2024-12-06.
//

import SwiftUI

struct ProvinceComponentView: View {
    let title: String
    var response: String
    var body: some View {
        Section(){
            HStack{
                Text(title + ": ").fontWeight(.semibold)
                Text(response).font(.subheadline).fontWeight(.light)
            }
            
        }
    }
}

#Preview {
    ProvinceComponentView(title: "", response: "")
}
