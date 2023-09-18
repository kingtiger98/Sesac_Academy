//
//  SampleViewModel.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/12/23.
//

import Foundation

class SampleViewModel{
    
    var list = [User(name: "Hue", age: 23), User(name: "Jack", age: 23), User(name: "Bran", age: 20), User(name: "Kokojong", age: 20)]

    var numberOfRowInSection: Int{
        return list.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
    
    
}
