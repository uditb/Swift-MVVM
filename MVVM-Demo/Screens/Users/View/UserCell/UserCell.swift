//
//  UserCell.swift
//  MVVM-Demo
//
//  Created by Udit Batra on 11/09/21.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    var userModel : UserModel? {
        didSet{
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(){
        lblName.text = userModel?.title
        
        let statusAndColor = userModel?.getStatusAndColor()
        lblName.textColor = statusAndColor?.1
    }
    
}
