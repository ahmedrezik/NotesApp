//
//  NotesVC.swift
//  NotesApp
//
//  Created by Ahmed Rezik on 11/22/19.
//  Copyright © 2019 Ahmed Rezik. All rights reserved.
//

import Foundation
import UIKit

class NotesVC: UIViewController {
    //Populating the TableView
  
    
    static var myNotes:[Notes] = [Notes(title: "Ahmed", text: "Developed with Love")]
        
    
    //MARK: background image
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "homeBG"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: "My Notes" Lael
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Notes"
        label.font = UIFont(name: "Helvetica", size: 38)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Add Note Button
    var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: TableView containing Notes
    var NotesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: The subviews to be added to the Main View
    var childrenViews = [UIView]()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
      

        self.navigationController?.isNavigationBarHidden = true
        if let decoded = UserDefaults.standard.data(forKey: "SavedNotes"){
               if let arr = try? JSONDecoder().decode(Array<Notes>.self, from: decoded){
                   print("Added")
                   NotesVC.myNotes = arr
               }
        }
        
        let encoded:Data = try! JSONEncoder().encode(NotesVC.myNotes)
        UserDefaults.standard.set(encoded, forKey: "SavedNotes")

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                NotificationCenter.default.addObserver(self, selector: #selector(didUserAddNote), name: Notification.Name("didAddNote"), object: nil)
        

        
        self.prepareUI()
    }
    
    //MARK: The Notification Method
    
    @objc func didUserAddNote() {
        
        //User Defaults update
        if let decoded = UserDefaults.standard.data(forKey: "SavedNotes"){
        if let arr = try? JSONDecoder().decode(Array<Notes>.self, from: decoded){
            print("Added")
            NotesVC.myNotes = arr 
        }
        else{
            print("empty")
            NotesVC.myNotes = []
        }
        }

        NotesTableView.reloadData()
        }
    
    @objc func addNote(sender: UIButton) {
    
        self.present(AddNoteVC(), animated: true)
       
    }
    
    
    //MARK: Set up the connstraints of the View
    func prepareUI() {
        addButton.addTarget(self, action: #selector(addNote(sender:)), for: .touchUpInside)
        
        NotesTableView.delegate = self
        NotesTableView.dataSource = self
        NotesTableView.register(NoteCell.self, forCellReuseIdentifier: "NoteCell")
        
        childrenViews = [backgroundImageView, titleLabel, addButton, NotesTableView]
        
        childrenViews.forEach { childView in
            view.addSubview(childView)
        }
        
        NSLayoutConstraint.activate([
            // MARK:- Background image view constraints
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // MARK:- Title label constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            // MARK:- Add button constraints
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor),
            addButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // MARK:- Clock table view constraints
            NotesTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            NotesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            NotesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            NotesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            ])
    }
    
    
    
    

    
    
    
    
    
}

//MARK: TableView conformation methods
extension NotesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotesVC.myNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell") as? NoteCell {
            let note = NotesVC.myNotes[indexPath.row]
            cell.NoteTitleLabel.text = note.Title
            cell.DateLabel.text = note.NoteDate
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        let note = NotesVC.myNotes[indexPath.row]
        let dest = NoteDetailView()
        dest.Name.text = note.Title
        dest.Note.text = note.NoteText
        dest.indexrow = indexPath.row
        let selectedRow: IndexPath? = tableView.indexPathForSelectedRow
        if let selectedRowNotNill = selectedRow {
               tableView.deselectRow(at: selectedRowNotNill, animated: true)
           }
      navigationController?.pushViewController(dest, animated: true)
      
    }
    

}
