//
//  RandomModelView.swift
//  MVVMPractice
//
//  Created by 황재하 on 9/18/23.
//

import Foundation

class RandomModelView{
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    func fetchRandomPT(){
        
        APIService.shared.searchPhoto(query: "random") { data in
            
            DispatchQueue.main.async {
                guard let photo = data else { return }
                self.list.value = photo
            }
            
        }
        
    }
    
    var rowCnt: Int {
        return list.value.results?.count ?? 0
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult{
        return list.value.results![indexPath.row]
    }
    
    
}




