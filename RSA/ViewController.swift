//
//  ViewController.swift
//  RSA
//
//  Created by Thomas Jezequel on 27/06/2017.
//  Copyright © 2017 Thomas Jezequel. All rights reserved.
//

import Cocoa
import BigInt

typealias Key = (modulus: BigUInt, exponent: BigUInt)

///:nodoc:
class ViewController: NSViewController {

    @IBOutlet weak var clearTextField: NSTextField!
    
    @IBOutlet weak var cypherLabel: NSTextField!
    @IBOutlet weak var cypherText: NSTextField!
    @IBOutlet weak var clearLabel: NSTextField!
    
    var publicKey: Key!
    var privateKey: Key!
    var cypherString: BigUInt!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        encrypt()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func encrypt() {
        let p = Crypto.generatePrime(512)
        print(p)
        let q = Crypto.generatePrime(512)
        print(q)
        
        let n = p * q
        print("n: \(n)")
        
        let e: BigUInt = 65537
        let phi = (p - 1) * (q - 1)
        let d = e.inverse(phi)!
        
        publicKey = (n, e)
        privateKey = (n, d)
        
    }

    @IBAction func encrypt(_ sender: Any) {
        let secret : BigUInt = BigUInt(clearTextField.stringValue.data(using: String.Encoding.utf8)!)
        cypherString = Crypto.encrypt(secret, key: publicKey)
        cypherLabel.stringValue = "\(cypherString!)"
    }

    @IBAction func decrypt(_ sender: Any) {
        let plainText = Crypto.encrypt(cypherString, key: privateKey)
        let recieved = String(data: plainText.serialize(), encoding: String.Encoding.utf8)
        clearLabel.stringValue = recieved!
    }
}

