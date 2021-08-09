//
//  TVA_Presenter.swift
//  La Riba
//
//  Created by Dalgat Alibekov on 2/22/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import Foundation
import UIKit

final class TVA_Presenter: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let sections: [TVA_Section]
    
    init(sections: [TVA_Section]) {
        self.sections = sections
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sections[section].viewForFooter
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sections[section].heightForFooter
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].heightForHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].cells[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = sections[indexPath.section].cells[indexPath.row]
        
        return cell.assemble(for: tableView, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        sections[indexPath.section].cells[indexPath.row]
            .didSelectRow(tableView: tableView, at: indexPath)
    }
}

