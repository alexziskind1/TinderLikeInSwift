//
//  ViewController.swift
//  TinderLikeSwift
//
//  Created by Alex on 4/26/15.
//  Copyright (c) 2015 Nuvious. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        
        self.view = TinderView();
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

