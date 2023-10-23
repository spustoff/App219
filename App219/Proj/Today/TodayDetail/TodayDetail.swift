//
//  TodayDetail.swift
//  App219
//
//  Created by IGOR on 17/10/2023.
//

import SwiftUI

struct TodayDetail: View {
    
    @StateObject var viewModel = TodayViewModel()
    
    let index: NewsItem
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        WebPic(urlString: index.resultImage ?? "", width: .infinity, height: 250, cornerRadius: 0, isPlaceholder: true)
                        
                        VStack(alignment: .leading, content: {
                            
                            Text(index.resultDateTime ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                                .padding(.bottom, 1)
                            
                            Text(index.resultTitle ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Text(index.resultText ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack(spacing: 10) {
                                
                                Button(action: {
                                    
                                    viewModel.favoritesManager(model: index, type: .like)
                                    
                                }, label: {
                                    
                                    Image(systemName: viewModel.isHas(model: index, type: .like) ? "hand.thumbsup.fill" : "hand.thumbsup")
                                        .foregroundColor(viewModel.isHas(model: index, type: .like) ? .blue : .gray)
                                        .font(.system(size: 17, weight: .regular))
                                })
                                
                                Button(action: {
                                    
                                    viewModel.favoritesManager(model: index, type: .dislike)
                                    
                                }, label: {
                                    
                                    Image(systemName: viewModel.isHas(model: index, type: .dislike) ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                                        .foregroundColor(viewModel.isHas(model: index, type: .dislike) ? .blue : .gray)
                                        .font(.system(size: 17, weight: .regular))
                                })
                                
                                Button(action: {
                                    
                                    viewModel.favoritesManager(model: index, type: .archive)
                                    
                                }, label: {
                                    
                                    Image(systemName: viewModel.isHas(model: index, type: .archive) ? "archivebox.fill" : "archivebox")
                                        .foregroundColor(viewModel.isHas(model: index, type: .archive) ? .blue : .gray)
                                        .font(.system(size: 17, weight: .regular))
                                })
                                
                                Spacer()

                            }
                            .padding(.top, 6)
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                }
                
                Button(action: {
                    
                    viewModel.isAdd = true
                    
                }, label: {
                    
                    HStack(spacing: 5) {
                        
                        Text("+")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Forecast")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bgo")))
                })
                .padding()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddForecastView(index: "EURUSD", news: index)
                .navigationBarBackButtonHidden()
        })
    }
}
