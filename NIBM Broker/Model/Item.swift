//
//  Item.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-01.
//

import SwiftUI

struct Item: Identifiable {
    
    var id: String
    var item_type: String
    var item_cost: NSNumber
    var item_size: NSNumber
    var item_image: String
    var item_district: String
    var item_town: String
}

