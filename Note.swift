//
//  Note.swift
//  NotesApp
//
//  Created by Ahmed Rezik on 11/22/19.
//  Copyright © 2019 Ahmed Rezik. All rights reserved.
//

import Foundation
import UIKit

class Notes{
    
    
    var Title:String
    var NoteText:String
    var BgColor: UIColor
    var NoteDate: Date
    
    
    public init(title:String, text:String, color:UIColor){
        
        self.Title = title
        self.NoteText = text
        self.BgColor = color
        self.NoteDate = Date(timeIntervalSinceNow: 0)
        
    }
}
