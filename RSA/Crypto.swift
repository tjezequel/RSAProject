//
//  Crypto.swift
//  RSA
//
//  Created by Thomas Jezequel on 27/06/2017.
//  Copyright © 2017 Thomas Jezequel. All rights reserved.
//

import Foundation
import BigInt

class Crypto {

    static func generatePrime(_ width: Int) -> BigUInt {
        while true {
            var random = BigUInt.randomInteger(withExactWidth: width)
            random |= BigUInt(1)
            if random.isPrime() {
                return random
            }
        }
    }

    static func encrypt(_ message: BigUInt, key: Key) -> BigUInt {
        return message.power(key.exponent, modulus: key.modulus)
    }
    
    static func modularExpo(_ a: BigUInt, _ b: Int, _ c: BigUInt) -> BigUInt {
        var x = BigUInt(1)
        for _ in 0..<b {
            x = (x*a)%c
        }
        return x
    }
    
    static func modularExponentRToLBinary(base: BigUInt, exponent: BigUInt, modulus: BigUInt) -> BigUInt {
        var bas = base
        var exp = exponent
        let mod = modulus
        if modulus == 1 {
            return 0
        }
        var result = BigUInt(1)
        bas = bas % mod
        while exp > 0 {
            if exp % 2 == 1 {
                result = (result * base) % mod
            }
            exp = exp >> 1
            bas = (bas*bas)%mod
        }
        return result
    }

}
