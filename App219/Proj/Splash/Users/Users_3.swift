//
//  Users_3.swift
//  App219
//
//  Created by Вячеслав on 10/23/23.
//

import SwiftUI

struct Users_3: View {
    
    let telegram: URL
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Text("Join our Telegram Channel")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("And trade with our team")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0/255, green: 174/255, blue: 237/255)))
                        .padding()
                })
            }
            .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        if isContacts == true {
                            
                            Manager()
                                .navigationBarBackButtonHidden()
                            
                        } else if isContacts == false {
                            
                            Users_5()
                                .navigationBarBackButtonHidden()
                        }
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .bold))
                            .padding(7)
                            .background(Circle().fill(Color.black.opacity(0.5)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Users_3(telegram: URL(string: "h")!, isContacts: false)
}
