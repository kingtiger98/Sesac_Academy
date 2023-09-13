//
//  LottoViewModel.swift
//  LottoMVVM
//
//  Created by 황재하 on 9/13/23.
//

import Foundation

class LottoViewModel{
        
    var roundText: Observable<Int> = Observable(0)
    
    var firstNum: Observable<Int> = Observable(0)
    var secondNum: Observable<Int> = Observable(0)
    var thirdNum: Observable<Int> = Observable(0)
    var fourthNum: Observable<Int> = Observable(0)
    var fifthNum: Observable<Int> = Observable(0)
    var sixthNum: Observable<Int> = Observable(0)
    var bonusNum: Observable<Int> = Observable(0)
    var lottoMoney: Observable<String> = Observable("000")
    
    func fetchLottoData(round: Int){
        
        LottoAPIManager.shared.callLotto(round: round) { data in
            
            print(data)
            
            self.firstNum.value = data.drwtNo1
            self.secondNum.value = data.drwtNo2
            self.thirdNum.value = data.drwtNo3
            self.fourthNum.value = data.drwtNo4
            self.fifthNum.value = data.drwtNo5
            self.sixthNum.value = data.drwtNo6
            self.bonusNum.value = data.bnusNo
            self.lottoMoney.value = "\(self.format(for: data.firstWinamnt))"
            
        }
        
    }
    
    func format(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
    }
    
}
