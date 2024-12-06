//
//  ProvincesViewModel.swift
//  finalExamAdolfo
//
//  Created by David Romero on 2024-12-06.
//  #991555778
import Foundation

@MainActor
class ProvincesViewModel : ObservableObject {
    @Published var provincesList : [Province] = []
    @Published var errorMessage: String?
    @Published var currentLink: URL?
    init (){
        getProvince()
        print("ViewModel: init() -> getProvince()")
    }
    func getProvince() {
        provincesList = [] // Clear the current list to avoid duplication
        
        let url = URL(string: "https://mohameom.dev.fast.sheridanc.on.ca/demo/provinces.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Error: \(error.localizedDescription)"
                }
                return
            }
            // Check if response is a valid HTTPURLResponse and log the status code
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
                if response.statusCode != 200 {
                    DispatchQueue.main.async {
                        self.errorMessage = "Invalid response: Status Code \(response.statusCode)"
                    }
                    return
                }
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received from server."
                }
                return
            }
            
            //For debugging
            if let rawResponse = String(data: data, encoding: .utf8) {
                print("Raw Response: \(rawResponse)")
            }
            
            do {
                let province = try JSONDecoder().decode(Provinces.self, from: data)
                DispatchQueue.main.async {
                    self.provincesList.append(contentsOf: province.provinces)
                    self.errorMessage = nil
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}


