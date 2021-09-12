//
//  UserViewModel.swift
//  MVVM-Demo
//
//  Created by Udit Batra on 11/09/21.
//

import UIKit

protocol UserViewModelDelegate {
    func fetchingDidStart()
    func fetchingFinished()
}

class UserViewModel: ServiceManager{
    var arrUserArr = [UserModel]()
    
    var delegate : UserViewModelDelegate!
    
    // MARK: Initilizer
    init(delegate:UserViewModelDelegate) {
        self.delegate = delegate
    }
    
    
    func getAllUsersData() {
        delegate.fetchingDidStart()
        let urlString = "\( BASE_URL)\(ToDo_URL)"
        
        requestServer(strUrl: urlString, params: nil, completionBlock: {response in
            switch response{
            case .success(let data):
                print(data)
                do{
                    let usersDataResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    //                        print(usersDataResponse)
                    for userData in usersDataResponse{
                        self.arrUserArr.append(userData)
                    }
                    print(self.arrUserArr.first!)
                    self.delegate.fetchingFinished()
                    
                }catch let err{
                    print(err.localizedDescription as Any)
                }
            case .failure(let error):
                print(error as Any)
            }
        })
    }
}
