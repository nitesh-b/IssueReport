//
//  XMLParserViewController.swift
//  IssueReport
//
//  Created by Nitesh Banskota on 13/9/2022.
//

import UIKit
import XMLMapper
import VoiceProcessor
class XMLParserViewController: UIViewController {
    
    let voiceProcessor = VoiceProcessor()

    override func viewDidLoad() {
        super.viewDidLoad()

        let voiceModel = VoiceModel(speak: "Hello, How are you", enableVoiceRecognition: true)
        self.voiceProcessor.setVoiceModel(voiceModel: voiceModel)
        voiceProcessor.startSpeech()
        
        

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
       voiceProcessor.stopSpeaking()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}




