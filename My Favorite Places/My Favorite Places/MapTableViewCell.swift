//
//  MapTableViewCell.swift
//  My Favorite Places
//
//  Created by manbhand on 1/25/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteNameLabel: UILabel!
    
    
    @IBOutlet weak var favoriteMapView: MKMapView!
}
