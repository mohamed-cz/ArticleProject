//
//  detaildArticleVC.swift
//  ArticleProject
//
//  Created by mac on 27/11/2021.
//

import UIKit

class detaildArticleVC: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var categoryLable: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    var titleString = ""
    var descriptionString = ""
    var CategoryString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLable.text = titleString
        descriptionTextView.text = descriptionString
        categoryLable.text = CategoryString
        // Do any additional setup after loading the view.
    }
    

}
