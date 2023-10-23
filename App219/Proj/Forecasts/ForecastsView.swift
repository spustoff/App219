//
//  ForecastsView.swift
//  App219
//
//  Created by IGOR on 19/10/2023.
//

import SwiftUI

struct ForecastsView: View {
    
    @StateObject var viewModel = ForecastsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    Text("Forecasts")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()
                    
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {

                        ForEach(viewModel.months, id: \.self) {index in
                            
                            Button(action: {
                                
                                viewModel.current_month = index
                                
                            }, label: {
                                
                                VStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .regular))
                                    
                                    Text("2023")
                                        .foregroundColor(.black.opacity(0.7))
                                        .font(.system(size: 11, weight: .regular))
                                    
                                }
                                .frame(width: 40, height: 20)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color("bgo").opacity(viewModel.current_month == index ? 1 : 0)))
                                .padding(1)
                            })
                        }
                    }
                    
                }
                .padding(.horizontal)
                
                if viewModel.forecasts.isEmpty {
                    
                    VStack(alignment: .center, spacing: 7, content: {
                        
                        Text("No forecasts")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Add new predictions by selecting a news item of interest under the 'today' tab")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.forecasts, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    HStack {
                                        
                                        Text("EURUSD")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Text("Buy")
                                            .foregroundColor(.green)
                                            .font(.system(size: 14, weight: .bold))
                                    }
                                    
                                    Text(index.createNote ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(3)
                                    
                                    Text("$\(index.createPrice)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 19, weight: .bold))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            
            viewModel.fetchForecasts()
        }
    }
}

struct ForecastsView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastsView()
    }
}
