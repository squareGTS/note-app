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
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(note?.title)
        
        titleTextField.text = note?.title
        bodyTextView.text = note?.note
    }
    
    
    @IBAction func saveClick(_ sender: Any) {
        APIFunctions.function.AddNote(date: "Placeholder", title: titleTextField.text!, note: bodyTextView.text)
        
    }
    

}
