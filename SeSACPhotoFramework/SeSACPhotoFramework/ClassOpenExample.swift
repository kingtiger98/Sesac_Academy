
//  ClassOpenExample.swift
//  SeSACPhotoFramework
//
//  Created by 황재하 on 8/29/23.
//

import Foundation

// 접근제어자
//    ㄴ>   open > public > internal > fileprivate > private
open class ClassOpenExample{
    
    private static func privateExample(){
        print(#function)
    }
    
    fileprivate static func fileprivateExample(){
        print(#function)
    }
    
    internal static func internalExample(){
        
    }
    
    public static func publicExample(){
        print(#function)
    }
     
}


public class ClassPublicExample{
    
    private static func privateExample(){
        print(#function)
    }
    
    fileprivate static func fileprivateExample(){
        print(#function)
    }
    
    internal static func internalExample(){
        
    }
    
    public static func publicExample(){
        print(#function)
    }
     
}

// internal과 같은 상태 
class ClassInternalExample{
    
    private static func privateExample(){
        print(#function)
    }
    
    fileprivate static func fileprivateExample(){
        print(#function)
    }
    
    internal static func internalExample(){
        
    }
    
    public static func publicExample(){
        print(#function)
    }
     
}
