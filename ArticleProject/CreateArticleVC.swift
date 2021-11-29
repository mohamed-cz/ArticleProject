//
//  ViewController.swift
//  ArticleProject
//
//  Created by mac on 25/11/2021.
//

import UIKit

class CreateArticleVC: UIViewController {
    

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
  
    @IBOutlet weak var createArticleOutlet: UIButton!
    
    @IBOutlet weak var pickerTextField: UITextField!
    
    let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
   
    
    let categories: [String] = ["Sport", "Comedy", "Politics"]
    
    
    var homevc : HomeVC?
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createArticleOutlet.layer.cornerRadius = 20
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerTextField.inputView = pickerView
        pickerTextField.textAlignment = .center
        
    }
    
    
    @IBAction func AddArticale(_ sender: Any) {
        let newArtical = Article(context: self.context)
        newArtical.title = titleTextField.text
        newArtical.descriptionArticle = descriptionTextField.text
        newArtical.category = pickerTextField.text
        
        do {
            try context.save()
            
            print("save here")

        }catch{
            print(error)
            print("error here")
            
        }
        
        homevc!.saveData()
        homevc!.loadData()
        homevc!.TableVeiwArticles.reloadData()
        self.dismiss(animated: true,completion: nil)
 }
     

}

extension CreateArticleVC: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return categories[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickerTextField.text = categories[row]
        pickerTextField.resignFirstResponder()

    }

}
