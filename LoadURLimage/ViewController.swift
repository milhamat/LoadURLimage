//
//  ViewController.swift
//  LoadURLimage
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 17/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fotoImageView: UIImageView!
    
    let imageUrl: String = "https://image.blockbusterbd.net/00416_main_image_04072019225805.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImageToImageView()
    }
    
    func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()){
        let session = URLSession.shared
        let url = URL(string: urlString)
        let dataTask = session.dataTask(with: url!) {data, response, error in
            if error != nil {
                print("Error fetching the image ❗️")
                completionHandler(nil)
            } else {
                completionHandler(data)
            }
        }
        dataTask.resume()
    }
    
    func setImageToImageView(){
        fetchImage(from: imageUrl) { (imageData) in
            if let data = imageData {
                DispatchQueue.main.async {
                    self.fotoImageView.image = UIImage(data: data)
                }
            } else {
                print("Error loading image")
            }
        }
    }
}

