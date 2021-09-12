//
//  UserModel.swift
//  MVVM-Demo
//
//  Created by Udit Batra on 11/09/21.
//

import UIKit

struct UserModel : Codable {
    let userId : Int?
    let id: Int?
    let title: String?
    let completed: Bool?
    
    enum CodingKeys: String, CodingKey {
        case userId, id, title = "title", completed
    }
    
    func getStatusAndColor() -> (String, UIColor){
        if completed == true {
            return ("Completed", UIColor.green)
        }else{
            return ("Completed", UIColor.red)
        }
    }
}


