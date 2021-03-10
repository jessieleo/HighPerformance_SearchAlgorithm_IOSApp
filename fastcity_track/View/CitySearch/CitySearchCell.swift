//
//  CitySearchCell.swift
//  fastcity_track
//
//  Created by Seyit on 09.03.2021.
//

import UIKit

class CitySearchCell: UITableViewCell {
    
    static let identifier = "CitySearchCell"
    
    var cityViewModel: CityViewModel! {
        didSet {
            textLabel?.text = cityViewModel.cityAndCountry
            detailTextLabel?.text = cityViewModel.coordinateDetail
            accessoryType = .disclosureIndicator
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
     }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
