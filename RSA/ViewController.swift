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

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let publicKey: Key = (n, e)
        let privateKey: Key = (n, d)
        
        let secret : BigUInt = BigUInt("Arbitrary precision arithmetic is fun!".data(using: String.Encoding.utf8)!)
        print("Secret : \(secret)")
        let cypherText = Crypto.encrypt(secret, key: publicKey)
        print("Cypher Text : \(cypherText)")
        
        let plainText = Crypto.encrypt(cypherText, key: privateKey)
        print("Plain Text : \(plainText)")
        let recieved = String(data: plainText.serialize(), encoding: String.Encoding.utf8)
        print("Recieved : \(recieved ?? "?")")
    }


}

