//
//  SearchViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/28/23.
//

import UIKit

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    
    let imageList = ["pencil", "star", "person", "star.fill", "xmark", "person.circle"]
    
    // 2. Protocol 값 전달
    var delegate2: PassImageDelegate?
    
    override func loadView() {
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // addObsever보다 post가 먼저 신호를 보내면... => addObsever가 신호를 받지 못한다!
        // addObsever가 먼저 등록되어야해 꼭
        NotificationCenter.default.addObserver(self, selector: #selector(recommandKeywordNotificationObserve), name: NSNotification.Name("RecommandKeyword"), object: nil)
        
        
        // 키보드 바로 뜨게됨 : serchBar에 Responder할당
        mainView.serchBar.becomeFirstResponder()
        mainView.serchBar.delegate = self
        
        
        APIService.shared.callRequest2()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        

    }
    
    
    @objc func recommandKeywordNotificationObserve(notification: NSNotification){
        print("recommandKeywordNotificationObserve")
    }
    
    
    override func configureView() {
        super.configureView()
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
    
    override func setConstraints() {
        super.setConstraints()

    }
    
}



extension SearchViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // serchBar의 잡혀있던 Responder가 떠남
        mainView.serchBar.resignFirstResponder()
        
    }
    
}



extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(systemName: imageList[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(imageList[indexPath.item])
        
        // 3. Protocol을 통한 값 전달
        delegate2?.receiveImage(imageName: imageList[indexPath.item])

        // Notification을 통한 값 역 전달하기
        // NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil, userInfo: ["name": imageList[indexPath.item], "sample": "고래밥"])
        
        
        dismiss(animated: true)
    }
 
}
