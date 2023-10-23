//
//  TodayViewModel.swift
//  App219
//
//  Created by IGOR on 17/10/2023.
//

import SwiftUI
import Alamofire

final class TodayViewModel: ObservableObject {
    
    @AppStorage("SF") var SF: Int = 0
    @AppStorage("UF") var UF: Int = 0
    @AppStorage("TF") var TF: Int = 0
    @AppStorage("NR") var NR: Int = 0
    @AppStorage("RA") var RA: Int = 0
    
    @Published var isLoading: Bool = false
    @Published var isAdd: Bool = false
    
    @Published var news: [NewsItem] = []
    
    @Published var isDetail: Bool = false
    @Published var selectedNews: NewsItem?
    
    @AppStorage("readed") var readed: Int = 0
    
    func getNews() {
        
        isLoading = true
        
        self.fetchNews { result in
            
            switch result {
                
            case .success(let success):
                
                self.news = success.results
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchNews(completion: @escaping (Result<NewsModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "8259602d-feac-40b1-982e-269b989fd408",
        ]
        
        let request = AF.request("https://kiorastik.space/api/v2/news", method: .get, parameters: params)
        
        request.responseDecodable(of: NewsModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
    
    @AppStorage("like_items") var like_items: [String] = []
    @AppStorage("dislike_items") var dislike_items: [String] = []
    @AppStorage("archive_items") var archive_items: [String] = []
    
    func isHas(model: NewsItem, type: FavoritesTypeN) -> Bool {
        
        switch type {
        case .like:
            return like_items.contains(model.resultTitle ?? "")
        case .dislike:
            return dislike_items.contains(model.resultTitle ?? "")
        case .archive:
            return archive_items.contains(model.resultTitle ?? "")
        }
    }
    
    func favoritesManager(model: NewsItem, type: FavoritesTypeN) {
        
        switch type {
            
        case .like:
            if like_items.contains(model.resultTitle ?? "") {
                
                if let indexer = like_items.firstIndex(of: model.resultTitle ?? "") {
                    
                    like_items.remove(at: indexer)
                }
                
            } else {
                
                like_items.append(model.resultTitle ?? "")
            }
            
        case .dislike:
            if dislike_items.contains(model.resultTitle ?? "") {
                
                if let indexer = dislike_items.firstIndex(of: model.resultTitle ?? "") {
                    
                    dislike_items.remove(at: indexer)
                }
                
            } else {
                
                dislike_items.append(model.resultTitle ?? "")
            }
            
        case .archive:
            if archive_items.contains(model.resultTitle ?? "") {
                
                if let indexer = archive_items.firstIndex(of: model.resultTitle ?? "") {
                    
                    archive_items.remove(at: indexer)
                }
                
            } else {
                
                archive_items.append(model.resultTitle ?? "")
            }
        }
    }
}
