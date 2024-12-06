//
//  ProvincesViewModel.swift
//  finalExamAdolfo
//
//  Created by David Romero on 2024-12-06.
//  #991555778
import Foundation


class ProvincesViewModel : ObservableObject {
    @Published var provinces : [Provinces] = []
    func getProvince(){
        let url = URL(string: "https://mohameom.dev.fast.sheridanc.on.ca/demo/provinces.json")
        let task = URLSession.shared.dataTask(with: url!) { data, response , error in
            
            
            guard error == nil else {
                print("error \(String(describing: error))")
                return
            }
            
            guard let data = data else{
                print(" error data not found")
                return
            }
            do {
                let provincesResult =  try JSONDecoder().decode([Provinces].self, from: data)
                
                print("number of qouts: \(provincesResult.count)")
                DispatchQueue.main.async {
                    self.provinces = provincesResult
                }
            }catch {
                
                print("error \(error)")
            }
        }
        
        task.resume()
    }
}


