//
//  HomeVC.swift
//  ArticleProject
//
//  Created by Abrahim MOHAMMED on 25/11/2021.
//

import UIKit
import CoreData

class HomeVC: UIViewController {
   
    var segmentSelection = 0
    @IBOutlet weak var TableVeiwArticles: UITableView!
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBOutlet weak var homeButtonOutlet: UIButton!
    

    var arrArticle: [Article] = []
    let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    @IBAction func segementAction(_ sender: Any) {
        segmentSelection = segmentOutlet.selectedSegmentIndex
        if segmentSelection == 0 {
            TableVeiwArticles.reloadData()

        } else if segmentSelection == 1 {
        arrArticle = arrArticle.filter{$0.category == "Sport"}
            TableVeiwArticles.reloadData()
           

        } else if segmentSelection == 2 {
            arrArticle = arrArticle.filter{$0.category == "Comedy"}
            TableVeiwArticles.reloadData()
            
        }else {
            arrArticle = arrArticle.filter{$0.category == "Politics"}
            TableVeiwArticles.reloadData()
           
            
        }

    }
    
    @IBAction func createSegment(_ sender: Any) {
        
     let createArticleVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CreateArticleVC") as! CreateArticleVC
        
        createArticleVc.homevc = self
        
        self.present(createArticleVc, animated: true, completion: nil)
        
    }
    
    
    func saveData(){
        
        do {
            try context.save()
            
            
        }catch{
            print(error)
            
        }
        TableVeiwArticles.reloadData()
        
    }
    
    func loadData() {
        let request: NSFetchRequest<Article> = Article.fetchRequest()
        
        do {
            arrArticle = try context.fetch(request)
        }catch{
            print(error)
        }
        
        TableVeiwArticles.reloadData()
    }
    
    
}


extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableVeiwArticles.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        
  
            cell.titleLable.text = arrArticle[indexPath.row].title
            cell.categoryLable.text = arrArticle[indexPath.row].category

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let x = arrArticle[indexPath.row]
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "detaildArticleVC") as! detaildArticleVC
       
        nextVC.titleString = x.title ?? ""
        nextVC.descriptionString = x.descriptionArticle ?? ""

        nextVC.CategoryString = x.category ?? ""
        self.present(nextVC, animated: true, completion: nil)
        
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete {
                    context.delete(arrArticle[indexPath.row])
                
            let alert = UIAlertController(title: "", message: "Are you sure to delete \"\(arrArticle[indexPath.row].title!)\"?", preferredStyle: .alert)
                    let action2 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                        alert.addAction(action2)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: { action in
                                    
                        self.arrArticle.remove(at: indexPath.row)
                        self.saveData()
                    })
                    
                    alert.addAction(action)
                    present(alert, animated: true, completion: nil)
                
                }
        
    }
    
    
}
