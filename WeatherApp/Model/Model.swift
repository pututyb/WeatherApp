//
//  Model.swift
//  WeatherApp
//
//  Created by Putut Yusri Bahtiar on 06/03/23.
//

import Foundation

struct WeatherData: Codable {
    struct Weather: Codable {
        let main: String
        let description: String
        let icon: String
    }
    
    struct Main: Codable {
        let temp: Double
    }
    
    struct Sys: Codable {
        let country: String
    }
    
    let weather: [Weather]
    let main: Main
    let sys: Sys
    let name: String
}
