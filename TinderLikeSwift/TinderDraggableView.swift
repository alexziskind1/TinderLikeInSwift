//
//  TinderDraggableView.swift
//  TinderLikeSwift
//
//  Created by Alex on 4/26/15.
//  Copyright (c) 2015 Nuvious. All rights reserved.
//

import Foundation
import UIKit

class TinderDraggableView: UIView {
    
    var _panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer();
    var _originalPoint: CGPoint = CGPoint();
    var _overlayView: TinderOverlayView = TinderOverlayView();
    var _picName: String = "";
    
    init(frame: CGRect, picName: String){
        super.init(frame: frame);
        
        self._picName = picName;
        
        _panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "dragged:");

        self.addGestureRecognizer(self._panGestureRecognizer);
        self.loadImageAndStyle();
        
        self._overlayView = TinderOverlayView(frame: self.bounds);
        self._overlayView.alpha = 0;
        
        self.addSubview(self._overlayView);
    }

    convenience init () {
        self.init(frame:CGRectZero, picName: "");
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func loadImageAndStyle() {
        var imageView = UIImageView(image: UIImage(named: _picName));
        self.addSubview(imageView);
        self.layer.cornerRadius = 8;
        self.layer.shadowOffset = CGSizeMake(7, 7);
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.5;
    }
    
    func dragged(gestureRecognizer: UIPanGestureRecognizer) {
        var xDistance: CGFloat = gestureRecognizer.translationInView(self).x;
        var yDistance: CGFloat = gestureRecognizer.translationInView(self).y;
        
        switch (gestureRecognizer.state) {
            case UIGestureRecognizerState.Began:
                self._originalPoint = self.center;
                break;

            case UIGestureRecognizerState.Changed:
                var rotationStrength: CGFloat = min(xDistance / 320, 1);

                var rotationAngel: CGFloat = (CGFloat) (-2 * CGFloat(M_PI) / 16 * rotationStrength);
                
                
                var scaleStrength: CGFloat = (CGFloat) (1 - fabsf(Float(rotationStrength)) / 4);
                var scale: CGFloat = max(scaleStrength, 0.93);
                var transform: CGAffineTransform = CGAffineTransformMakeRotation(rotationAngel);
                var scaleTransform: CGAffineTransform = CGAffineTransformScale(transform, scale, scale);
                self.transform = scaleTransform;
                self.center = CGPointMake(self._originalPoint.x + xDistance, self._originalPoint.y + yDistance);
            
                self.updateOverlay(xDistance);

                break;

            case UIGestureRecognizerState.Ended:
                self.resetViewPositionAndTransformations();
                break;

            case UIGestureRecognizerState.Possible:break;
            case UIGestureRecognizerState.Cancelled:break;
            case UIGestureRecognizerState.Failed:break;
            
        }
    }
    
    func updateOverlay(distance: CGFloat) {

        if (distance > 0) {
            self._overlayView.setMode(TinderOverlayViewMode.Right);
        } else if (distance <= 0) {
            self._overlayView.setMode(TinderOverlayViewMode.Left);
        }
        var overlayStrength: CGFloat = min((CGFloat) (fabsf(Float(distance)) / 100), 0.8);

        self._overlayView.alpha = overlayStrength;
        
    }
    
    func resetViewPositionAndTransformations() {
        UIView.animateWithDuration(0.2, animations: {
            self.center = self._originalPoint;
            self.transform = CGAffineTransformMakeRotation(0);
            self._overlayView.alpha = 0;
        });
    }
    
    deinit {
        self.removeGestureRecognizer(self._panGestureRecognizer);
    }
    
}