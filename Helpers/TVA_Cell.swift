//
//  TVA_Cell.swift
//  La Riba
//
//  Created by Dalgat Alibekov on 2/22/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import UIKit

class TVA_Section {
    
    var cells: [TVA_Cell]
    var viewForFooter: UIView?
    var viewForHeader: UIView?
    var heightForFooter: CGFloat = UITableView.automaticDimension
    var heightForHeader: CGFloat = UITableView.automaticDimension
    var titleForHeader: String?
    
    init(cells: [TVA_Cell] = []) {
        self.cells = cells
    }
}
