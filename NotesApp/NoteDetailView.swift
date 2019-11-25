//
//  NoteDetailView.swift
//  NotesApp
//
//  Created by Ahmed Rezik on 11/22/19.
//  Copyright © 2019 Ahmed Rezik. All rights reserved.
//

import Foundation
import UIKit
class NoteDetailView: UIViewController{
    
    var indexrow:Int  = -1
    
    var Name: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter Note's Name"
       
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    var SaveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "save"), for: .normal)
        button.tintColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var Note: UITextView = {
        let field = UITextView()
        field.isEditable = true
        field.backgroundColor = UIColor.white
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        prepareUI()
    }
    override func viewWillAppear(_ animated: Bool) {
         navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
        
       
    
    
   
    func prepareUI(){
         SaveButton.addTarget(self, action: #selector(goBackHandler(sender:)), for: .touchUpInside)
        
        view.addSubview(Name)
        view.addSubview(Note)
        view.addSubview(SaveButton)
        
        NSLayoutConstraint.activate([
            
            Note.topAnchor.constraint(equalTo: Name.bottomAnchor, constant: 25),
            Note.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            Note.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            Note.bottomAnchor.constraint(equalTo: SaveButton.topAnchor, constant: -20),
            
            Name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            Name.bottomAnchor.constraint(equalTo: Note.topAnchor , constant: -25),
            Name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            Name.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            SaveButton.topAnchor.constraint(equalTo: Note.bottomAnchor, constant: -15),
            SaveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: SaveButton.bottomAnchor, constant: -15),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: SaveButton.trailingAnchor, constant: 10)

            
            ])
        
    }
    @objc func goBackHandler(sender: UIButton) {
        NotesVC.myNotes[indexrow].NoteText = Note.text
        self.present(NotesVC(), animated: true)
        
    }
    
    
}
