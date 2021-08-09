//
//  TVA_Section.swift
//  La Riba
//
//  Created by Dalgat Alibekov on 2/22/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//


import Foundation
import UIKit

protocol TVA_Cell: class {
    
    var cellHeight: CGFloat { get }
    
    var cellIdentifier: String { get }
    
    func configCell(_ cell: UITableViewCell)
    
    func assemble(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    
    func didSelectRow(tableView: UITableView, at indexPath: IndexPath)
}

extension TVA_Cell {
    
    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    func assemble(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        configCell(cell)
        
        return cell
    }
    
    func configCell(_ cell: UITableViewCell) {}
    func didSelectRow(tableView: UITableView, at indexPath: IndexPath){}
}
