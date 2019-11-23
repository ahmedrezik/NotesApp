//
//  NoteCell.swift
//  NotesApp
//
//  Created by Ahmed Rezik on 11/22/19.
//  Copyright © 2019 Ahmed Rezik. All rights reserved.
//

import Foundation
import UIKit

class NoteCell: UITableViewCell{
    
    var cellContentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 35
        view.layer.masksToBounds = true
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var NoteTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 25)
        label.numberOfLines = 3
        label.text = "The Note"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
  
    

    

    
    var DateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 22)
        label.text = Date().description
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var childrenViews = [UIView]()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        backgroundColor = .clear
        
        self.prepareCellUI()
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func prepareCellUI() {
        childrenViews = [cellContentView, NoteTitleLabel, DateLabel]
        childrenViews.forEach { childView in
            if childView == cellContentView {
                addSubview(childView)
            }else{
                cellContentView.addSubview(childView)
            }
        }
        
        NSLayoutConstraint.activate([
            // MARK:- Cell content view constraints
            cellContentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cellContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            cellContentView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            cellContentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
         
            // MARK:- Note title label constraints
            NoteTitleLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 16),
            NoteTitleLabel.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            NoteTitleLabel.widthAnchor.constraint(lessThanOrEqualTo: cellContentView.widthAnchor, multiplier: 0.7),
            NoteTitleLabel.heightAnchor.constraint(lessThanOrEqualTo: cellContentView.heightAnchor, multiplier: 0.35),
            
    
          
            
            // MARK:- Date label constraints
            DateLabel.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -5),
            DateLabel.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            DateLabel.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16)
            
            ])
        
    }
    
}
