//
//  finalExamAdolfoApp.swift
//  finalExamAdolfo
//
//  Created by David Romero on 2024-12-06.
//

import SwiftUI

@main
struct finalExamAdolfoApp: App {
    @StateObject var viewModel: ProvincesViewModel
    init(){
        _viewModel = StateObject(wrappedValue: ProvincesViewModel())
        
    }
    var body: some Scene {
        WindowGroup {
            ProvincesListView().environmentObject(viewModel)
        }
    }
}
