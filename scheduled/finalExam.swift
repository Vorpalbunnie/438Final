//
//  finalExam.swift
//  scheduled
//
//  Created by labuser on 11/18/17.
//  Copyright © 2017 labuser. All rights reserved.
//

import Foundation
import UIKit

final class FinalExamCell: UITableViewCell {
    
    //Mark Properties
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //Mark: types
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    
    var className: String = ""
    var startTime : String = "2017-05-20 13:00:00"
    var endTime : String = "2017-05-20 15:00:00"
    var location : String = ""
    
    
    
    func setUp(_ name: String,_ start: String,_ favorName: String, _ end: String){
        self.className = name
        self.startTime = start
        self.endTime = end
        self.location = favorName
    }
    
    func drawCell(){
        classNameLabel.text = className
        locationLabel.text = location
        startTimeLabel.text = startTime
        endTimeLabel.text = endTime
    }
    

    
}
