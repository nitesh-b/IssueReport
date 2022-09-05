//
//  ChatBotTableViewController.swift
//  IssueReport
//
//  Created by Nitesh Banskota on 5/9/2022.
//

import UIKit
import SnapKit

class ChatBotTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var messages = Messages()
    
    let tableView : UITableView = {
        let table = UITableView()
        table.register(UINib(nibName: "SenderTableViewCell", bundle: nil), forCellReuseIdentifier: "SenderTableViewCellIdentifier")
        table.register(UINib(nibName: "ReceiverTableViewCell", bundle: nil), forCellReuseIdentifier: "ReceiverTableViewCellIdentifier")
        table.separatorStyle = .none
        table.transform = CGAffineTransform(scaleX: 1, y: -1)

        return table
        
    }()
    
    var textField: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 8.0
        tf.layer.borderColor = UIColor.red.cgColor
        tf.layer.borderWidth = 1.0
        tf.snp.makeConstraints { make in
            make.height.equalTo(48.0)
        }
        tf.backgroundColor = .white
        return tf
        
    }()
    
    var sendButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "send"), for: .normal)
        button.snp.makeConstraints { make in
            make.height.width.equalTo(48.0)
        }
        return button
    }()
    
    lazy var messageStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.addArrangedSubview(textField)
        stack.addArrangedSubview(sendButton)
        return stack
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        
        messages.append(Message(isFromSender: true, message: "Hello", messageType: "text"))
        messages.append(Message(isFromSender: false, message: "Hi There", messageType: "text"))
        messages.append(Message(isFromSender: true, message: "Make some coffee", messageType: "text"))
        messages.append(Message(isFromSender: false, message: "Sure, how many sugars?", messageType: "text"))
        messages.append(Message(isFromSender: true, message: "Three", messageType: "text"))
        
        view.addSubview(messageStack)
        messageStack.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(messageStack.snp.top)
            
            sendButton.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    @objc
    func  onButtonTapped(_sender: UIButton){
        if let messageText = textField.text{
            let message = Message(isFromSender: true, message: messageText, messageType: "text")
            
            messages.insert(message, at: 0)
            textField.text = nil
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

         return messages.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let message = messages[indexPath.row]
         if message.isFromSender{
             let cell = tableView.dequeueReusableCell(withIdentifier: "SenderTableViewCellIdentifier", for: indexPath) as! SenderTableViewCell
             cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
             cell.label.text = message.message
             return cell

         }else{
             let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverTableViewCellIdentifier", for: indexPath) as! ReceiverTableViewCell
             cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
             cell.label.text = message.message
             return cell

         }
       
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
