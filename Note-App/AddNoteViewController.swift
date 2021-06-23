//
//  AddNoteViewController.swift
//  Note-App
//
//  Created by Maxim Bekmetov on 23.06.2021.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    var note: Note?
    var update = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if update == true {
            titleTextField.text = note?.title
            bodyTextView.text = note?.note
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if update == false {
            self.deleteButton.isEnabled = false
            self.deleteButton.title = ""
        }
    }
    
    @IBAction func saveClick(_ sender: Any) {
        if update == true {
            APIFunctions.function.addNote(date: "Placeholder", title: titleTextField.text!, note: bodyTextView.text)
        } else {
            APIFunctions.function.updateNote(date: "Placeholder", title: titleTextField.text!, note: bodyTextView.text, id: note!._id)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteClick(_ sender: Any) {
        APIFunctions.function.deleteNote(id: note!._id)
        self.navigationController?.popViewController(animated: true)
    }
}
