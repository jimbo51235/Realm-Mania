//
//  SelectViewController.swift
//  RealmMania3
//
//  Created by Kimberly on 2/20/18.
//  Copyright © 2018 Kimberly. All rights reserved.
//

import UIKit
import RealmSwift

class CreateViewController: UIViewController {
    // MARK: - Instance variables
    var database: Realm!
    var profiles: Results<Profile>!
    
    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    /* firstView */
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstFirstField: UITextField!
    @IBOutlet weak var firstLastField: UITextField!
    @IBOutlet weak var firstGenderControl: UISegmentedControl!
    @IBOutlet weak var firstAgeField: UITextField!
    /* secondView */
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondSelectButton: UIButton!
    
    /* bottomView */
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var createlButton: UIButton!
    
    // MARK: - IBActions
    /* firstView */
    @IBAction func firstDismissTapped(_ sender: UIButton) {
        self.view.endEditing(true)
    }
    /* secondView */
    @IBAction func secondSelectTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Picture", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PictureView") as! UINavigationController
        let view = controller.topViewController as! PictureViewController
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    /* bottomView */
    @IBAction func cancelTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func createTapped(_ sender: UIButton) {
        saveDataToDatabase()
    }
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // firstView & secondView //
        let scrollWidth = self.view.frame.size.width
        scrollView.contentSize = CGSize(width: scrollWidth, height: firstView.bounds.height + secondView.bounds.height)
        scrollView.addSubview(firstView);firstView.frame = CGRect(x: 0.0, y: 0.0, width: scrollWidth, height: 230.0)
        scrollView.addSubview(secondView);secondView.frame = CGRect(x: 0.0, y: 310.0, width: scrollWidth, height: 340.0)
        
        // buttons //
        MakeButtonStyle.defaultButtonStyle(button: secondSelectButton, title: "Select")
        MakeButtonStyle.defaultButtonStyle(button: cancelButton, title: "Cancel")
        MakeButtonStyle.defaultButtonStyle(button: createlButton, title: "Create")
        
        // notifications //
        NotificationCenter.default.addObserver(self, selector: #selector(pictureDidSelect), name: NSNotification.Name(rawValue: "CreateViewControllerPictureDidSelect"), object: nil)
        
        // defining realm //
        // opening database with encryption //
        let path = documentPath() + "/" + "default.jpg"
        if let key = NSKeyedUnarchiver.unarchiveObject(withFile: path) {
            let config = Realm.Configuration(encryptionKey: key as? Data)
            do {
                database = try Realm(configuration: config)
                profiles = database.objects(Profile.self)
            } catch let error as NSError {
                // If the encryption key is wrong, `error` will say that it's an invalid database
                fatalError("Error opening realm: \(error)")
            }
        }
        
        //print(documentPath())
        //print(bundleIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    
    
    
    // MARK: - Notifications
    @objc func pictureDidSelect(notification: NSNotification) {
        let img = notification.object as! UIImage
        secondImageView.image = img
        hasImage = true
        validateCreate()
    }
    // MARK: - Notifications
    
    
    
    
    // MARK: - Text delegate
    @IBAction func textDidChange(_ sender: UITextField) {
        validateCreate()
    }
    
    // MARK: - Text delegate
    
    
    // MARK: - Validation
    var hasImage = false
    func validateCreate() {
        var (b1, b2, b3, b4) = (false, false, false, false)
        
        // first, last, age //
        let firstName = firstFirstField.text!
        let lastName = firstLastField.text!
        let ageStr = firstAgeField.text!
        if isNameValid(name: firstName, minNum: 4, acceptSpace: false) {
            b1 = true
        }
        if isNameValid(name: lastName, minNum: 4, acceptSpace: false) {
            b2 = true
        }
        if ageStr.isInt() {
            b3 = true
        }
        if hasImage {
            b4 = true
        }
        // all //
        createlButton.isEnabled = (b1 && b2 && b3 && b4) ? true : false
    }
    // MARK: - Validation
    
    
    // MARK: - Saving data
    func saveDataToDatabase() {
        let image = secondImageView.image?.resize(w: 128.0, h: 128.0)
        if let data = image!.pngData() {
            let profile = Profile()
            profile.firstName = firstFirstField.text!
            profile.lastName = firstLastField.text!
            profile.age = Int(firstAgeField.text!)!
            profile.gender = (firstGenderControl.selectedSegmentIndex == 0) ? true : false
            profile.picture = data
            try!database.write {
                database.add(profile)
                _ = navigationController?.popViewController(animated: true)
            }
        } else {
            _ = navigationController?.popViewController(animated: true)
        }
    }
    // MARK: - Saving data
    
    
    // MARK: - Functions
    func isEmailValid(_ email: String) -> Bool {
        //https;//medium.com/@darthpelo/email-validation-in-swift-3-0-acfebe4d879a
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isNameValid(name: String, minNum: Int, acceptSpace: Bool) -> Bool {
        if name != "" {
            if acceptSpace {
                if name.count >= minNum {
                    return true
                } else {
                    return false
                }
            }
            else {
                if !name.contains(" ") {
                    if name.count >= minNum {
                        return true
                    } else {
                        return false
                    }
                }
                else {
                    return false
                }
            }
        }
        else {
            return false
        }
    }
    // MARK: - Functions
    
    
    // MARK: - Functions 1: Files
    func documentPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory = paths.first! as NSString
        return documentsDirectory as String
    }
    
    func libraryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let libraryDirectory = paths.first! as NSString
        return libraryDirectory as String
    }
    
    func folderPath(s: Int, name: String) -> String {
        if s == 0 {
            let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            let documentsFolder = paths.first! as NSString
            let path = documentsFolder.appendingPathComponent(name)
            return path
        } else {
            let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            let libraryFolder = paths.first! as NSString
            let path = libraryFolder.appendingPathComponent(name)
            return path
        }
    }
    // MARK: - Functions 1: Files
}

