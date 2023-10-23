//
//  JournalView.swift
//  App219
//
//  Created by IGOR on 19/10/2023.
//

import SwiftUI

struct JournalView: View {
    
    @StateObject var viewModel = JournalViewModel()
    
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    Text("Journal")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()
                    
                }
                .padding()
                
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.blue)
                        .font(.system(size: 23, weight: .semibold))
                        .padding(.bottom, 10)
                    
                    Text("Empty")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                    
                    Text("You don't have any journal data")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .frame(maxHeight: .infinity, alignment: .center)
                .padding()
            }
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
