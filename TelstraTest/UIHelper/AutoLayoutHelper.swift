//
//  AutoLayoutHelper.swift
//  TelstraTest
//
//  Created by saurabh suman on 28/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import UIKit

class AutoLayoutHelper: NSObject {
    
    @discardableResult
    static func addLeadingSpaceConstraintToView(_ view: UIView, leadingSpace space: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(item: view,
                                            attribute: .leading,
                                            relatedBy: relation,
                                            toItem: view.superview,
                                            attribute: .leading,
                                            multiplier: 1,
                                            constant: space)
        view.superview?.addConstraint(constraint)
        return constraint
    }
   
    @discardableResult
    static func addTrailingSpaceConstraintToView(_ view: UIView, trailingSpace space: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(item: view,
                                            attribute: .trailing,
                                            relatedBy: relation,
                                            toItem: view.superview,
                                            attribute: .trailing,
                                            multiplier: 1,
                                            constant: -space)
        view.superview?.addConstraint(constraint)
        return constraint
    }
   
    @discardableResult
    static func addTopSpaceConstraintToView(_ view: UIView, topSpace space: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(item: view,
                                            attribute: .top,
                                            relatedBy: relation,
                                            toItem: view.superview,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: space)
        
        view.superview?.addConstraint(constraint)
        return constraint
    }
   
    @discardableResult
    static func addBottomSpaceConstraintToView(_ view: UIView, bottomSpace space: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(item: view,
                                            attribute: .bottom,
                                            relatedBy: relation,
                                            toItem: view.superview,
                                            attribute: .bottom,
                                            multiplier: 1,
                                            constant: space)
        view.superview?.addConstraint(constraint)
        return constraint
    }
    
    @discardableResult
    static func addVerticalSpaceConstraintBetweenViews(_ topView: UIView, bottomView: UIView,   verticalSpace  space: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(item: bottomView,
                                            attribute: .top,
                                            relatedBy: relation,
                                            toItem: topView,
                                            attribute: .bottom,
                                            multiplier: 1,
                                            constant: space)
        
        bottomView.superview?.addConstraint(constraint)
        return constraint
    }
    
}
