//
//  ViewController.swift
//  Project7
//
//  Created by Immanuel Matthews-Feemster on 7/6/23.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(showCredit), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(promptForSearch))
        
        getUrlString()
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
                parse(json: data)
                return
            }
        } else {
            showError()
        }
    }
    
    func parse(json: Data, searchTerm: String = ""){
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetitions.results
            filteredPetitions = petitions
            tableView.reloadData()
        }
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading Error", message: "There was an error loading the feed. Please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func showCredit() {
        let ac = UIAlertController(title: "Credit", message: "These comments are sourced from the political website I am too lazy to look up.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Close", style: .default))
        present(ac, animated: true)
    }
    
    @objc func promptForSearch() {
        let ac = UIAlertController(title: "Enter Search Term", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitSearch = UIAlertAction(title: "Search", style: .default){
            [weak self, weak ac] action in
            guard let search = ac?.textFields?[0].text else {return}
            self?.submit(search)
        }
        ac.addAction(submitSearch)
        present(ac, animated: true)
    }
    func submit(_ searchTerm: String){
        filteredPetitions = filterPetitions(petitions: filteredPetitions, searchTerm: searchTerm)
        tableView.reloadData()
    }
    func getUrlString(){
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
    }
    func filterPetitions(petitions: [Petition], searchTerm: String) -> [Petition]{
        let caseInsensitiveSearch = searchTerm.lowercased()
        var petitionsCopy: [Petition] = []
        if searchTerm == ""{
            return petitions
        } else {
            for i in 0..<petitions.count {
                if petitions[i].title.lowercased().contains(caseInsensitiveSearch){
                    petitionsCopy.append(petitions[i])
                }
            }
            return petitionsCopy
        }
    }
}

