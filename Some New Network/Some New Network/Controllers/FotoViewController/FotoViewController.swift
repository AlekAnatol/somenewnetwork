//
//  FotoViewController.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 15.01.2022.
//

import UIKit

class FotoViewController: UIViewController {
    
    private var foto = String()
    
    func configure(fotoPath: String) {
        foto = fotoPath
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.8604469895, blue: 0.9112007022, alpha: 1)
        let imageView = UIImageView(frame: CGRect(x: 0, y: self.view.bounds.height/2 - self.view.bounds.width/2, width: self.view.bounds.width, height: self.view.bounds.width))
        self.view.addSubview(imageView)
        imageView.image = UIImage(named: foto)
    
    }
}
