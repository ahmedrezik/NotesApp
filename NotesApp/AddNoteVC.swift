//
//  AddNoteVC.swift
//  NotesApp
//
//  Created by Ahmed Rezik on 11/22/19.
//  Copyright © 2019 Ahmed Rezik. All rights reserved.
//

import Foundation
import UIKit

class AddNoteVC: UIViewController{
    
    var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Add Note"
        label.font = UIFont(name: "Helvetica", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var Name: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter Note's Name"
       
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var Note: UITextView = {
        let field = UITextView()
        field.isEditable = true
        field.backgroundColor = UIColor.lightGray
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var SaveButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "save"), for: .normal)
       
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        prepareUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
       // prepareUI()
    }
    
    
    
    func prepareUI(){
        SaveButton.addTarget(self, action: #selector(SaveNote(sender:)), for: .touchUpInside)
        view.addSubview(titleLabel)
        view.addSubview(Name)
        view.addSubview(Note)
        view.addSubview(SaveButton)
        
        NSLayoutConstraint.activate([
            //MARK: Name constraints
            
            Name.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            Name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            Name.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            Name.bottomAnchor.constraint(equalTo: Note.topAnchor, constant: -40),
            
            
            
            
            titleLabel.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            //titleLabel.bottomAnchor.constraint(equalTo: Name.topAnchor, constant: -15),
            

            Note.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            Note.bottomAnchor.constraint(equalTo: SaveButton.topAnchor, constant: -20),
            Note.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            Note.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            SaveButton.topAnchor.constraint(equalTo: Note.bottomAnchor, constant: -15),
            SaveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: SaveButton.bottomAnchor, constant: -15),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: SaveButton.trailingAnchor, constant: 10)
            
            
            
            
            
            ])
    }
    
    
    @objc func SaveNote(sender: UIButton){
       
        let note:Notes = Notes(title: Name.text!, text: Note.text!, color: UIColor.red)
        NotesVC.myNotes.append(note)
        self.present(NotesVC(), animated: true, completion: nil)
        
    }
    
    
    
}
