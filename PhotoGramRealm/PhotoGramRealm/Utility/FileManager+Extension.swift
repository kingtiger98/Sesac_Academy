//
//  FileManager+Extension.swift
//  PhotoGramRealm
//
//  Created by 황재하 on 9/5/23.
//

import UIKit

extension UIViewController{

    func documentDirectoryPath() -> URL? {
        // 1. 도큐먼트 폴더 경로 찾기
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in:
                .userDomainMask).first else { return nil }
        return documentDirectory
    }
    
    
    // Document 폴더에 이미지를 저장하는 메서드
    func saveImageToDoDocument(fileName: String, image: UIImage){
        // 1. 도큐먼트 폴더 경로 찾기
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        // 2. 저장할 경로 설정(세부 경로, 이미지를 저장할 위치)
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        // 3. 이미지 변환
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        
        // 4. 이미지 저장
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("file save error", error)
        }
        
    }
    
    // Document 폴더의 이미지 찾기
    func loadImageFromDocument(fileName: String) ->UIImage {
        // 1. 도큐먼트 폴더 경로 찾기
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return UIImage(systemName: "star.fill")! }
        
        // 2. 경로 설정(세부 경로, 이미지가 저장되어 있는 위치)
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        // 3. 파일 유효성 검사 : 존재 유무를 검사함 _ fileExists 메서드 제공해줌
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)!
        } else {
            return UIImage(systemName: "star.fill")!
        }
    }
    
    // Document 폴더의 이미지 삭제하기
    func removeImageFromDocument(fileName: String){
        // 1. 도큐먼트 폴더 경로 찾기
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        // 2. 경로 설정(세부 경로, 이미지가 저장되어 있는 위치)
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        // 3. 특정 URL 제거
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print(error)
        }
         
    }
    
    
    
    
}
