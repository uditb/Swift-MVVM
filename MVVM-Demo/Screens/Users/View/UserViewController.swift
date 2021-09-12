//
//  ViewController.swift
//  MVVM-Demo
//
//  Created by Udit Batra on 11/09/21.
//

import UIKit

class UserViewController: UIViewController, UserViewModelDelegate {
    
    @IBOutlet weak var tblView: UITableView!
    lazy var userVM : UserViewModel = UserViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        userVM.getAllUsersData()
        
        self.tblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    // MARK: View Model Delegate Methods
    func fetchingDidStart() {
        print("Fetching started")
    }
    func fetchingFinished() {
        print("Fetching finished")
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
    }
}

extension UserViewController : UITabBarDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userVM.arrUserArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        
        let userModel = userVM.arrUserArr[indexPath.row]
        //        print(userModel.title)
        cell?.userModel = userModel
        
        return cell!
    }
}

