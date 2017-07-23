//
//  ViewController.swift
//  SillySong
//
//  Created by Nicholas Sutanto on 7/19/17.
//  Copyright © 2017 Nicholas Sutanto. All rights reserved.
//

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")


func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    if (fullName != "") {
        let shortName = shortNameForName(name: fullName)
 
        let lyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        return lyrics
    }
    else
    {
        return ""
    }
}
 

func shortNameForName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    
    if let firstVowelRange = lowercaseName.rangeOfCharacter(from: vowelSet) {
        return lowercaseName.substring(from: firstVowelRange.lowerBound)
    }
    
    // No vowels - return the full name
    return lowercaseName
}



extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        
        let name = nameField.text
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name!)
    }
}

