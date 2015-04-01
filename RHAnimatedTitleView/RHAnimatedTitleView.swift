//
//  RHAnimatedTitleView.swift
//  UILabel
//
//  Created by Roy Hsu on 2015/3/31.
//  Copyright (c) 2015年 tinyWorld. All rights reserved.
//

import UIKit

class RHAnimatedTitleView: UIScrollView, UIScrollViewDelegate {
    
    private(set) var oldTitleLabel: UILabel?
    private(set) var newTitleLabel: UILabel?
    private(set) var oldTitle: String?
    private(set) var newTitle: String?
    
    // Set this property to change the color of title with the specified color.
    var titleColor: UIColor = UIColor.blackColor() {
        didSet {
            oldTitleLabel?.textColor = titleColor
            newTitleLabel?.textColor = titleColor
        }
    }
    // The effect fade in and out title when the y position of content offset changed.
    var transition: Bool = true {
        didSet {
            if transition {
                oldTitleLabel?.alpha = 1.0
                newTitleLabel?.alpha = 0.0
            }
            else {
                oldTitleLabel?.alpha = 1.0
                newTitleLabel?.alpha = 1.0
            }
        }
    }
    
    private struct Static {
        static let HorizontalMargin: CGFloat = 70.0
        static let FontSize: CGFloat = 17.0
    }
    
    
    // MARK: - Init
    
    init(oldTitle: String, newTitle: String) {
        super.init()
        
        userInteractionEnabled = false
        delegate = self
        
        let titleFont = UIFont.boldSystemFontOfSize(Static.FontSize)
        
        oldTitleLabel = UILabel()
        if let oldTitleLabel = oldTitleLabel {
            oldTitleLabel.text = oldTitle
            oldTitleLabel.sizeToFit()
            oldTitleLabel.textAlignment = .Center
            oldTitleLabel.numberOfLines = 1
            oldTitleLabel.textColor = titleColor
            oldTitleLabel.font = titleFont
        }
        
        newTitleLabel = UILabel()
        if let newTitleLabel = newTitleLabel {
            newTitleLabel.text = newTitle
            newTitleLabel.sizeToFit()
            newTitleLabel.textAlignment = .Center
            newTitleLabel.numberOfLines = 1
            newTitleLabel.textColor = titleColor
            newTitleLabel.font = titleFont
        }
        
        let width = UIScreen.mainScreen().bounds.width - (2 * Static.HorizontalMargin)
        let height = oldTitleLabel?.frame.height ?? 0.0
        
        frame = CGRectMake(0.0, 0.0, width, height)
        contentSize = CGSizeMake(width, 2 * height)
        
        oldTitleLabel?.frame = CGRectMake(0.0, 0.0, width, height)
        newTitleLabel?.frame = CGRectMake(0.0, height, width, height)
        
        if let oldTitleLabel = oldTitleLabel {
            addSubview(oldTitleLabel)
        }
        if let newTitleLabel = newTitleLabel {
            addSubview(newTitleLabel)
        }
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - Effect
    private func fadeInAndOut() {
        let max = frame.height
        let distance = contentOffset.y
        
        if distance < 0 {
            oldTitleLabel?.alpha = 1.0
            newTitleLabel?.alpha = 0.0
        }
        else if distance > max {
            oldTitleLabel?.alpha = 0.0
            newTitleLabel?.alpha = 1.0
        }
        else {
            let ratio = distance / max
            oldTitleLabel?.alpha = (1.0 - ratio)
            newTitleLabel?.alpha = ratio
        }
    }
    
    
    // MARK: - Scroll View Delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if transition {
            fadeInAndOut()
        }
    }
}
