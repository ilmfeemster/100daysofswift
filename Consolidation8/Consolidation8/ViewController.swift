//
//  ViewController.swift
//  Consolidation8
//
//  Created by Immanuel Matthews-Feemster on 8/14/23.
//

import UIKit

class ViewController: UITableViewController {
    let notes = ["a", "b", "c", "1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Note") as? DetailViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

