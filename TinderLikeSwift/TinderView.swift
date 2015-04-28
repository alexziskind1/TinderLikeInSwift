//
//  TinderView.swift
//  TinderLikeSwift
//
//  Created by Alex on 4/26/15.
//  Copyright (c) 2015 Nuvious. All rights reserved.
//

import Foundation
import UIKit


class TinderView: UIView {
    
    var draggableView: TinderDraggableView = TinderDraggableView();
    var draggableView2: TinderDraggableView = TinderDraggableView();
    
    var pix = Array(["cat_grumpy.jpeg", "cat_worried.jpeg"]);
    
    override init (frame : CGRect) {
        super.init(frame : frame)

        draggableView = TinderDraggableView(frame: CGRectMake(60, 60, 200, 260), picName: pix[0]);
        draggableView.center = self.convertPoint(self.center, fromView: self);
        
        draggableView2 = TinderDraggableView(frame: CGRectMake(60, 60, 200, 260), picName: pix[1]);
        draggableView2.center = self.convertPoint(self.center, fromView: self);
        
        self.backgroundColor = UIColor.whiteColor();
        self.loadDraggableCustomView();
    }

    convenience init () {
        var screenBounds = UIScreen.mainScreen().bounds;
        self.init(frame:screenBounds);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func loadDraggableCustomView() {
        self.addSubview(self.draggableView);
        self.addSubview(self.draggableView2);
    }
}