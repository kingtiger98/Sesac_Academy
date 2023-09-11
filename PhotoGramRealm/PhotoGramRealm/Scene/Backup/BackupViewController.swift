//
//  BackupViewController.swift
//  PhotoGramRealm
//
//  Created by 황재하 on 9/7/23.
//

import UIKit
import Zip

class BackupViewController: BaseViewController{
    
    let backupButton = {
        let button = UIButton()
        button.backgroundColor  = .systemOrange
        
        return button
    }()
    
    let restoreButton = {
        let button = UIButton()
        button.backgroundColor  = .systemGreen
        
        return button
    }()
    
    let backupTableView = {
        let view = UITableView()
        view.rowHeight = 50
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backupTableView.delegate = self
        backupTableView.dataSource = self
        
    }
    
    
    override func configure() {
        super.configure()
        
        view.addSubview(backupTableView)
        view.addSubview(backupButton)
        view.addSubview(restoreButton)

        backupButton.addTarget(self, action: #selector(backupButtonClicked), for: .touchUpInside)
        restoreButton.addTarget(self, action: #selector(restoreButtonClicked), for: .touchUpInside)

    }
    
    // A. 백업 작업
    @objc func backupButtonClicked() {
        
        // 1. 백업하고자 하는 파일들의 경로 배열 생성
        var urlPaths = [URL]()
        
        // 2. 도큐먼트 위치 확인 ex) ~~~/~~~/~~~/Documents/
        guard let path = documentDirectoryPath() else {
            print("도큐먼트 위치에 오류가 있어요")
            return
        }
                
        // 3. 백업하고자 하는 경로이자 파일 ex) ~~~/~~~/~~~/Document/default.realm
        let realmFile = path.appendingPathComponent("default.realm")
        
            // 3_1. 3번 경로가 유효한지 확인
            guard FileManager.default.fileExists(atPath: realmFile.path) else {
                print("백업할 파일이 없습니다.")
                return
            }
        
        // 4. 압축하고자 하는 파일을 배열에 추가
        urlPaths.append(realmFile)
    
        // 5. 압축
        do{ // 지정한 fileName으로 파일을 압축
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "HwangArchive") // "HwangArchive" , "HwangArchive_\(Int.random(in: 1...10000))"
            print("location: \(zipFilePath)")
        } catch {
            print("압축을 실패했어요")
        }
        
        // 생성한 백업 압축파일 테이블뷰에 표시
        backupTableView.reloadData()
        
    }
    
    // B : 복구 작업
    @objc func restoreButtonClicked() {
        // 파일 앱을 통한 복구 진행
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true) // .archive 파일만 가져오도록 함
        
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false // 중복검색 안되게함
        
        present(documentPicker, animated: true)
    }
    
    
    override func setConstraints() {
        super.setConstraints()
        
        backupTableView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
        }
        
        backupButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.top.leading.equalTo(view.safeAreaLayoutGuide)
        }
        
        restoreButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.top.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
}


extension BackupViewController: UITableViewDelegate, UITableViewDataSource{
    
    // 만든 백업 압축파일리스트 가져오는 함수
    func fetchZipList() -> [String] {
        // .zip 파일을 담을 리스트
        var list: [String] = []
        
        do{
            // 1. 도큐먼트 위치 확인 ex) ~~~/~~~/~~~/Documents/
            guard let path = documentDirectoryPath() else { return list }
            // 2. 도큐먼트내의 모든 파일 가져옴
            let docs = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
            // 3. 도큐먼트내의 모든 파일에서 확장자가 zip것만 가져옴
            let zip = docs.filter { $0.pathExtension == "zip" } // 가장 마지막에 구성된 확장자가 "zip"인 것을 가져오기
            // 4. 확장자가 zip인 파일(HwangArchive.zip)을 list에 추가
            for i in zip {
                list.append(i.lastPathComponent)
            }
            
        } catch {
            print("ERROR")
        }
        
        return list
    }
    
    // .zip 파일 백업 압축 파일 리스트를 담은 list를 리턴하는 fetchZipList()함수를 이용해 테이블뷰에 표시
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchZipList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = fetchZipList()[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 백업압축파일을 선택하면 아이폰에 저장하도록 하는 함수
        showActivityViewController()
    }
    
    func showActivityViewController() {
        
        // 1. 도큐먼트 위치 확인 ex) ~~~/~~~/~~~/Documents/
        guard let path = documentDirectoryPath() else {
            print("도큐먼트 위치에 오류가 있어요")
            return
        }
        
        // 2. 도큐먼트 위치에 "HwangArchive.zip"이라는 파일을 찾아 backupFileURL 상수에 저장
        let backupFileURL = path.appendingPathComponent("HwangArchive.zip") // "\(fetchZipList())" , // "HwangArchive.zip"
        
        // backupFileURL상수와 액티비티뷰컨 띄움
        let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: nil)
        
        present(vc, animated: true)
        
        // 아이폰에 Save to Files 하면 백업파일.zip 저장은 끝!
    }
    
    
}

extension BackupViewController: UIDocumentPickerDelegate{
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print(#function)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        // print(#function, urls)
        
        // 선택한 파일 확인
        guard let selectedFileURL = urls.first else { // 파일앱 내의 URL
            print("선택한 파일에 오류가 있어요")
            return
        }
        
        // Document 위치 확인
        guard let path = documentDirectoryPath() else {
            print("도큐먼트 위치에 오류가 있어요")
            return
        }
        
        // 도큐먼트 폴더 내의 압축 파일을 저장할 경로를 설정?
        let sandboxFileURL = path.appendingPathComponent(selectedFileURL.lastPathComponent) // HwangArchive.zip
        
        
        // 경로에 복구할 파일(zip)이 이미 있는지 확인
        if FileManager.default.fileExists(atPath: sandboxFileURL.path) { //sandboxFileURL.path, sandboxFileURL.lastPathComponent
            print(sandboxFileURL.path)
            let fileURL = path.appendingPathComponent("HwangArchive.zip")
            
            do{
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("Progress: ",progress)
                }, fileOutputHandler: { unzippedFile in
                    print("압축해제 완료: ", unzippedFile)
                })
            } catch {
                print("압축 해제 실패")
            }
            
        } else {
            
            // 경로에 복구할 파일이 없을 때의 대응
            do{
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL) // at: selectedFileURL
                
                let fileURL = path.appendingPathComponent("HwangArchive.zip")
                
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("Progress: ",progress)
                }, fileOutputHandler: { unzippedFile in
                    print("압축해제 완료: ", unzippedFile)
                    
                    exit(0) // 앱 강제종
                    
                })
            } catch {
                print("압축 해제 실패")
            }
            
        }
        
        
    }
    
}
