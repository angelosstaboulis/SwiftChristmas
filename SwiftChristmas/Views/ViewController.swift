//
//  ViewController.swift
//  SwiftChristmas
//
//  Created by Angelos Staboulis on 16/11/23.
//

import UIKit
import AVKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Helper.shared.playJingleBell(view: view)
        view.layer.addSublayer(Helper.shared.createLayer(view:view))
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    
    }

}

