//
//  LottoViewController.swift
//  LottoMVVM
//
//  Created by 황재하 on 9/13/23.
//

import UIKit

class LottoViewController: UIViewController {

    let viewModel = LottoViewModel()
    
    @IBOutlet var roundLabel: UILabel!
    
    @IBOutlet var firstNumLabel: UILabel!
    @IBOutlet var secondNumLabel: UILabel!
    @IBOutlet var thirdNumLabel: UILabel!
    @IBOutlet var fourthNumLabel: UILabel!
    @IBOutlet var fifthNumLabel: UILabel!
    @IBOutlet var sixthNumLabel: UILabel!
    
    @IBOutlet var bonusNumLabel: UILabel!
    @IBOutlet var lottoMoneyNumLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.fetchLottoData(round: 1000)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.viewModel.fetchLottoData(round: 1080)
        }
        
        findData()
        
    }

    func findData() {
        
        viewModel.firstNum.bind { value in
            self.firstNumLabel.text = "첫 번째 번호 : \(value)"
        }
        
        viewModel.secondNum.bind { value in
            self.secondNumLabel.text = "두 번째 번호 : \(value)"
        }

        viewModel.thirdNum.bind { value in
            self.thirdNumLabel.text = "세 번째 번호 : \(value)"
        }

        viewModel.fourthNum.bind { value in
            self.fourthNumLabel.text = "네 번째 번호 : \(value)"
        }

        viewModel.fifthNum.bind { value in
            self.fifthNumLabel.text = "다섯 번째 번호 : \(value)"
        }

        viewModel.sixthNum.bind { value in
            self.sixthNumLabel.text = "여섯 번째 번호 : \(value)"
        }

        viewModel.bonusNum.bind { value in
            self.bonusNumLabel.text = "보너스 번호 : \(value)"
        }

        viewModel.lottoMoney.bind { value in
            self.lottoMoneyNumLabel.text = "총 당첨금 : \(value)원"
        }
        
    }
    
    
    
}

