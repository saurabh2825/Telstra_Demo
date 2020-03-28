//
//  DashboardViewController.swift
//  TelstraTest
//
//  Created by saurabh suman on 28/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func initialSetup() {
        
        self.view.addSubview(self.tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(DashboardTableViewCell.self, forCellReuseIdentifier: "cell")
        setUpTableView()
        
    }
    
    func setUpTableView() {
        
        AutoLayoutHelper.addLeadingSpaceConstraintToView(self.tableView, leadingSpace: 0)
        AutoLayoutHelper.addTrailingSpaceConstraintToView(self.tableView, trailingSpace: 0)
        AutoLayoutHelper.addTopSpaceConstraintToView(self.tableView, topSpace: 0)
        AutoLayoutHelper.addBottomSpaceConstraintToView(self.tableView, bottomSpace: 0)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}

extension DashboardViewController:UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    return cell
    }
    
    
    
    
    
}
