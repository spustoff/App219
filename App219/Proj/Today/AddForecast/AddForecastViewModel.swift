//
//  AddForecastViewModel.swift
//  App219
//
//  Created by IGOR on 17/10/2023.
//

import SwiftUI
import Alamofire
import CoreData

final class AddForecastViewModel: ObservableObject {
    
    @Published var valuts: [String] = ["EURUSD", "USDJPY", "AUDUSD", "USDCAD", "EURJPY", "EURAUD", "EURCHF", "EURNZD"]
    @Published var selected_valut = "EURUSD"
    
    @AppStorage("successful_forecast") var successful_forecast: Int = 0
    @AppStorage("unprofitable_forecast") var unprofitable_forecast: Int = 0
    
    @Published var time: Int = 30
    @Published var time_list: [Int] = [30, 60, 120, 160]
    
    @Published var timer_sys = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var isRunned: Bool = false
    
//    @Published var current_amount: String = "500"
//    @Published var amount_list: [String] = ["500", "1000", "2000", "5000"]
    
    @Published var resultText: String = ""
    
    @Published var createPrice: String = ""
    @Published var createNote: String = ""
    @Published var createDate: Date = Date()
    @Published var createTime: Date = Date()
    
    @Published var isProfit: Bool = false
    @Published var isDetail: Bool = false
    
    func addForecast(NewsId: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "ForecastCoreModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "ForecastCoreModel", into: context) as! ForecastCoreModel
        
        trans.createPrice = Int16(createPrice) ?? 0
        trans.createDate = createDate
        trans.createTime = createTime
        trans.createNote = createNote
        trans.createNewsId = NewsId
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    public func timer_sys_start() {
        
        if time > 0 {
            
            isRunned = true
            
            resultText = ""
            
        } else {
            
            withAnimation(.spring()) {
                
                resultText = "Not enough money"
            }
        }
    }
    
    public func timer_sys_stop() {
        
        let randomInt = Int.random(in: 1...2)
        
        if randomInt == 1 {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                withAnimation(.spring()) {
                    
                    self.resultText = ""
                    self.successful_forecast += 1

                }
            }
        }
        
        if randomInt == 2 {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                withAnimation(.spring()) {
                    
                    self.resultText = ""
                    self.unprofitable_forecast += 1
  
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            withAnimation(.spring()) {
                
                self.resultText = ""
            }
        }
        
        timer_sys.upstream.connect().cancel()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            withAnimation(.spring()) {
                
                self.isRunned = false
                self.time = 30
            }
        }
    }
}
