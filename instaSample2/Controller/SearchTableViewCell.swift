//
//  SearchTableViewCell.swift
//  instaSample2
//
//  Created by 岡田昂典 on 2020/03/06.
//  Copyright © 2020 Kosuke Okada. All rights reserved.
//

import UIKit

protocol SearchTableViewCellDelegate {
    func didTapFollowButton(tableViewcell: UITableViewCell, button: UIButton)
}

class SearchTableViewCell: UITableViewCell {
    
    var delegate: SearchTableViewCellDelegate?
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func follow(button: UIButton) {
        self.delegate?.didTapFollowButton(tableViewcell: self, button: button)
        
    }
    
    
}
