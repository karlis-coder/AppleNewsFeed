//
//  Item.swift
//  AplleNewsFeed
//
//  Created by Karlis Butins on 12/02/2021.
//

import UIKit
import Gloss


class Item: JSONDecodable{
    
    var description: String
    var title: String
    var url: String
    var urlToImage: String
    var image: UIImage?
    
    required init?(json: JSON) {
        self.title = "title" <~~ json ?? ""
        self.description = "description" <~~ json ?? ""
        self.url = "url" <~~ json ?? ""
        self.urlToImage = "urlToImage" <~~ json ?? ""
        DispatchQueue.main.async {
            self.image = self.loadImage()
        }
    }
    
    private func loadImage() -> UIImage? {
        var returnImage: UIImage?
        
        guard let url = URL(string: urlToImage) else {
            return returnImage
        }
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data){
                returnImage = image
            }
        }
        
        return returnImage
    }
    
}
