//
//  ListClubsTableViewCell.swift
//  Consensus Clubs
//
//  Created by Ger O'Sullivan on 2018-05-19.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import UIKit

class ListClubsTableViewCell: UITableViewCell {

    // MARK: - Controls
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
}

extension ListClubsTableViewCell {
    
    func bind(_ model: ListClubsModels.ClubViewModel) {
        idLabel.text = "\(model.id)"
        nameLabel.text = model.name
        priceLabel.text = model.price
    }
}
