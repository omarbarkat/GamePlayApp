//
//  LoadImage.swift
//  GamePlay
//
//  Created by eng.omar on 14/08/2024.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String, placeholder: UIImage? = nil, completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
        guard let url = URL(string: urlString) else {
            self.image = placeholder
            return
        }

        self.kf.setImage(with: url, placeholder: placeholder, options: nil, completionHandler: { result in
            switch result {
            case .success(let value):
                print("Image successfully loaded: \(value.image)")
            case .failure(let error):
                print("Error loading image: \(error)")
            }
            completion?(result)
        })
    }
}

