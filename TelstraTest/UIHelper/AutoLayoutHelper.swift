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
    static func addVerticalSpaceConstraintBetweenViews(_ topView: UIView, bottomView: UIView,verticalSpace  space: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
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

 @discardableResult
static func addVerticalAlignConstraintToView(_ view: UIView, withCenterOffset offset: CGFloat, priority:UILayoutPriority) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: view.superview, attribute: .centerY, multiplier: 1, constant: offset)
        constraint.priority = priority
        view.superview?.addConstraint(constraint)
        return constraint
    }
    
@discardableResult
static func addWidthConstraintToView(_ view: UIView, relation: NSLayoutConstraint.Relation = .equal, value: CGFloat, priority:UILayoutPriority=UILayoutPriority.required) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .width, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: value)
        constraint.priority = priority
        view.addConstraint(constraint)
        return constraint
    }
    
@discardableResult
static func addHeightConstraintToView(_ view: UIView, relation: NSLayoutConstraint.Relation = .equal, value: CGFloat, priority:UILayoutPriority=UILayoutPriority.required) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: value)
        constraint.priority = priority
        view.addConstraint(constraint)
        return constraint
    }


  @discardableResult
  static func addHorizontalSpaceConstraintBetweenViews(_ leftView: UIView, rightView: UIView,   horizontalSpace  space: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
      
      let constraint = NSLayoutConstraint(item: rightView,
                                          attribute: .left,
                                          relatedBy: relation,
                                          toItem: leftView,
                                          attribute: .right,
                                          multiplier: 1,
                                          constant: space)
      rightView.superview?.addConstraint(constraint)
      return constraint
  }

}
