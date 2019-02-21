//
//  SelectViewController.swift
//  RealmMania3
//
//  Created by Kimberly on 2/20/18.
//  Copyright © 2018 Kimberly. All rights reserved.
//

import UIKit
import Photos

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Instance variables
    let imagePicker = UIImagePickerController()
    
    // MARK: - IBOutlets
    @IBOutlet weak var pickButton: UIButton!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    
    // MARK: - IBActions
    @IBAction func pickTapped(_ sender: UIButton) {
        // You cannot put the following lines in viewWillAppear or viewDidAppear.  If you do, you cannot select a picture for the second time.//
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        if photoAuthorizationStatus == .authorized {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        } else {
            let titleStr = NSLocalizedString("PictureViewControllerPrivacySettingsTitle", comment: "")
            let msgStr = NSLocalizedString("PictureViewControllerPrivacySettingsMsg", comment: "")
            let okayStr = NSLocalizedString("GeneralOkay", comment: "")
            AlertController.makeAlert(delay: 0.25, title: titleStr, message: msgStr, okayTitle: okayStr, viewController: self)
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectTapped(_ sender: UIButton) {
        if pictureView.image != nil {
            let img = pictureView.image!
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CreateViewControllerPictureDidSelect"), object: img)
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate //
        imagePicker.delegate = self
        
        // buttons //
        MakeButtonStyle.defaultButtonStyle(button: pickButton, title: "Pick")
        MakeButtonStyle.defaultButtonStyle(button: cancelButton, title: "Cancel")
        MakeButtonStyle.defaultButtonStyle(button: selectButton, title: "Select")
        
        //print(documentPath())
        //print(bundleIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // imagePicker permission //
        imagePickerPermission()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //self.removeFromParentViewController()
        //self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewWillClear()
    }
    
    func viewWillClear() {
        
    }
    // MARK: - Life cycle
    
    
    // MARK: - deinit
    deinit {
        print("deinit is called by HomeViewController")
    }
    // MARK: - deinit
    
    
    // MARK: - Status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    // MARK: - Status bar
    
    
    
    
    // MARK: - Image picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImage: UIImage?
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage
            pictureView.image = editedImage
            selectButton.isEnabled = true
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImage = originalImage
            pictureView.image = selectedImage
            selectButton.isEnabled = true
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        }
    }
    // MARK: - Image picker
}

