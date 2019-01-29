//
//  TranslatorViewController.swift
//  Translator
//
//  Created by Andrew Dzhur on 28/12/2018.
//  Copyright © 2018 Andrew Dzhur. All rights reserved.
//

import UIKit

class TranslatorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UIInputField!
    @IBOutlet weak var inputBarView: UIInputBarView!
    @IBOutlet weak var switchLangBtn: UIButton!
    
    var object: UIMessageCell.Data?
    var objects: [UIMessageCell.Data] = []
    var lang: TDirection = TDirection(translation: .ru, to: .en)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.transform = CGAffineTransform(rotationAngle: -(CGFloat)(Double.pi));
        
        textField.delegate = self
        
        textField.switchLangPlaceholder(lang: .en)
        
        self.hideKeyboardWhenTappedAround()
        addKeyboardNotification()
    }
    
    

// MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return objects.count
    }
    
    func insertNewObject(object: UIMessageCell.Data) {
        let indexPath = IndexPath(row: 0, section: 0)
        objects.insert(object, at: 0)
        tableView.insertRows(at: [indexPath], with: .bottom)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String
        let cell: UIMessageCell
        let data: UIMessageCell.Data = objects[indexPath.row]
        
        switch data.side {
        case .left:
            identifier = "UILeftCell"
        case .right:
            identifier = "UIRightCell"
        }
            
        cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! UIMessageCell
        cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
        
        cell.ConfigCell(data: data)

        return cell
    }
        
// MARK:- InputBar function
    @IBAction func sentText(_ sender: Any) {
        let text = textField.text
        YandexAPI.translateText(text: text!, lang: lang, callback: recieveResponse)
        textField.text?.removeAll()
        object = UIMessageCell.Data(text: text!, tDirection: lang)
    }
    
    @IBAction func switchLanguage(_ sender: Any) {
        lang.switchLanguages()
//        print(lang.from.rawValue.uppercased()+"-"+lang.to.rawValue.uppercased())
        switchLangBtn.setTitle(lang.from.rawValue.uppercased()+"-"+lang.to.rawValue.uppercased(), for: .normal)
        textField.switchLangPlaceholder(lang: lang.to)
        inputBarView.switchLangColor(lang: lang.to)
    }
    
    func recieveResponse(response: YandexAPI.Response) {
        object!.tText = response.text[0]
        insertNewObject(object: object!)
    }
    
    
// MARK:- Keyboard function
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        adjustHeight(show: true, notification: notification)
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        adjustHeight(show: false, notification: notification)
    }
    
    @objc func adjustHeight(show:Bool, notification:NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
// FIXME: Gap between keyboard and view
        //        guard let animationDurarion = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        let changeInHeight = (keyboardFrame.height) * (show ? -1 : 0)
        self.view.frame.origin.y = changeInHeight
    }
}
