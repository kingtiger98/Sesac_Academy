//
//  Netflix2ViewModel.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 9/13/23.
//

import Foundation

class Netflix2ViewModel{
    
    var id = Obsevable("")
    var pw = Obsevable("")
    var isValid = Obsevable(false)
    
    func checkValid(){
        if id.value.count >= 8 && pw.value.count >= 4{
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(_ completionHandler: @escaping () -> Void ){
        UserDefaults.standard.set(id.value, forKey: "userID")
        UserDefaults.standard.set(pw.value, forKey: "userPW")
        
        completionHandler()
        
    }

}
