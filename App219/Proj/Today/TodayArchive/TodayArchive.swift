//
//  TodayArchive.swift
//  App219
//
//  Created by IGOR on 17/10/2023.
//

import SwiftUI

struct TodayArchive: View {
    
    @StateObject var viewModel = TodayViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(.blue)
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    
                    Spacer()
                }
                .padding([.horizontal, .top])
                
                Text("Archive")
                    .foregroundColor(.black)
                    .font(.system(size: 31, weight: .semibold))
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .bottom])
                
                if viewModel.news.filter{viewModel.archive_items.contains($0.resultTitle ?? "")}.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.blue)
                            .font(.system(size: 23, weight: .semibold))
                            .padding(.bottom, 10)
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                        
                        Text("You don't have any archived analysts")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    .padding()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.news.filter{viewModel.archive_items.contains($0.resultTitle ?? "")}, id: \.self) { index in
                                
                                NavigationLink(destination: {
                                    
                                    TodayDetail(index: index)
                                        .navigationBarBackButtonHidden()
                                    
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
                                                .padding(.top, 6)
                                                
                                                Spacer()
                                                
                                                Button(action: {}, label: {
                                                    
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
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
    }
}

struct TodayArchive_Previews: PreviewProvider {
    static var previews: some View {
        TodayArchive()
    }
}
