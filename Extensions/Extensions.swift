//
//  Extensions.swift
//  Feed
//
//  Created by Duash on 8/26/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func beautify () {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 2
    }
}

extension UIImageView {
    func beautify() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.contentMode = .scaleAspectFill
        
    }
}

extension UITableView {
    func background() {
        self.backgroundColor = .systemBlue
    }
}

extension UITableViewCell {
    func editBackground() {
        self.backgroundColor = .systemBlue
        self.textLabel?.textColor = .white
    }
}


extension UIButton  {
    func beautifyButton () {
        
    }
    
    func editButtoned () {
        self.setImage(UIImage(named: "edit"), for: .normal)
    }
}

extension UILabel  {
    
    func setDetails ( tag : Int  ,  str : String ) {
        if (tag == 1 ) {
            self.font = UIFont.boldSystemFont(ofSize: 17)
        } else if (tag == 2 ) {
            self.font = UIFont.boldSystemFont(ofSize: 15)
        } 
        self.textAlignment = .left
        self.text = str
    }
}

extension MainViewController {
    func showAlertWithDistructiveButton(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension MainViewController : UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if layout.scrollDirection == .vertical {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: (screenWidth/1)-6, height: (screenWidth/3)-6);
    } else {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width:(((screenWidth/3)-6) + 120), height: (screenWidth/3)-6);
    }
    
}
fileprivate var sectionInsets: UIEdgeInsets {
    return UIEdgeInsets.init(top: 18.0, left: 18.0, bottom: 18.0, right: 18.0)
}

fileprivate var interitemSpace: CGFloat {
    return 18.0
}
func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
}

func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 18.0
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return interitemSpace
}
}
