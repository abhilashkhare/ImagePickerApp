//
//  ViewController.swift
//  ImagePickerApp
//
//  Created by Abhilash Khare on 10/2/17.
//  Copyright © 2017 Abhilash Khare. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var cameraButton : UIBarButtonItem!
    @IBOutlet var topTextField : UITextField!
    @IBOutlet var bottomTextField : UITextField!
    @IBOutlet weak var imageDisplay: UIImageView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
      topTextField.text = "TOP"
      bottomTextField.text = "BOTTOM"
        
        let memeTextAttribute : [String : Any] = [
            NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
            NSAttributedStringKey.foregroundColor.rawValue : UIColor.white,
            NSAttributedStringKey.font.rawValue : UIFont.fontNames(forFamilyName: "HelveticaNeue-CondensedBlack")
        
        ]
      topTextField.defaultTextAttributes = memeTextAttribute
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)

        
    }
    
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imageSelected = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageDisplay.image = imageSelected
        dismiss(animated: true, completion: nil)
        
    }


    @IBAction func pickImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
     imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
       
        
    }
    
    @IBAction func pickImageCamera(_ sender : Any){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
   
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    
}

