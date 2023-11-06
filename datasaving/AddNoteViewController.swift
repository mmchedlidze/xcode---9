//
//  AddNoteViewController.swift
//  datasaving
//
//  Created by Mariam Mchedlidze on 05.11.23.
//

import UIKit

protocol AddNoteDelegate: AnyObject {
    func didAddNote(_ note: String)
}

class AddNoteViewController: UIViewController {
    
    weak var delegate: AddNoteDelegate?
    
    let noteTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your note"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
        UIconstraints()
    }
    
    private func UISetup() {
        view.backgroundColor = .white
        view.addSubview(noteTextField)
        view.addSubview(saveButton)
    }
    
    private func UIconstraints() {
        NSLayoutConstraint.activate([
            noteTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            noteTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            noteTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            noteTextField.heightAnchor.constraint(equalToConstant: 40),
            saveButton.topAnchor.constraint(equalTo: noteTextField.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func saveNote() {
        guard let newNote = noteTextField.text, !newNote.isEmpty else {
            return
        }
        
        delegate?.didAddNote(newNote)
        navigationController?.popViewController(animated: true)
    }
}

