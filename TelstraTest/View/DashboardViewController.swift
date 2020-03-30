//
//  DashboardViewController.swift
//  TelstraTest
//
//  Created by saurabh suman on 28/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
  // Variable declerations
  let tableView = UITableView()
  let viewModel = DashboardViewModel()
  var pullToRefresh: UIRefreshControl!
  fileprivate var activityIndicator   : UIActivityIndicatorView?
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    // Do any additional setup after loading the view.
    initialSetup()
  }
  // Initial method when view will load this method will get called
  func initialSetup() {
    self.view.addSubview(self.tableView)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.estimatedRowHeight = 150
    tableView.rowHeight = UITableView.automaticDimension
    //Register Custom Cell on tableView
    tableView.register(DashboardTableViewCell.self, forCellReuseIdentifier: "cell")
    pullToRefresh = UIRefreshControl()
    pullToRefresh.attributedTitle = NSAttributedString(string: "Pull to Refresh")
    pullToRefresh.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
    self.tableView.addSubview(pullToRefresh)
    activityIndicator = UIActivityIndicatorView.activityIndicatorToView(view)
    setUpTableView()
    getDatatoDisplayInTable()
  }
  // Setup Autolayout for tableview
  func setUpTableView() {
    AutoLayoutHelper.addLeadingSpaceConstraintToView(self.tableView, leadingSpace: 0)
    AutoLayoutHelper.addTrailingSpaceConstraintToView(self.tableView, trailingSpace: 0)
    AutoLayoutHelper.addTopSpaceConstraintToView(self.tableView, topSpace: 0)
    AutoLayoutHelper.addBottomSpaceConstraintToView(self.tableView, bottomSpace: 0)
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
  }
  // Main method to get data from server
  func getDatatoDisplayInTable() {
    if Reachability.isConnectedToNetwork() {
      getDataFromAPI()
    }else{
      self.showAlert(errrorMessage:"No Internet connection.")
    }
  }
  func getDataFromAPI()  {
    activityIndicator?.startAnimating()
    self.viewModel.getDashboardData(successBlock: {
      DispatchQueue.main.async {
        self.activityIndicator?.stopAnimating()
      }
      self.updateUI()
    }) { (error) in
      DispatchQueue.main.async {
        self.activityIndicator?.stopAnimating()
        self.showAlert(errrorMessage: error?.localizedDescription ?? "Something went wrong.")
      }
    }
  }
  
  // Method will get called when pull to refresh in table view
  @objc func refreshTableView(_ sender : UIRefreshControl) {
    getDatatoDisplayInTable()
  }
  // Method is responsible for UI Update after getting response
  func updateUI() {
    DispatchQueue.main.async {
      weak var weakself = self
      weakself?.navigationItem.title = self.viewModel.setNavigationTitle()
      weakself?.tableView.reloadData()
      weakself?.pullToRefresh.endRefreshing()
    }
  }
}
// MARK: DashboardViewController Extension for tableview Implementation
extension DashboardViewController:UITableViewDelegate,UITableViewDataSource {
  // MARK: UITableViewDetaSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModel.getRequirdTableRow()
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DashboardTableViewCell
    cell.configureCellData(model:self.viewModel.getCellDataforIndexPath(indexNumber: indexPath.row))
    return cell
  }
}
// MARK: DashboardViewController Extension for AlertControl
extension DashboardViewController {
  func showAlert(errrorMessage:String) {
    let dialogMessage = UIAlertController(title: "Error.", message:errrorMessage, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
    })
    dialogMessage.addAction(ok)
    self.present(dialogMessage, animated: true, completion: nil)
  }
}
