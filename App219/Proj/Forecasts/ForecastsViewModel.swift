//
//  ForecastsViewModel.swift
//  App219
//
//  Created by IGOR on 19/10/2023.
//

import SwiftUI
import CoreData

final class ForecastsViewModel: ObservableObject {

    @Published var months: [String] = ["Aug", "Sep","Oct", "Nov", "Dec"]
    @Published var current_month = "Oct"
    
    @Published var forecasts: [ForecastCoreModel] = []
    
    func fetchForecasts() {
        
        CoreDataStack.shared.modelName = "ForecastCoreModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ForecastCoreModel>(entityName: "ForecastCoreModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.forecasts = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.forecasts = []
        }
    }
}

