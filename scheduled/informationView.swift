//
//  informationView.swift
//  scheduled
//
//  Created by labuser on 11/18/17.
//  Copyright © 2017 labuser. All rights reserved.
//

import Foundation
import UIKit


class InformationViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var button: UIButton!
    @IBAction func returnToWhenceYeCame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
