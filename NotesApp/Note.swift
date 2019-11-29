//
//  Note.swift
//  NotesApp
//
//  Created by Ahmed Rezik on 11/22/19.
//  Copyright © 2019 Ahmed Rezik. All rights reserved.
//

import Foundation
import UIKit

class Notes:Codable{
    
    
    var Title:String
    var NoteText:String
    var NoteDate: String
    
    
    public init(title:String, text:String){
        
        self.Title = title
        self.NoteText = text
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        self.NoteDate = formatter.string(from:  Date(timeIntervalSinceNow: 0))
           
        
    }
    enum CodingKeys: String, CodingKey {
          case Title
          case NoteText
          case NoteDate
      }
    
    
   
        
    
}
extension Notes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Title, forKey: .Title)
        try container.encode(NoteText, forKey: .NoteText)
        try container.encode(NoteDate, forKey: .NoteDate)
    
    }
}
