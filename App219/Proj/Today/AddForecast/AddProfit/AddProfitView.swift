//
//  AddProfitView.swift
//  App219
//
//  Created by IGOR on 20/10/2023.
//

import SwiftUI

struct AddProfitView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel: AddForecastViewModel
    
    let index: NewsItem
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            presentationMode.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("Cancel")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 15, weight: .regular))
                            }
                            
                        })
                        
                        Spacer()
                        
                    }
                    
                    Text("Add forecast")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                    
                }
                .padding()
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Date")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                                                
                        DatePicker("Departure", selection: $viewModel.createDate, in: Date()..., displayedComponents: .date)
                            .labelsHidden()
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text("Time")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                                                
                        DatePicker("Arrival", selection: $viewModel.createTime, in: Date()..., displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))

                    }

                }
                .padding(.horizontal)
                
                HStack {
                                        
                    ZStack(alignment: .leading, content: {
                        
                        Text("Price")
                            .foregroundColor(viewModel.createPrice.isEmpty ? .gray : .black)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.createPrice.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.createPrice)
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.decimalPad)
                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                .padding(.horizontal)
                
                HStack {
                                        
                    ZStack(alignment: .leading, content: {
                        
                        Text("Note")
                            .foregroundColor(viewModel.createNote.isEmpty ? .gray : .black)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.createNote.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.createNote)
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .medium))
                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addForecast(NewsId: "\(index.resultId)", completion: {
                        
                        viewModel.isProfit = false
                        
                        viewModel.createPrice.removeAll()
                        viewModel.createNote.removeAll()
                        
                        presentationMode.wrappedValue.dismiss()
                    })
                    
                }, label: {
                    
                    Text("Create forecast")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bgo")))
                        .padding()
                })
                .opacity(viewModel.createNote.isEmpty || viewModel.createPrice.isEmpty ? 0.5 : 1)
                .disabled(viewModel.createNote.isEmpty || viewModel.createPrice.isEmpty ? true : false)
            }
        }
    }
}

struct AddProfitView_Previews: PreviewProvider {
    static var previews: some View {
        AddProfitView(viewModel: AddForecastViewModel(), index: NewsItem(resultId: 0, resultTitle: "", resultImage: "", resultMark: "", resultDateTime: "", resultText: "", resultTotalLikes: 0, resultTotalComments: 0))
    }
}
