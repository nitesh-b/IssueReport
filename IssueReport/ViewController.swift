//
//  ViewController.swift
//  IssueReport
//
//  Created by Nitesh Banskota on 5/9/2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let startButton : UIButton = {
       let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        self.view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(100)
            
        }
        
        startButton.addTarget(self, action: #selector(openChatBot), for: .touchUpInside)
        
        
        

    }
    
    
    @objc
    func openChatBot(_ sender: UITapGestureRecognizer){
        self.navigationController?.pushViewController(ChatBotTableViewController(), animated: true)
    }
    


}

