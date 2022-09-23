//
//  ViewController.swift
//  IssueReport
//
//  Created by Nitesh Banskota on 5/9/2022.
//

/**
  1. Check if user is Logged In
 2. If not logged in, Register
 3.
 */

import UIKit
import SnapKit
import Kommunicate
import KommunicateChatUI_iOS_SDK
import AVFoundation
import AVKit
import ContactsUI


class ViewController: UIViewController {
    
    let startButton : UIButton = {
       let button = UIButton()
        button.setTitle("Start Chat", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    let startXMLButton : UIButton = {
       let button = UIButton()
        button.setTitle("Start XML parser", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    lazy var stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16.0
        stack.addArrangedSubview(startButton)
        stack.addArrangedSubview(startXMLButton)
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(100)
            
        }
     
        
        startButton.addTarget(self, action: #selector(openChatBot), for: .touchUpInside)
        
        startXMLButton.addTarget(self, action: #selector(openXMLParser), for: .touchUpInside)
        //User Registration in Kommunicate
     registerKuser()
        
        

    }
    
    /// User Registration
    private func registerKuser(){
        if !Kommunicate.isLoggedIn{
            let kUser = KMUser()
            kUser.userId = "nitesh-test-001"
            kUser.displayName = "Nitesh"
            kUser.applicationId = "9b5585c2c105fd6b139bbd2663f0e8a4"
            
            Kommunicate.registerUser(kUser) { response, error in
                guard let response = response else {
                    return
                }
                if(response.isRegisteredSuccessfully()){
                    print("User Registered Successfully")
                }else{
                    print("Registration issue with success")
                }
            }
        }
        
    }
    
    
    ///Start a conversation
    private func createConversation(){
        let conversationVC = Kommunicate.conversationListViewController()
        let navVC = KMBaseNavigationViewController(rootViewController: conversationVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    
    
    
    @objc
    func openChatBot(_ sender: UITapGestureRecognizer){
        
        if(Kommunicate.isLoggedIn){
            createConversation()
        }
       
    }
    
    @objc
    func openXMLParser(_ sender: UITapGestureRecognizer){
        
        self.navigationController?.pushViewController(XMLParserViewController(), animated: false)
       
    }
    
    
    


}

