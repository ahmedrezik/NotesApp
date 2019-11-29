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
    
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "addNote"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
        field.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.92)
        field.layer.cornerRadius = 15
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var SaveButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = UIColor.clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "save"), for: .normal)
       
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        prepareUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        
        
       // prepareUI()
    }
    
    
    
    func prepareUI(){
        SaveButton.addTarget(self, action: #selector(SaveNote(sender:)), for: .touchUpInside)
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(Name)
        view.addSubview(Note)
        view.addSubview(SaveButton)
        
        NSLayoutConstraint.activate([
            
            //MARK: Backgorund Image constraints
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            //MARK: Name constraints
            Name.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            Name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
        Name.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            Name.bottomAnchor.constraint(equalTo: Note.topAnchor, constant: -40),
            
            
            
            //MARK: Title Label constraints
            titleLabel.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
           
            
                //MARK: Note constraints
            Note.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            Note.bottomAnchor.constraint(equalTo: SaveButton.topAnchor, constant: -20),
            Note.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            Note.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            //MARK: Save Button constraints
            SaveButton.topAnchor.constraint(equalTo: Note.bottomAnchor, constant: -15),
            SaveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: SaveButton.bottomAnchor, constant: -18),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: SaveButton.trailingAnchor, constant: 10)
            
            
            
            
            
            ])
    }
    
    
    @objc func SaveNote(sender: UIButton){
       
        let note:Notes = Notes(title: Name.text!, text: Note.text!)
       
        //MARK: User defualts handlinng
        let userDefaults = UserDefaults.standard
         let decoded = userDefaults.data(forKey: "SavedNotes")
        var notesArray = try? JSONDecoder().decode(Array<Notes>.self, from: decoded!)
            notesArray?.append(note)
            let encoded:Data = try! JSONEncoder().encode(notesArray)
                   userDefaults.set(encoded, forKey: "SavedNotes")
        
        
        
       
        
        
        
        //Dismiss View
              self.dismiss(animated: true)
        
      //Post a Notification
        NotificationCenter.default.post(name: Notification.Name("didAddNote"), object: nil)
    
        
     


                 
                 
               
        }
      
        
        
        
          //  UserDefaults.standard.set([], forKey: "UserNotes")
        
        
         
        
        
        
  
        
    }
    
    
    

