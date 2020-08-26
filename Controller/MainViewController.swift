//
//  ViewController.swift
//  Feed
//
//   Created by Duash on 8/26/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit
import SDWebImage

class MainViewController: UIViewController {
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var viewModel = NetworkingViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    
    lazy var GridList: UIBarButtonItem = {
        var barButtonItem = UIBarButtonItem(title: Constants.barButtonChoice[1], style: .plain, target: self, action: nil)
      return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = GridList
        navigationItem.title = Constants.navtitle
        callAPI()
    }
    
    fileprivate func showHideLoader(show: Bool = false) {
        loader.startAnimating()
        loader.isHidden = show
    }
    
    func callAPI() {
        viewModel.response(url: UrlPath.path.shared()) { [weak self] (_) in
            let error = self?.viewModel.getError()
            if error != nil {
                self?.showAlertWithDistructiveButton(message: error.debugDescription)
            } else {
                self?.collectionView.reloadData()
                self?.showHideLoader(show: true)
                Constants.enabled = true
                self?.refreshClicked(UIBarButtonItem())
            }
        }
    }
    
    @IBAction func refreshClicked(_ sender: Any) {
        if !Constants.enabled{
           layout.scrollDirection = .horizontal
            GridList.title = Constants.barButtonChoice[0]
        } else {
            layout.scrollDirection = .vertical
            GridList.title = Constants.barButtonChoice[1]
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
        Constants.enabled = !Constants.enabled
    }
}

extension MainViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.MainCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as? CustomCollectionViewCell
        collectionCell?.updateData(viewModel: viewModel, row: indexPath.row)
        return collectionCell ?? UICollectionViewCell()
    }
}
