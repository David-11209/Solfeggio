//
//  TheoryViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.05.2024.
//

import UIKit

protocol TheoryViewModelProtocol {
    func setData(text: String, image: UIImage)
    func getData() -> (String, UIImage)
}

class TheoryViewModel: TheoryViewModelProtocol {

    private var text: String = ""
    private var image: UIImage = UIImage()

    func setData(text: String, image: UIImage) {
        self.text = text
        self.image = image
    }

    func getData() -> (String, UIImage) {
        return (text, image)
    }
}
