//
//  ContentView.swift
//  WeatherApp
//
//  Created by Putut Yusri Bahtiar on 06/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    @State var date = 17
    
    var body: some View {
        NavigationView {
            ZStack {
                if date == 17 {
                    LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom)
                } else if date == 18 {
                    LinearGradient(colors: [.black, .white], startPoint: .top, endPoint: .bottom)
                } else {
                    LinearGradient(colors: [.orange, .white], startPoint: .top, endPoint: .bottom)
                }
                
                VStack {
                    HStack {
                        Text("\(viewModel.name),")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(viewModel.country)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image(systemName: "location.fill")
                            .foregroundColor(.white)
                        Group {
                            Spacer()
                        }
                        VStack(alignment: .trailing) {
                            Text("Tuesday 17")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            HStack(alignment: .bottom) {
                                Text("09:41 AM")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    Group {
                        Spacer()
                    }
                    
                    Image(systemName: "cloud.fog")
                        .font(.system(size: 100))
                    Spacer()
                    HStack {
                        Text(viewModel.temp)
                            .font(.system(size: 60, weight: .bold))
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(viewModel.title)
                                .multilineTextAlignment(.trailing)
                                .font(.system(size: 24, weight: .semibold))
                            Text(viewModel.description)
                                .font(.system(size: 14))
                        }
                    }
                    .padding(.horizontal, 50)
                    
                    Group {
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
                .padding(.top, 50)
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
