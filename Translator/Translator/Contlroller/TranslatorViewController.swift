//
//  TranslatorViewController.swift
//  Translator
//
//  Created by Andrew Dzhur on 28/12/2018.
//  Copyright © 2018 Andrew Dzhur. All rights reserved.
//

import UIKit

class TranslatorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
//    let message: [String] = ["Hello World!", "Hello, my name is Andrew", "This world is perfect!!!"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputBar: UIInputBarView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.transform = CGAffineTransform(rotationAngle: -(CGFloat)(Double.pi));
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.textView.frame.origin.y == 0 {
                self.textView.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.textView.frame.origin.y != 0 {
            self.textView.frame.origin.y = 0
        }
    }
    
    

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 5//message.count
    }
    
    //func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     //   return 12
    //}

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UIRightCell", for: indexPath) as! UIMessageCell
        
//        let message = self.message[indexPath.row]
        
        cell.configCell(message: "")
        cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
