
//
//  TheatorViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/24/23.
//

import UIKit
import CoreLocation // 1. 위치 임포트
import MapKit
import SnapKit

// info에서 Privacy - Location When In Use Usage Description 추가해야함, 요청하는 이유 명세

class TheatorViewController: UIViewController {

    // 2. 위치 매니저 생성 : 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    
    let mapView = MKMapView()
    let cafeButton = UIButton()
    let foodButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(30)
        }
        
        view.backgroundColor = .white
        
        // 3. 위치 프로토콜 연결
        locationManager.delegate = self // 권한 위임
        
        // 네비게이션컨트롤러로 이동시 주석 풀어, present시엔 주석해도 돼
        // 그냥 주석 안해도 되긴 함;
        checkDeviceLocationAuthorization()
        
      
        let center = CLLocationCoordinate2D(latitude: 37.506831, longitude: 126.960819)
        setRegionAndAnnotation(center: center)
        setAnnotation(type: "전체보기")
        showRequestLocationTheatorAlert()
    }
    
    // 선택한 영화관만 보이도록
    func showRequestLocationTheatorAlert() {
        let requestLocationServiceAlert = UIAlertController( title: nil, message: nil, preferredStyle: .actionSheet)
        
        let meagPin = UIAlertAction(title: "메가박스", style: .destructive) { _ in
            self.setAnnotation(type: "메가박스")
        }
        let lottePin = UIAlertAction(title: "롯데시네마", style: .destructive) { _ in
            self.setAnnotation(type: "롯데시네마")
        }
        let cgvPin = UIAlertAction(title: "CGV", style: .destructive) { _ in
            self.setAnnotation(type: "CGV")
        }
        let allPin = UIAlertAction(title: "전체보기", style: .destructive) { _ in
            self.setAnnotation(type: "전체보기")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)

        requestLocationServiceAlert.addAction(meagPin)
        requestLocationServiceAlert.addAction(lottePin)
        requestLocationServiceAlert.addAction(cgvPin)
        requestLocationServiceAlert.addAction(allPin)
        requestLocationServiceAlert.addAction(cancel)

        present(requestLocationServiceAlert, animated: true)
    }
    
    
    var theatorInfo: TheaterList = TheaterList()
    
    func setAnnotation(type: String) {
        // 오늘의 밥상 : 37.517746, 126.887131
        // 컴포즈 커피 : 37.517857, 126.886714
                
        // 지도에 어노테이션(핀) 추가
        let annotation0 = MKPointAnnotation()
        annotation0.title = "\(theatorInfo.mapAnnotations[0].location)"
        annotation0.coordinate = CLLocationCoordinate2D(latitude: theatorInfo.mapAnnotations[0].latitude, longitude: theatorInfo.mapAnnotations[0].longitude)

        let annotation1 = MKPointAnnotation()
        annotation1.title = "\(theatorInfo.mapAnnotations[1].location)"
        annotation1.coordinate = CLLocationCoordinate2D(latitude: theatorInfo.mapAnnotations[1].latitude, longitude: theatorInfo.mapAnnotations[1].longitude)
        
        let annotation2 = MKPointAnnotation()
        annotation2.title = "\(theatorInfo.mapAnnotations[2].location)"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: theatorInfo.mapAnnotations[2].latitude, longitude: theatorInfo.mapAnnotations[2].longitude)
        
        let annotation3 = MKPointAnnotation()
        annotation3.title = "\(theatorInfo.mapAnnotations[3].location)"
        annotation3.coordinate = CLLocationCoordinate2D(latitude: theatorInfo.mapAnnotations[3].latitude, longitude: theatorInfo.mapAnnotations[3].longitude)
        
        let annotation4 = MKPointAnnotation()
        annotation4.title = "\(theatorInfo.mapAnnotations[4].location)"
        annotation4.coordinate = CLLocationCoordinate2D(latitude: theatorInfo.mapAnnotations[4].latitude, longitude: theatorInfo.mapAnnotations[4].longitude)
        
        let annotation5 = MKPointAnnotation()
        annotation5.title = "\(theatorInfo.mapAnnotations[5].location)"
        annotation5.coordinate = CLLocationCoordinate2D(latitude: theatorInfo.mapAnnotations[5].latitude, longitude: theatorInfo.mapAnnotations[5].longitude)
        

        
        if type == "전체보기" { // viewDidLoad
            mapView.addAnnotations([annotation0, annotation1, annotation2, annotation3, annotation4, annotation5])
        } else if type == "롯데시네마" { // 롯데시네마
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation0, annotation1])
        } else if type == "메가박스" { // 메가박스
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation2, annotation3])
        } else if type == "CGV" { // CGV
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation4, annotation5])
        }
        
    }
 
    
    
    // 지도 처음 화면 설정해보기 + 핀 꽂아보기
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        // 중앙대학교병원 좌표 : 37.506831, 126.960819
        // let center = CLLocationCoordinate2D(latitude: 37.506831, longitude: 37.506831)
        
        // 지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.setRegion(region, animated: true)
        
        // 지도에 어노테이션(핀) 추가
        let annotation = MKPointAnnotation()
        annotation.title = "중앙대학교 병원"
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
        
    }
    
    
    
    
    // 위치권한설정으로 넘어가게 해주는 얼럿띄우기 _ 사용자가 권한을 허용하지 않은 상태("denied")라면
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 이용할 수 없습니다. 기기의 '설정 > 개인정보 보호'에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            
            // 애플이 제공하는 UIApplication.openSettingsURLString 내 앱의 설정화면으로 보내줌
            // 설정 페이지로 넘어갈지, 설정 상세 페이지로 넘어갈지는 결정 할 수 없어!
            // 한 번도 설정 앱에 들어가지 않았거나, 막 다운받은 앱이라서 _ 설정의 메인페이지로밖에 가지지 않음
            // 앱을 좀 사용하고 설정도 들어가보고 했으면 설정 상세 페이지로 가지기도 해
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
            
        }
        
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancle)
        
        present(alert, animated: true)

    }
    
    
    // iOS 위치 서비스 활성화
    func checkDeviceLocationAuthorization() {
        
        // iOS 위치 서비스 활성화 체크
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                
                // 현재 사용자의 위치 권한 상태를 가지고 옴
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                // UI관련 작업은 메인스레드에서 돌리기
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
                
            } else {
                print("위치 서비스가 꺼져 있어서 권한 요청을 못합니다.")
            }
        }
            
        
    }
    
    
    
    // 사용자의 위치 서비스 상태에 따라서 권한을 요청할 함수
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        
        print("ckeck", status)
        
        switch status {
            
        // 권한이 아직 결정 안된 상태
        case .notDetermined:
            // 정확도 설정
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            // 권한요청얼럿 띄우기 : 한 번 허용, 앱을 사용하는 동안 허용, 허용 안함
            // info.plist에 권한요청 이유 추가해야함 _ <Privacy - Location When In Use Usage Description>
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showLocationSettingAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            // didUpdateLocation 메서드 실행됨 _ 제일 마지막에 실행됨
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        // 위치 권한 종류가 더 생길 가능성 대비!
        @unknown default:
            print("default")
        }
        
    }
    
}

// 4. 프로토콜 선언
extension TheatorViewController: CLLocationManagerDelegate {
        
    // 5. 사용자의 위치를 성공적으로 가져온 경우*** : 새로운 위치가 생겼을 때 말해줄게!
    // 한 번만 실행되지 않는다, iOS위치 업데이트가 필요한 시점에 알아서 여러번 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         //print("====", locations)
        
        if let coordinate = locations.last?.coordinate { // coordinate : 위_경도값 들어있는 요소
            // 현위치 위_경도 출력해보기
            print(coordinate)
            
            // coordinate활용 지도 첫위치 + 핀 꽂기 메서드 호출
            setRegionAndAnnotation(center: coordinate)
            
            // coordinate 활용해서 날씨API 호출도 할 수 있겠지?
        }
        // 위치 업데이트를 한 번만 하고 싶을 때 추가!!
        locationManager.stopUpdatingLocation()
    }
    
    // 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         
    }
    
    // 사용자의 권한 상태가 바뀔 때를 알려줌
    // 거부했다가 설정에서 변경을 했거나, 혹은 notDetermined 상태에서 허용을 했거나
    // 허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    // iOS14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }
    
    // 사용자의 권한 상태가 바뀔 때를 알려줌
    // iOS14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
         

    }
    
}


extension TheatorViewController: MKMapViewDelegate {
    
    // 지도가 움직이다가 멈추면 호출!
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
    // 핀 탭한 곳에 찍기!
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print(#function)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        print(#function)
//    }
    
}
