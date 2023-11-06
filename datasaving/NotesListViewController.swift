import UIKit

class NoteListViewController: UIViewController, AddNoteDelegate, UITableViewDelegate, UITableViewDataSource, NoteDetailsDelegate {
    func didUpdateNote(_ updatedNote: String) {
        updatedNote
    }
    
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
    
    func tableviewSetup() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "noteCell")
    }
    
    func tableviewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNoteTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addNoteTapped() {
        let addNoteVC = AddNoteViewController()
        addNoteVC.delegate = self
        navigationController?.pushViewController(addNoteVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedNote = notes[indexPath.row]
            let noteDetailsVC = NoteDetailsViewController()
            noteDetailsVC.selectedNote = selectedNote
            noteDetailsVC.delegate = self 
            navigationController?.pushViewController(noteDetailsVC, animated: true)
        }
    
    func didAddNote(_ note: String) {
        notes.append(note)
        tableView.reloadData()
    }
}
