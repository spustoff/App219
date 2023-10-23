//
//  AnalystsArchive.swift
//  App219
//
//  Created by IGOR on 16/10/2023.
//

import SwiftUI

struct AnalystsArchive: View {
    
    @StateObject var viewModel = AnalystsViewModel()
    
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
                
                if viewModel.analysts_list.filter{viewModel.archive_items.contains($0.title)}.isEmpty {
                    
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
                            
                            ForEach(viewModel.analysts_list.filter{viewModel.archive_items.contains($0.title)}) { index in
                                
                                NavigationLink(destination: {
                                    
                                    AnalystsDetail(index: index)
                                        .navigationBarBackButtonHidden()
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 15, content: {
                                        
                                        HStack {
                                            
                                            Circle()
                                                .fill(.gray.opacity(0.2))
                                                .frame(width: 41, height: 41)
                                                .overlay (
                                                
                                                    Image(systemName: "camera.fill")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 13, weight: .regular))
                                                )
                                            
                                            VStack(alignment: .leading, spacing: 3, content: {
                                                
                                                Text(index.name)
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                
                                                Text(index.time_ago)
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 11, weight: .regular))
                                            })
                                        }
                                        
                                        Text(index.title)
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .medium))
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(2)
                                        
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
                                    })
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.08)))
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

struct AnalystsArchive_Previews: PreviewProvider {
    static var previews: some View {
        AnalystsArchive()
    }
}
