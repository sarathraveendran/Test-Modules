//
//  TestViewController.swift
//  ModuleTest
//
//  Created by apple on 22/01/17.
//  Copyright © 2017 Sarath Raveendran. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    // MARK: Connection Objects
    @IBOutlet weak var imageView: UIImageView!
    
    
    // Declaration
    let networkHandler = NetworkHandler.sharedInstance
    
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        //loadData()
        uploadImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func configureView() {
    
        self.imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TestViewController.chooseImage(_:)))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    
    // MARK: Load data from server
    func loadData() {
        
        /*
        networkHandler.get(url: ApiConnection.sharedInstance.feeds, params: ["term": "games"], requestType: URLRequestType.url, showLoader: false) { (networkStatus, response) in
            
            if !networkStatus {
                if logActivity { print("No connection") }
                return
            }
            
            if let _response = response {
                print(_response)
            }
            
        }*/
        
        
        networkHandler.download(url: ApiConnection.sharedInstance.feeds, params: ["term": "games"], showLoader: false) { (networkStatus, response) in
            
            if !networkStatus {
                if logActivity { print("No connection") }
                return
            }
            
            if let _response = response {
                print(_response)
            }
            
        }
        
    }

    func chooseImage(_ sender: UITapGestureRecognizer) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func uploadImage() {
        
        networkHandler.mutliPartPost(url: ApiConnection.sharedInstance.upload, params: ["firstName": "Sergy", "lastName": "BoomBoom", "userId": "9"], image: imageView.image!) { (networkStatus, response) in
            print("\n\n\n\(response)")
        }
    }
    
    
}


extension TestViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
