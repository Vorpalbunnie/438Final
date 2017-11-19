//
//  finalExamSchedule.swift
//  scheduled
//
//  Created by labuser on 11/18/17.
//  Copyright © 2017 labuser. All rights reserved.
//

import Foundation
import UIKit

let cellIdentifier = "finalsCell"

class FinalExamTableViewController: UITableViewController{
    
    
    @IBOutlet var examTable: UITableView!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    @IBAction func returnToSchedule(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("num of rows \(tableView.numberOfRows(inSection: 0))")
        print("cell identifier \(cellIdentifier)")

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FinalExamCell else {
            fatalError("how did you do this again?")
        }
        cell.drawCell()
        

        
        return cell
        
    }
    
    
    
    
}
