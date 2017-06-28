//
//  RSATests.swift
//  RSATests
//
//  Created by Thomas Jezequel on 27/06/2017.
//  Copyright © 2017 Thomas Jezequel. All rights reserved.
//

import XCTest
import BigInt
@testable import RSA

class RSATests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testModularExponent() {
        let expected = BigUInt(624)
        let result = Crypto.modularExpo(24, 2015, 1000)
        let result2 = Crypto.modularExponentRToLBinary(base: 24, exponent: 2015, modulus: 1000)
        XCTAssertEqual(result, expected)
        XCTAssertEqual(result2, expected)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            
        }
    }
    
}
