//
//  TodayView.swift
//  App219
//
//  Created by IGOR on 17/10/2023.
//

import SwiftUI

struct TodayView: View {
    
    @StateObject var viewModel = TodayViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    Text("Today")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .semibold))
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AnalystsArchive()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "archivebox")
                            .foregroundColor(.gray)
                            .font(.system(size: 21, weight: .regular))
                    })
                }
                .padding()
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.news.isEmpty {
                        
                        VStack {
                            
                            Image("empty")
                            
                            Text("Empty news")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Text("No any news we have")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.news, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedNews = index
                                        viewModel.isDetail = true
                                        viewModel.NR += 1
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            WebPic(urlString: index.resultImage ?? "", width: 90, height: 90, cornerRadius: 5, isPlaceholder: true)
                                            
                                            VStack(alignment: .leading, content: {
                                                
                                                Text(index.resultDateTime ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.resultTitle ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                    .lineLimit(3)
                                                    .multilineTextAlignment(.leading)
                                                
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
                                                    
                                                    Button(action: {
                                                        
                                                        viewModel.selectedNews = index
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
                                                        .padding(.horizontal)
                                                        .padding(.vertical, 5)
                                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bgo")))
                                                    })
                                                }
                                            })
                                            
                                            Spacer()
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                    })
                                }
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .sheet(isPresented: $viewModel.isDetail, content: {

            if let index = viewModel.selectedNews {

                TodayDetail(index: index)
            }
        })
        .sheet(isPresented: $viewModel.isAdd, content: {

            if let index = viewModel.selectedNews {

                AddForecastView(index: "EURUSD", news: index)
            }
        })
        .onAppear {
            
            viewModel.getNews()
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
