//
//  Universal  TableViewCell.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 12.01.2022.
//

import UIKit

let topAndButtomConstrain: CGFloat = 5

class Universal__TableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarView: UIView!
    
    var completion: (()->Void)?
    
    override func prepareForReuse() {
        mainImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
        completion = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(image: UIImage?, name: String?, description: String?) {
        nameLabel.text = name
        descriptionLabel.text = description
        mainImageView.frame = avatarView.bounds
        
        makeShadow()
    }
    
    func configure(friend: Friends, completion: @escaping ()->Void) {
        let image = loadImage(urlString: friend.photo50)
        mainImageView.image = image
        nameLabel.text = String(friend.firstName) + String(friend.lastName)
        descriptionLabel.text = ""
        self.completion = completion
        
        makeShadow()
    }
    
    func configure(group: Groups, completion: @escaping ()->Void) {
        let image = loadImage(urlString: group.photo)
        mainImageView.image = image
        nameLabel.text = group.name
        descriptionLabel.text = ""
        self.completion = completion
        
        makeShadow()
    }
    
    func makeShadow() {
        avatarView.layer.cornerRadius = (heightForCellTableView - 2 * topAndButtomConstrain)/2
        mainImageView.layer.cornerRadius = avatarView.layer.cornerRadius
    }
    
    func loadImage(urlString: String) -> UIImage? {
        let url = URL(string: urlString)
        if let data = try? Data(contentsOf: url!) {
            return UIImage(data: data)
        } else {
            return UIImage(named: "1")
        }
    }
    
    @IBAction func pressToViewButton(_ sender: Any) {
        UIView.animate(withDuration: 2) {[weak self] in
            self?.avatarView.frame = CGRect(x: Double(heightForCellTableView/4),
                                            y: Double(heightForCellTableView/4),
                                            width: Double(heightForCellTableView/32),
                                            height: Double(heightForCellTableView/32))
           
        } completion: { [weak self] _ in
            self?.completion?()
        }
    }
}
