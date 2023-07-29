//
//  CalendarViewController.swift
//  SecondWeek
//
//  Created by 황재하 on 7/25/23.
//

import UIKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("CalendarViewController", #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("CalendarViewController", #function)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("CalendarViewController", #function)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("CalendarViewController", #function)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("CalendarViewController", #function)

    }
    
    
    
    
    // 홈으로 돌아오는 버튼은 unWindToHome로 명명함
    // 다른 화면에서 TransitionViewController로 이동
    @IBAction func unWindToCalendar(_ sender: UIStoryboardSegue) {
        
    }
    



}
