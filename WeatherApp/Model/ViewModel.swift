//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Putut Yusri Bahtiar on 06/03/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var title: String = "-"
    @Published var description: String = "-"
    @Published var temp: String = "-"
    @Published var name: String = "-"
    @Published var country: String = "-"
    @Published var image: Image?
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=-6.2383&lon=106.9756&appid=b9cb6a053b60d1585525c1e3b79b5a9f&units=metric") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert data to model
            do {
                let models = try JSONDecoder().decode(WeatherData.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = models.weather.first?.main ?? "No Title"
                    self.description = models.weather.first?.description ?? "No Description"
                    self.temp = "\(models.main.temp)"
                    self.name = models.name
                    self.country = models.sys.country
                }
            }
            catch {
                print("Failed")
            }
        }
        task.resume()
    }
}
