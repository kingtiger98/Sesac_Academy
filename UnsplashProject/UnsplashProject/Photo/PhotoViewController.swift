//
//  PhotoViewController.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/12/23.
//

import UIKit

// MVVM 활용하기 : UI적인 역할만 담당하게 만들거야
class PhotoViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
        
    var viewModel = PhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchPhoto()
        
        viewModel.list.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
}

extension PhotoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.rowCount
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell")!
        
        let data = viewModel.cellForRowAt(at: indexPath)
        
        cell.backgroundColor = .lightGray
        
        return cell
        
    }
    
    
    
    
    
}
    
    
    

