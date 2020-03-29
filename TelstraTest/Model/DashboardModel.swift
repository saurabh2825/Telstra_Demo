//
//  DashboardModel.swift
//  TelstraTest
//
//  Created by saurabh suman on 28/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import UIKit

struct DashboardModel:Codable {
    
    let title:String?
    let rows:[Rows]?
}

struct Rows:Codable {
   
    let title:String?
    let description:String?
    let imageHref:String?
}


