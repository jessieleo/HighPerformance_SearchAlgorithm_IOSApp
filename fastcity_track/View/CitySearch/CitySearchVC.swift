//
//  CitySearchVC.swift
//  fastcity_track
//
//  Created by Seyit on 09.03.2021.
//


import UIKit

class CitySearchVC: UITableViewController, UISearchResultsUpdating {
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        addSearchToNavigationBar()
        tableView.register(CitySearchCell.self, forCellReuseIdentifier: CitySearchCell.identifier)
    }
    
    fileprivate func addSearchToNavigationBar() {
        let search = UISearchController(searchResultsController: nil)
        navigationItem.searchController = search
        search.searchBar.placeholder = "Search Here"
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    fileprivate func initializeViewModelWith(_ city: City) -> CityViewModel {
        .init(with: city)
    }
}

// MARK: - UITableView Methods

extension CitySearchVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        CitySearchManager.shared.ranges.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CitySearchManager.shared.ranges[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CitySearchCell.identifier, for: indexPath) as! CitySearchCell
        let startIndex = CitySearchManager.shared.ranges[indexPath.section].startIndex
        let city = CitySearchManager.shared.cities[indexPath.section][indexPath.row + startIndex]
        cell.cityViewModel = initializeViewModelWith(city)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        tableView.deselectRow(at: indexPath, animated: true)
        let startIndex = CitySearchManager.shared.ranges[indexPath.section].startIndex
        let city = CitySearchManager.shared.cities[indexPath.section][indexPath.row + startIndex]
        let mapLocationVC = MapLocationVC(with: initializeViewModelWith(city))
        navigationController?.pushViewController(mapLocationVC, animated: true)
    }
}

// MARK: - UISearchResultsUpdating

extension CitySearchVC {

    func updateSearchResults(for searchController: UISearchController) {
        CitySearchManager.shared.filter(search: searchController.searchBar.text!)
        tableView.reloadData()
        let index = searchController.searchBar.text?.initial?.index ?? NSNotFound
        if tableView.numberOfSections >= index, tableView.numberOfRows(inSection: index) > 0 {
            DispatchQueue.main.async {
                self.tableView.scrollToRow(at: .init(item: 0, section: index),
                                           at: .top,
                                           animated: true)
            }
        } else if searchController.searchBar.text?.isEmpty == true {
            self.tableView.scrollToRow(at: .init(row: 0, section: 0), at: .top, animated: false)
        }
    }
}
