//
//  CodableViewController.swift
//  SeSAC3Week5
//
//  Created by 황재하 on 8/16/23.
//

import UIKit
import Alamofire
import Kingfisher

// 컴파일 시 오류 타입 알 수 있음, Error 프로토콜 꼮 채택
enum ValidationError: Int, Error {
    case emptyString = 404
    case isNotInt = 401
    case insNotDate = 500
}



struct Lotto: Codable {
    let totSellamnt: Int
    let returnValue, drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
}


struct Translation: Codable {
    let message: Message
}
// MARK: - Message
struct Message: Codable {
    let service, version: String
    let result: Result
    let type: String

    enum CodingKeys: String, CodingKey {
        case service = "@service"
        case version = "@version"
        case result
        case type = "@type"
    }
}
// MARK: - Result
struct Result: Codable {
    let engineType, tarLangType, translatedText, srcLangType: String
}





class CodableViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    var resultText = "Apple"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherManager.shared.callRequestCodable { data in
            self.tempLabel.text = "\(data.main.temp)"
        } failure: {
            print("show Alert")
        }

        
        
        WeatherManager.shared.callRequestJSON { json in
            
            let temp = json["main"]["temp"].doubleValue - 273.15
            let humidity = json["main"]["humidity"].intValue
            
            self.tempLabel.text = String(describing: temp)
            self.humidityLabel.text = String(describing: humidity)
            
        }
        
        
        // fetchLottoData()
        
        // 흐름 : "안녕하세요"를 "Hello"로 번역 후 resultText에 번역한 값 "Hello"를 넣었음"
        // 그리고 resultText 값을 이용해 다시 번역을 해보고 싶음
        // 즉 네트워킹 한 값을 이용해 네트워킹을 한 번 더 하고 싶음!
        // fetchTranslateData(source: "ko", target: "en", text: "안녕하세요")
        
        // 하지만,,, resultText에 "Hello"가 아니라 기본값인 "Apple"이 그대로 있음 ㅜㅜ
        // 위의 fetchTranslateData가 끝나지도 않았는데 아래 fetchTranslateData가 시작됐기 때문임. // 똑같은 네트워킹 함수를 쓰고 있는 것도 문제임!
        // fetchTranslateData(source: "en", target: "ko", text: resultText)
        
    }
    
    func validateUserInputError(text: String) throws -> Bool {
        // 빈 칸일 경우
        guard !(text.isEmpty) else {
            print("빈 값")
            throw ValidationError.emptyString
        }
        
        // 숫자 여부
        guard Int(text) != nil else {
            print("숫자 아님")
            throw ValidationError.isNotInt
        }
        
        // 날짜 형식으로 변환이 되는지
        guard checkDateFormat(text: text) else {
            print("잘못된 날짜 형식")
            throw ValidationError.insNotDate
        }
        
        return true
    }
    
    
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        
        guard let text  = dateTextField.text else { return }
        
        do {
            let result = try validateUserInputError(text: text)
            
        } catch {
            print("ERROR")
        }
            
//        if validateUserInput(text: text) {
//            print("검색 가능. 네트워크 요청 가능")
//        } else {
//            print("검색 불가")
//        }
        
    }
    
    
    func validateUserInput(text: String) -> Bool {
        // 빈 칸일 경우
        guard !(text.isEmpty) else {
            print("빈 값")
            return false
        }
        
        // 숫자 여부
        guard Int(text) != nil else {
            print("숫자 아님")
            return false
        }
        
        // 날짜 형식으로 변환이 되는지
        guard checkDateFormat(text: text) else {
            print("잘못된 날짜 형식")
            return false
        }
        
        return true
    }
    
    func checkDateFormat(text: String) -> Bool {
        
        let format = DateFormatter()
        format.dateFormat = "yyyymmdd"
        
        let result = format.date(from: text)
        
        return result == nil ? false : true
    }
    
    
    
    
    // func fetchLottoData() {
//        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1080"
//
//        // Alamofire를 사용하면 아래와 같은 동기/비동기 처리가 자동으로 되는거야~
//        // 네트워크 통신 : 오래걸리는 작업이므로, 여러 스레드에 작업을 나누어 주는 것이 베스트!
//        //DispatchQueue.global().async {
//
//            AF.request(url, method: .get).validate()
//                .responseData { response in
//                    guard let value = response.value else { return }
//                    print("responseData:", value)
//
//                    // UI관련 작업은 메인스레드가 작업해야해!
//                    //DispatchQueue.main.async {
//                    //    <#code#>
//                    //}
//
//                //}
//        }
//
//
//
//        // 2
//        AF.request(url, method: .get).validate()
//            .responseString { response in
//                guard let value = response.value else { return }
//                print("responseString:", value)
//            }
//
//        // 3
//        AF.request(url, method: .get).validate()
//            .response { response in
//                guard let value = response.value else { return }
//                print("response:", value)
//            }
//
//
//            AF.request(url, method: .get).validate()
//                .responseDecodable(of: Lotto.self) { response in
//                    guard let value = response.value else { return }
//                    print("responseDecodable:", value)
//                    print(value.bnusNo, value.drwtNo3)
//                }
//
//    }
    
    
    
    
    

    // 네트워킹 한 값으로 네트워킹 한 번 더 해보기!****
//    func fetchTranslateData(source: String, target: String, text: String) {
//
//        print("fetchTranslateData", source, target, text)
//
//        let url = "https://openapi.naver.com/v1/papago/n2mt"
//        let header: HTTPHeaders = [
//            "X-Naver-Client-Id": Key.clientID,
//            "X-Naver-Client-Secret": Key.clientSecret
//        ]
//        let parameters: Parameters = [
//            "source": source,
//            "target": target,
//            "text": text
//        ]
//
//        AF.request(url, method: .post, parameters: parameters, headers: header)
//            .validate(statusCode: 200...500) // 200...299
//            .responseDecodable(of: Translation.self) { response in
//
//                guard let value = response.value else { return }
//                // print(value.message.result.translatedText)
//
//                self.resultText = value.message.result.translatedText
//
//                print("확인", self.resultText)
//
//                // 네트워킹한 값을 이용해 또 네트워킹을 하는 방법!***
//
//                // 무한루프 됨, 자기 자신의 함수를 다시 호출하면.. 이렇게 하면 안되용
//                // self.fetchTranslateData(source: "ko", target: "en", text: self.resultText)
//
//                // 자기 자신의 네트워킹 함수말고 다른 네트워킹 함수를 사용해야 무한루프 방지***
//                self.fetchTranslate(source: "en", target: "ko", text: self.resultText)
//
//            }
//
//    }
    
    // 최종 확인용 함수*** : 네트워킹 한 값으로 한 번 더 네트워킹 하기 위함!
//    func fetchTranslate(source: String, target: String, text: String) {
//
//        print("fetchTranslateData", source, target, text)
//
//        let url = "https://openapi.naver.com/v1/papago/n2mt"
//        let header: HTTPHeaders = [
//            "X-Naver-Client-Id": Key.clientID,
//            "X-Naver-Client-Secret": Key.clientSecret
//        ]
//        let parameters: Parameters = [
//            "source": source,
//            "target": target,
//            "text": text
//        ]
//
//        AF.request(url, method: .post, parameters: parameters, headers: header)
//            .validate(statusCode: 200...500) // 200...299
//            .responseDecodable(of: Translation.self) { response in
//
//                guard let value = response.value else { return }
//                // print(value.message.result.translatedText)
//
//                self.resultText = value.message.result.translatedText
//
//                print("최종확인", self.resultText)
//
//            }
//
//    }
    
    
    
}
