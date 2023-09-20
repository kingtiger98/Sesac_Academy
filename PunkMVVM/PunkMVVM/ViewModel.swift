//
//  ViewModel.swift
//  PunkMVVM
//
//  Created by 황재하 on 9/21/23.
//

import Foundation

final class ViewModel{
    
    var beerData: Observable<Beer>?
    
    func request(){
        NetworkBasic.shared.requestConvertible(type: Beer.self, api: .Beers) { data in
            switch data {
            case .success(let success):
                print(success)
                self.beerData?.value = success
                print(self.beerData?.value)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}

func request(completionHandler: @escaping (Beer)->Void ){
    NetworkBasic.shared.requestConvertible(type: Beer.self, api: .Beers) { data in
        switch data {
        case .success(let success):
            completionHandler(success)
        case .failure(let failure):
            print(failure)
        }
    }
}

