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
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .left
        label.textColor = .blue
        label.numberOfLines = 0
        return label
        
    }()
    var descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
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
        
      contentView.addSubview(titleLabel)
      contentView.addSubview(descriptionLabel)
      contentView.addSubview(imageview)
        
        AutoLayoutHelper.addTopSpaceConstraintToView(titleLabel, topSpace: 6)
        AutoLayoutHelper.addLeadingSpaceConstraintToView(titleLabel, leadingSpace: 8)
        AutoLayoutHelper.addTrailingSpaceConstraintToView(titleLabel, trailingSpace: 8,relation: .greaterThanOrEqual)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        AutoLayoutHelper.addLeadingSpaceConstraintToView(descriptionLabel, leadingSpace: 8)
       AutoLayoutHelper.addHorizontalSpaceConstraintBetweenViews(descriptionLabel, rightView: imageview, horizontalSpace: 10)
      AutoLayoutHelper.addVerticalSpaceConstraintBetweenViews(titleLabel, bottomView: descriptionLabel, verticalSpace: 6)
      AutoLayoutHelper.addBottomSpaceConstraintToView(descriptionLabel, bottomSpace: -8,relation: .equal)
      descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
     
     AutoLayoutHelper.addTrailingSpaceConstraintToView(imageview, trailingSpace: 8)
     AutoLayoutHelper.addHeightConstraintToView(imageview, value: 50)
     AutoLayoutHelper.addWidthConstraintToView(imageview, value: 70)
     AutoLayoutHelper.addVerticalAlignConstraintToView(imageview, withCenterOffset: 0, priority: .required)
      imageview.translatesAutoresizingMaskIntoConstraints = false
   
  }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellData(model:Rows)  {
        
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
        if let urlString = model.imageHref{
          imageview.loadImagesfromURL(urlString:urlString)
         }else{
          imageview.image = nil
         }
    }
}
