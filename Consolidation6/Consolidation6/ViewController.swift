//
//  ViewController.swift
//  Consolidation6
//
//  Created by Immanuel Matthews-Feemster on 8/4/23.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       let jsonData = readJSONFile(forName: "consolidation6data")
        if let data = jsonData {
            countries = parse(jsonData: data)!.countries
            print("\(countries[0])")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = "\(countries[indexPath.row].name)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.country = countries[indexPath.row]
            vc.countryStatsCount = Mirror(reflecting: countries[indexPath.row]).children.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func readJSONFile(forName name: String) -> Data? {
        do {
                if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                    let fileUrl = URL(fileURLWithPath: filePath)
                    let data = try Data(contentsOf: fileUrl)
                    return data
                }
            } catch {
                print("error: \(error)")
            }
        return nil
        }
    
    func parse(jsonData: Data) -> Countries? {
        do {
            let decodedData = try JSONDecoder().decode(Countries.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
}
