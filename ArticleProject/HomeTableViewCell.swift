//
//  HomeTableViewCell.swift
//  ArticleProject
//
//  Created by Abrahim MOHAMMED on 25/11/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

   
    @IBOutlet weak var mainVStack: UIStackView!
    @IBOutlet weak var mainHStack: UIStackView!
    @IBOutlet weak var innerHStack: UIStackView!
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var creationDateLable: UILabel!
    @IBOutlet weak var creationDateImage: UIImageView!
    @IBOutlet weak var categoryLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
