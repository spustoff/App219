//
//  JournaliewModel.swift
//  App219
//
//  Created by IGOR on 19/10/2023.
//

import SwiftUI
import CoreData

final class JournalViewModel: ObservableObject {

    @Published var whichAirline: String = ""
    @Published var noteJou: String = ""
    
    @Published var ifJou: String = ""
    @Published var whatJou: String = ""
    
    @Published var currencyJou: String = ""

    func addToHistory(completion: @escaping () -> (Void)) {
        
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let flight = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel
        
        flight.currencyJou = currencyJou
        flight.ifJou = ifJou
        flight.whatJou = whatJou
        flight.noteJou = noteJou

        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
  
}

