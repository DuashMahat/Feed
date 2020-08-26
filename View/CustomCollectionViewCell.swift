//
//  CustomCollectionViewCell.swift
//  Feed
//
//   Created by Duash on 8/26/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit
import SDWebImage

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var urlprofileimage: UIImageView!
    @IBOutlet weak var trackname: UILabel!
    @IBOutlet weak var artistname: UILabel!
    @IBOutlet weak var releasedate: UILabel!
    
    func updateData(viewModel: NetworkingViewModel, row: Int) {
        urlprofileimage.sd_setImage(with: URL(string: viewModel.getArtatIndexMain(index: row).artworkUrl100 ?? "" ))
        releasedate.setDetails(tag: (self.releasedate.tag), str: viewModel.getArtatIndexMain(index: row).releaseDate ?? "")
        artistname.setDetails(tag: (self.artistname.tag), str:   viewModel.getArtatIndexMain(index: row).artistName)
        trackname.setDetails(tag: (self.trackname.tag), str:  viewModel.getArtatIndexMain(index: row).name)
    }
}
