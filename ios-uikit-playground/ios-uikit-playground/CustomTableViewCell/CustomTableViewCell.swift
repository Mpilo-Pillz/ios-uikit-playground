//
//  CustomTableViewCell.swift
//  ios-uikit-playground
//
//  Created by Mpilo Pillz on 2023/01/07.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
