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
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "detail"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var Name: UITextField = {
        let txt = UITextField()
        //txt.placeholder = "Enter Note's Name"
       
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    var SaveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "save"), for: .normal)
        button.tintColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var Note: UITextView = {
        let field = UITextView()
        field.isEditable = true
        field.font = UIFont(name: "Chalkduster", size: 28)
        field.backgroundColor = UIColor.clear
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        
        prepareUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        // navigationController?.interactivePopGestureRecognizer?.delegate = nil
         self.navigationItem.title = Name.text
        self.Name.text = ""
        self.navigationController?.isNavigationBarHidden = false
       
    }
    
        
       
    
    
   
    func prepareUI(){
         SaveButton.addTarget(self, action: #selector(goBackHandler(sender:)), for: .touchUpInside)
        view.addSubview(backgroundImageView)
        view.addSubview(Name)
        view.addSubview(Note)
        view.addSubview(SaveButton)
        
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
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
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: SaveButton.bottomAnchor, constant: -18),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: SaveButton.trailingAnchor, constant: 10)

            
            ])
        
    }
    @objc func goBackHandler(sender: UIButton) {
        NotesVC.myNotes[indexrow].NoteText = Note.text
       // self.dismiss(animated: true)
        
    }
    
    
}
