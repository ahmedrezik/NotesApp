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
    
    static var myNotes:[Notes] = []
    
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "homeBG"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Notes"
        label.font = UIFont(name: "Helvetica", size: 38)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var NotesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var childrenViews = [UIView]()
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .black
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        self.prepareUI()
    }
    @objc func addNote(sender: UIButton) {
    
        self.present(AddNoteVC(), animated: true)
    }
    
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
extension NotesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotesVC.myNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell") as? NoteCell {
            let note = NotesVC.myNotes[indexPath.row]
            cell.NoteTitleLabel.text = note.Title
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            cell.DateLabel.text = formatter.string(from: note.NoteDate)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        let note = NotesVC.myNotes[indexPath.row]
        let dest = NoteDetailView()
        dest.Name.text = note.Title
        dest.Note.text = note.NoteText
      //navigationController?.pushViewController(dest, animated: false)

       self.present(dest, animated: true, completion: nil)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return 300
//        }else{
//            if self.view.bounds.width > self.view.bounds.height {
//                return self.view.bounds.height*0.95
//            }else{
//                return self.view.bounds.height*0.55
//            }
//        }
//    }
}
