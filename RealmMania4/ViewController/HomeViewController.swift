//
//  ViewController.swift
//  FirebaseCrazy
//
//  Created by Kimberly on 2/15/18.
//  Copyright © 2018 Kimberly. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Instance variables
    var database: Realm!
    var notificationToken: NotificationToken?
    var profiles: Results<Profile>!
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    // MARK: - IBActions
    @IBAction func createTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Create", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CreateView") as! UINavigationController
        let view = controller.topViewController as! CreateViewController
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    @IBAction func editTapped(_ sender: UIButton) {
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        let selectedRow = indexPath.row
        if selectedRow >= 0 {
            let oldProfile = profiles[selectedRow]
            let titleStr = "- Editing profile -"
            let msgStr = "Please enter a new name followed by your age."
            let okayStr = "Update"
            let canStr = "Cancel"
            AlertController.alertField2d(delay: 0.15, title: titleStr, message: msgStr, defaultText0: oldProfile.firstName, defaultText1: oldProfile.lastName, okayTitle: okayStr, cancelTitle: canStr, viewController: self, completion: { (first, last) in
                if let newFirst = first, let newLast = last {
                    if self.isNameValid(name: newFirst, minNum: 4, acceptSpace: false) && self.isNameValid(name: newLast, minNum: 4, acceptSpace: false) {
                        try!self.database.write {
                            oldProfile.firstName = newFirst
                            oldProfile.lastName = newLast
                        }
                    }
                }
            }, rejected: {
                return
            })
        }
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        let selectedRow = indexPath.row
        if selectedRow >= 0 {
            let profile = profiles[selectedRow]
            try!database.write {
                database.delete(profile)
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func searchTapped(_ sender: UIButton) {
        let titleStr = "- Searching profile -"
        let msgStr = "Please enter a last name"
        let okayStr = "Search"
        let canStr = "Cancel"
        AlertController.alertField(delay: 0.15, title: titleStr, message: msgStr, textholder: "last name", okayTitle: okayStr, cancelTitle: canStr, viewController: self, completion: { (new) in
            if let newLast = new {
                let predicate = NSPredicate(format: "lastName = %@", newLast)
                self.profiles = self.database.objects(Profile.self).filter(predicate)
                self.tableView.reloadData()
            }
        }) {
            return
        }
 
        
        
        /*
        let titleStr = "- Searching profile -"
        let msgStr = "Please enter a minimum age"
        let okayStr = "Search"
        let canStr = "Cancel"
        AlertController.alertNumber(delay: 0.15, title: titleStr, message: msgStr, okayTitle: okayStr, cancelTitle: canStr, viewController: self, completion: { (age) in
            if let myAge = age {
                let predicate = NSPredicate(format: "age >= %i", Int(myAge)!)
                self.profiles.filter(predicate)
                self.tableView.reloadData()
            }
        }) {
            return
        }
        */
    }
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // buttons //
        MakeButtonStyle.defaultButtonStyle(button: createButton, title: "Create")
        MakeButtonStyle.defaultButtonStyle(button: editButton, title: "Edit")
        MakeButtonStyle.defaultButtonStyle(button: deleteButton, title: "Delete")
        MakeButtonStyle.defaultButtonStyle(button: searchButton, title: "Search")
        
        for button in buttonCollection {
            button.backgroundColor = .clear
        }
        
        // opening database with encryption //
        let path = documentPath() + "/" + "default.jpg"
        if FileHandler.pathExists(path: path) {
            if let key = NSKeyedUnarchiver.unarchiveObject(withFile: path) {
                let config = Realm.Configuration(encryptionKey: key as? Data)
                do {
                    database = try Realm(configuration: config)
                    profiles = database.objects(Profile.self)
                    notificationToken = database.observe { [unowned self] notification, database in
                        self.tableView.reloadData()
                    }
                } catch let error as NSError {
                    // If the encryption key is wrong, `error` will say that it's an invalid database
                    fatalError("Error opening realm: \(error)")
                }
            }
        } else {
            var key = Data(count: 64)
            _ = key.withUnsafeMutableBytes { bytes in
                SecRandomCopyBytes(kSecRandomDefault, 64, bytes)
            }
            // Open the encrypted Realm file
            let config = Realm.Configuration(encryptionKey: key)
            do {
                database = try Realm(configuration: config)
                profiles = database.objects(Profile.self)
                notificationToken = database.observe { [unowned self] notification, database in
                    self.tableView.reloadData()
                }
            } catch let error as NSError {
                // If the encryption key is wrong, `error` will say that it's an invalid database
                fatalError("Error opening realm: \(error)")
            }
            let data = NSKeyedArchiver.archivedData(withRootObject: key)
            do {
                print(URL(string: path)!)
                try data.write(to: URL(fileURLWithPath: path), options: .atomicWrite)
            }
            catch {
                
            }
        }
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
    
    
    
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        let pro = profiles[indexPath.row]
        let name = pro.firstName + " " + pro.lastName
        let ageStr = String(pro.age)
        let genStr = (pro.gender) ? "Male" : "Female"
        cell.nameLabel.text = name
        cell.ageLabel.text = ageStr
        cell.genderLabel.text = genStr
        if let pictData = pro.picture {
            if let image = UIImage(data: pictData) {
                cell.pictureView.image = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editButton.isEnabled = true
        deleteButton.isEnabled = true
    }
    // MARK: - TableView
    
    
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

