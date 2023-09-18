//
//  PhotoViewModel.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/12/23.
//

import Foundation

// MVVM 활용하기 : UI적인 요소 제외하고, 다 ViewModel이 하게 만들거야
class PhotoViewModel{
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    func fetchPhoto(text: String){
        APIService.shared.searchPhoto(query: text) { photo in
            
            DispatchQueue.main.async {
                guard let photo = photo else { return }
                self.list.value = photo
            }
        }
    }
    
    var rowCount: Int{
        return list.value.results?.count ?? 0
    }

    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult{
        return list.value.results![indexPath.row]
    }
    
}
