//
//  DashboardTableViewCell.swift
//  TelstraTest
//
//  Created by saurabh suman on 28/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.text = "saurabh"
        label.textColor = .black
        label.numberOfLines = 0
        return label
        
    }()
    var descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.text = "A chiefly Canadian interrogative utterance, usually expressing surprise or doubt or seeking confirmation."
        label.textColor = .black
        label.numberOfLines = 0
        return label
        
    }()
    let imageview : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(imageview)
        
        AutoLayoutHelper.addTopSpaceConstraintToView(titleLabel, topSpace: 6)
        AutoLayoutHelper.addLeadingSpaceConstraintToView(titleLabel, leadingSpace: 8)
        AutoLayoutHelper.addTrailingSpaceConstraintToView(titleLabel, trailingSpace: 8)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
    AutoLayoutHelper.addLeadingSpaceConstraintToView(descriptionLabel, leadingSpace: 8)
    AutoLayoutHelper.addTrailingSpaceConstraintToView(descriptionLabel, trailingSpace: 8)
    AutoLayoutHelper.addVerticalSpaceConstraintBetweenViews(titleLabel, bottomView: descriptionLabel, verticalSpace: 6)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
    AutoLayoutHelper.addLeadingSpaceConstraintToView(imageview, leadingSpace: 8)
        AutoLayoutHelper.addTrailingSpaceConstraintToView(imageview, trailingSpace: 8)
        AutoLayoutHelper.addVerticalSpaceConstraintBetweenViews(descriptionLabel, bottomView: imageview, verticalSpace: 6)
        AutoLayoutHelper.addBottomSpaceConstraintToView(imageview, bottomSpace: 8)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}
