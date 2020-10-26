//
//  CustomCell.swift
//  getJsonFile
//
//  Created by 土橋正晴 on 2020/10/25.
//

import UIKit


final class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    func setUp(name: String?, image: String?) {
        
        if let name = name {
            cellLabel?.text = name
        }
        
        
        if let image = image?.replacingOccurrences(of: "data:image/jpeg;base64,", with: ""),
           let data = Data(base64Encoded: image, options: .ignoreUnknownCharacters)  {
            cellImageView?.image = UIImage(data: data)
        } else if let image = image?.replacingOccurrences(of: "data:image/png;base64,", with: ""),
                  let data = Data(base64Encoded: image, options: .ignoreUnknownCharacters)  {
            cellImageView?.image = UIImage(data: data)
        } else {
            cellImageView?.backgroundColor = .lightGray
        }
        
    }
    
    
    override func prepareForReuse() {
        super .prepareForReuse()
        cellImageView?.image = nil
        cellImageView?.backgroundColor = .white
    }

}
