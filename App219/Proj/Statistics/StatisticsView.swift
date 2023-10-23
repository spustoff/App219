//
//  StatisticsView.swift
//  App219
//
//  Created by IGOR on 17/10/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    @AppStorage("SF") var SF: Int = 0
    @AppStorage("UF") var UF: Int = 0
    @AppStorage("TF") var TF: Int = 0
    @AppStorage("NR") var NR: Int = 0
    @AppStorage("RA") var RA: Int = 0

    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    Text("Statistics")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()

                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 9) {
                        
                        Image("statcircle")
                            .padding(.bottom)
                        
                        HStack {
                            
                            Text("Your total profit")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text("+\(String(format: "%.2f", Double(.random(in: 9...18))))%")
                                .foregroundColor(.green)
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        Text("+$15.765")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Successful forecast")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("\(SF)")
                                .foregroundColor(.black)
                                .font(.system(size: 26, weight: .semibold))
                            
                            Text("+$\(String(format: "%.2f", Double(.random(in: 7000...25000))))")
                                .foregroundColor(.green)
                                .font(.system(size: 12, weight: .regular))
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.leading)
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Unprofitable forecast")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("\(UF)")
                                .foregroundColor(.black)
                                .font(.system(size: 26, weight: .semibold))
                            
                            Text("+$\(String(format: "%.2f", Double(.random(in: 7000...25000))))")
                                .foregroundColor(.red)
                                .font(.system(size: 12, weight: .regular))
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Total number of your forecasts")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("\(TF)")
                                .foregroundColor(.black)
                                .font(.system(size: 26, weight: .semibold))

                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.leading)
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("News read")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("\(NR)")
                                .foregroundColor(.black)
                                .font(.system(size: 26, weight: .semibold))

                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.leading)
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Read Analyst")
                                .foregroundColor(.black.opacity(0.7))
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("\(RA)")
                                .foregroundColor(.black)
                                .font(.system(size: 26, weight: .semibold))

                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.leading)
                    })
                    .padding(.vertical, 8)
                    
                    
                }
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
