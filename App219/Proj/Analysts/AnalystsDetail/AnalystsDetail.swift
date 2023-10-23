//
//  AnalystsDetail.swift
//  App219
//
//  Created by IGOR on 16/10/2023.
//

import SwiftUI

struct AnalystsDetail: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = AnalystsViewModel()
    
    let index: AnalystsModel
    
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
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
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
                        
                            Text(index.text)
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.leading)
                        })
                        .padding()
                    }
                }
            }
        }
    }
}

struct AnalystsDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnalystsDetail(index: AnalystsModel(name: "podsaj", time_ago: "23 min ago", title: "fposdkoskgok", text: "fpsdojfpdsofsdpfjpsdjdpfojspo"))
    }
}
