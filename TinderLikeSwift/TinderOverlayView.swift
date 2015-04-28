//
//  TinderOverlayView.swift
//  TinderLikeSwift
//
//  Created by Alex on 4/26/15.
//  Copyright (c) 2015 Nuvious. All rights reserved.
//

import Foundation
import UIKit


class TinderOverlayView: UIView {
    var _imageNameNo = "trollface_300x200";
    var _imageNameYes = "thumbs_up_300x300";
    var _stringYes = "YES";
    var _stringNo = "NO";
    
    var _mode: TinderOverlayViewMode = TinderOverlayViewMode.None;
    var _imageView: UIImageView = UIImageView();
    var _selectLabel: UILabel = UILabel();
    
    override init(frame: CGRect){
        super.init(frame: frame);
        
        //self.backgroundColor = UIColor.whiteColor();

        self._selectLabel.font = self._selectLabel.font.fontWithSize(50);
        
        self._selectLabel.numberOfLines = 1;
        self._selectLabel.sizeToFit();
        self._selectLabel.adjustsFontSizeToFitWidth = true;

        self.addSubview(self._selectLabel);
        self.showPositive();
    }
    
    convenience init () {
        self.init(frame:CGRectZero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func setMode(mode: TinderOverlayViewMode) {
        if (_mode == mode) { return; }
    
        println("Mode changed");
        
        _mode = mode;
        if (mode == TinderOverlayViewMode.Left) {
            showNegative();
        } else {
            showPositive();
        }
    }
    
    func showPositive(){
        self._selectLabel.text = _stringYes;
        var labelFrame: CGRect = self._selectLabel.frame;
        self._selectLabel.textColor = UIColor.greenColor();
        self._selectLabel.frame = CGRectMake(5, 5, labelFrame.size.width, labelFrame.size.height);
        self._selectLabel.textAlignment = NSTextAlignment.Left;
    }
    
    func showNegative() {
        self._selectLabel.text = _stringNo;
        var labelFrame: CGRect = self._selectLabel.frame;
        self._selectLabel.textColor = UIColor.redColor();
        self._selectLabel.frame = CGRectMake(self.frame.width - labelFrame.size.width - 5, 5, labelFrame.size.width, labelFrame.size.height);
        self._selectLabel.textAlignment = NSTextAlignment.Right;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        self._imageView.frame = CGRectMake(50, 50, 100, 100);
        self._selectLabel.frame = CGRectMake(50, 50, 100, 100);
    }
 
}