//
//  ViewController.swift
//  Horoscopo-ios
//
//  Created by Mananas on 6/11/25.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
 
        var filteredHoroscopeList: [Horoscope] = []
        var isSearching = false
    
    
    let horoscopeList :[Horoscope] = Horoscope.getAll()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.keyboardDismissMode = .onDrag

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HoroscopeCell", for: indexPath) as! HoroscopeViewCell
        let horoscope = horoscopeList[indexPath.row]
        cell.render(horoscope)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NavigateToDetail" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let horoscope = horoscopeList[indexPath.row]
            detailVC.horoscope = horoscope
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                isSearching = false
                tableView.reloadData()
            } else {
                isSearching = true
                filteredHoroscopeList = horoscopeList.filter {
                    $0.name.lowercased().contains(searchText.lowercased())
                }
                tableView.reloadData()
            }
        }
}

