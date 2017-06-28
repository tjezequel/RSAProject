//
//  Crypto.swift
//  RSA
//
//  Created by Thomas Jezequel on 27/06/2017.
//  Copyright © 2017 Thomas Jezequel. All rights reserved.
//

import Foundation
import BigInt

/**
 This class manages all the cryptographic stuff in the app.
 It can be used to :

 - Generate a prime number
 - Encrypt a message
 - Do the modular exponentiation math
*/
class Crypto {

    /**
     This methods generates a prime number with the designated width. 
     - parameter width: The desired width of the prime number
     - returns: A prime number of determined width
    */
    static func generatePrime(_ width: Int) -> BigUInt {
        while true {
            var random = BigUInt.randomInteger(withExactWidth: width)
            random |= BigUInt(1)
            if random.isPrime() {
                return random
            }
        }
    }

    /**
     This method encrypts a message using the RToLBinary exponentiation. If the message needs to be encrypted the public key should be passed, if the message should be decrypted the private key should be passed.
     - parameter message: The message to encrypt
     - parameter key: The key to use
     - returns: The encrypted or decypted message.
     */
    static func encrypt(_ message: BigUInt, key: Key) -> BigUInt {
        return modularExponentRToLBinary(base: message, exponent: key.exponent, modulus: key.modulus)
    }

    /**
     The memory efficient version of the modular exponentiation. Not very fast but very efficient on memory.
     - parameter base: The base, in this case the message to encrypt.
     - parameter exponent: The exponent to use (public or private key exponent)
     - parameter modulus: The modulus to use.
     - returns: The modular exponentiation of the base
     */
    static func modularExpo(base a: BigUInt, exponent b: Int, modulus c: BigUInt) -> BigUInt {
        var x = BigUInt(1)
        for _ in 0..<b {
            x = (x*a)%c
        }
        return x
    }

    /**
     The more time efficient version of modular exponentiation.
     - parameter base: The base, in this case the message to encrypt.
     - parameter exponent: The exponent to use (public or private key exponent)
     - parameter modulus: The modulus to use.
     - returns: The modular exponentiation of the base
     */
    static func modularExponentRToLBinary(base: BigUInt, exponent: BigUInt, modulus: BigUInt) -> BigUInt {
        if modulus == 1 { return 0 }
        var result = BigUInt(1)
        var b = base % modulus
        var e = exponent
        while e > 0 {
            if e[0] & 1 == 1 {
                result = (result * b) % modulus
            }
            e >>= 1
            b = (b * b) % modulus
        }
        return result
    }

}
