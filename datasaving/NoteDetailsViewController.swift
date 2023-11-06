//
//  NoteDetailsViewController.swift
//  datasaving
//
//  Created by Mariam Mchedlidze on 05.11.23.
//

import UIKit

protocol NoteDetailsDelegate: AnyObject {
    func didUpdateNote(_ updatedNote: String)
}

class NoteDetailsViewController: UIViewController {
    var selectedNote: String?
    var noteTextField = UITextField()
    weak var delegate: NoteDetailsDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        noteTextField = UITextField(frame: CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 40))
        noteTextField.text = selectedNote
        noteTextField.borderStyle = .roundedRect
        noteTextField.textAlignment = .center
        view.addSubview(noteTextField)

        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.frame = CGRect(x: 20, y: 160, width: view.bounds.width - 40, height: 40)
        saveButton.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        view.addSubview(saveButton)
    }

    @objc func saveNote() {
        if let updatedNote = noteTextField.text, !updatedNote.isEmpty {
            delegate?.didUpdateNote(updatedNote)
            navigationController?.popViewController(animated: true)
        }
    }
}

