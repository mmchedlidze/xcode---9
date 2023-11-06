//
//  ViewController.swift
//  datasaving
//
//  Created by Mariam Mchedlidze on 05.11.23.
//

import UIKit

class NoteListViewController: UIViewController {
    var notes: [String] = ["note1", "note2"]
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewSetup()
        tableviewConstraints()
        setupNavigationBar()
    }
    
    // MARK - Tableview Setup
    
    private func tableviewSetup() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "noteCell")
    }
    
    private func tableviewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK - Functions
    internal func didUpdateNote(_ updatedNote: String) {
        let noteDetailsVC = NoteDetailsViewController()
        
        if let selectedNote = noteDetailsVC.selectedNote, let index = notes.firstIndex(of: selectedNote), selectedNote != updatedNote {
            notes[index] = updatedNote
            tableView.reloadData()
        }
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNoteTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addNoteTapped() {
        let addNoteVC = AddNoteViewController()
        addNoteVC.delegate = self
        navigationController?.pushViewController(addNoteVC, animated: true)
    }
}

// MARK - Extensions
extension NoteListViewController: AddNoteDelegate {
    func didAddNote(_ note: String) {
        notes.append(note)
        tableView.reloadData()
    }
}
extension NoteListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNote = notes[indexPath.row]
        let noteDetailsVC = NoteDetailsViewController()
        noteDetailsVC.selectedNote = selectedNote
        noteDetailsVC.delegate = self
        navigationController?.pushViewController(noteDetailsVC, animated: true)
    }
}
extension NoteListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
}
extension NoteListViewController: NoteDetailsDelegate {
}
