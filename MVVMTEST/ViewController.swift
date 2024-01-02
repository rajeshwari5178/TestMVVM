//
//  ViewController.swift
//  MVVMTEST
//
//  Created by Rajeshwari Sharma on 02/01/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    
    private var newviewmodel:NewViewModel?
    
    @IBOutlet weak var mTableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpTableview()
        newviewmodel = NewViewModel()
        newviewmodel?.fetchTodos { [weak self] in
            DispatchQueue.main.async {
                self?.mTableview.reloadData()
            }
        }
    }

    func SetUpTableview(){
        mTableview.delegate=self
        mTableview.dataSource=self
      mTableview.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "NewTableViewCell")
      //  mTableview.register(NewTableViewCell.self, forCellReuseIdentifier: "NewTableViewCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newviewmodel?.numberOfTodos ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath)  as! NewTableViewCell
        cell.Title.text=newviewmodel?.getTodoAtIndex(indexPath.row).title
        cell.CompleteLbl.text="\(String(describing: newviewmodel?.getTodoAtIndex(indexPath.row).completed))"
        cell.Id.text="\(newviewmodel?.getTodoAtIndex(indexPath.row).id ?? 0)"
        cell.UserName.text="\(newviewmodel?.getTodoAtIndex(indexPath.row).userId ?? 0)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

