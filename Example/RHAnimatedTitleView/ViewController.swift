//
//  ViewController.swift
//  UILabel
//
//  Created by Roy Hsu on 2015/3/30.
//  Copyright (c) 2015年 tinyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    var titleView: RHAnimatedTitleView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView = RHAnimatedTitleView(oldTitle: "AAAA", newTitle: "BBBB")
        titleView?.titleColor = UIColor.redColor()
        titleView?.transition = true
        navigationItem.titleView = titleView
        
        if let height = titleView?.frame.height {
            slider.maximumValue = Float(height)
            slider.minimumValue = 0.0
        }
    }

    
    @IBAction func didMoveSlider(sender: AnyObject) {
        if let slider = sender as? UISlider {
            if titleView != nil {
                let y = CGFloat(slider.value)
                titleView!.contentOffset = CGPointMake(0.0, y)
            }
        }
    }


}

