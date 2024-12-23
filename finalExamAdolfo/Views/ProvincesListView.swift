//
//  ProvincesListView.swift
//  finalExamAdolfo
//
//  Created by David Romero on 2024-12-06.
//

import SwiftUI

struct ProvincesListView: View {
    @EnvironmentObject var vm: ProvincesViewModel
    var body: some View {
        NavigationStack{
            Form{
                if let errorMessage = vm.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    ForEach(vm.provincesList, id: \.self) { province in
                        
                        ProvinceComponentView(title: "\(province.name)",response: "\(province.description)")
                        //ProvinceComponentView(title: "Description",response: "\(province.description)")
                        
                    }
                    

                }
            }
            .navigationTitle("ProvincesListView")
        }
    }
}

#Preview {
    ProvincesListView().environmentObject(ProvincesViewModel())
}
