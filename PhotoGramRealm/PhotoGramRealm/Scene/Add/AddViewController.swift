//
//  AddViewController.swift
//  PhotoGramRealm
//
//  Created by jack on 2023/09/03.
//

import UIKit
import SnapKit
import RealmSwift

class AddViewController: BaseViewController {
    
    // 1. DiaryTableRepository
    let repository = DiaryTableRepository()
    
    let userImageView: PhotoImageView = {
        let view = PhotoImageView(frame: .zero)
        return view
    }()
    
    let titleTextField: WriteTextField = {
        let view = WriteTextField()
        view.textColor = .white
        view.placeholder = "제목을 입력해주세요"
        return view
    }()
    
    let dateTextField: WriteTextField = {
        let view = WriteTextField()
        view.textColor = .white
        view.placeholder = "날짜를 입력해주세요"
        return view
    }()
    
    let contentTextView: UITextView = {
        let view = UITextView()
        view.textColor = .black
        view.font = .systemFont(ofSize: 15)
        view.layer.borderWidth = Constants.Desgin.borderWidth
        view.layer.borderColor = Constants.BaseColor.border
        view.layer.cornerRadius = Constants.Desgin.cornerRadius
        return view
    }()
    
    lazy var searchImageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "photo"), for: .normal)
        view.tintColor = Constants.BaseColor.text
        view.backgroundColor = Constants.BaseColor.point
        view.layer.cornerRadius = 25
        view.addTarget(self, action: #selector(searchImageButtonClicked), for: .touchUpInside)
        return view
    }()
    
    lazy var searchWebButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "web"), for: .normal)
        view.tintColor = Constants.BaseColor.text
        view.backgroundColor = Constants.BaseColor.point
        view.layer.cornerRadius = 25
        view.addTarget(self, action: #selector(searchWebButtonClicked), for: .touchUpInside)
        return view
    }()
    
    // 1. 이미지 URL 담기**
    var fullURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad() //안하는 경우 생기는 문제 _ 화면이 버벅임?
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
    }
    
    @objc func saveButtonClicked() {
        
        // 2. Realm write ***
        // realm 파일에 접근할 수 있도록, 위치를 찾는 코드
        // let realm = try! Realm () // Realm의 위치를 탐색하는 것
        
        // 3. 이미지 URL 담기**
        let task = DiaryTable(diaryTitle: titleTextField.text!, diaryDate: Date(), contents: contentTextView.text, diaryPhoto: fullURL)
        
        // transaction 단위로 작업 수행*
        //        try! realm.write {
        //            realm.add(task)
        //            print("Realm Add Succeed")
        //        }
        
        // 1. DiaryTableRepository
        repository.createItem(task)
        
        // Document 파일에 이미지 저장
        if userImageView.image != nil {
            print("먕먕", userImageView.image!)
            saveImageToDoDocument(fileName: "hwang_\(task._id).jpg", image: userImageView.image!)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func searchImageButtonClicked() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    // userImageView에 선택한 이미지 띄우기
    @objc func searchWebButtonClicked() {
        let vc = SearchViewController()
        vc.didSelectItemHandler = { [weak self] value in
            
            // 2. 이미지 URL 담기**
            self?.fullURL = value
            
            DispatchQueue.global().async {
                if let url = URL(string: value), let data = try? Data(contentsOf: url ) {
                    
                    DispatchQueue.main.async {
                        self?.userImageView.image = UIImage(data: data)
                    }
                    
                }
            }
            
        }
        present(vc, animated: true)
    }
    
    override func configure() {
        super.configure()
        
        [userImageView, titleTextField, dateTextField, contentTextView, searchImageButton, searchWebButton].forEach {
            view.addSubview($0)
        }
        
    }
    
    override func setConstraints() {
        
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(view.snp.width).multipliedBy(0.55)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(12)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(55)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(12)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(55)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(12)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-12)
        }
        
        searchImageButton.snp.makeConstraints { make in
            make.trailing.equalTo(userImageView.snp.trailing).offset(-12)
            make.bottom.equalTo(userImageView.snp.bottom).offset(-12)
            make.width.height.equalTo(50)
        }
        
        searchWebButton.snp.makeConstraints { make in
            make.trailing.equalTo(searchImageButton.snp.leading).offset(-12)
            make.bottom.equalTo(userImageView.snp.bottom).offset(-12)
            make.width.height.equalTo(50)
        }
    }
}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            userImageView.image = image
            
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
}
