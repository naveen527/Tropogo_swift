//
//  AES.swift
//  Tropogo
//
//  Created by NAVEEN on 10/01/21.
//

import Foundation
import UIKit
import CryptoSwift



class AESFormat:NSObject{
    
}

extension AESFormat {
    
    class func dataToJsonWithEncription(myString:String) -> String {
        let data = myString
        let enc = try! data.aesEncrypt(key:"\(TropogoConstants.superKey)")
        return enc
    }
    
    
    class func dataToJsonWithDecription(myData:Data) -> AnyObject? {
        
        let data = myData
        let str = String.init(data: data, encoding: .utf8)
        do {
            let dec = try str?.aesDecrypt(key:"\(TropogoConstants.superKey)")
           // debugPrint(dec as Any)
            let myData = dec?.data(using: .utf8)
            let model = try JSONSerialization.jsonObject(with: myData!) as? [String: Any]
           // debugPrint(model as Any)
            return model as AnyObject
            
        }catch {
            
            return nil
        }
        
    }
    
    
}

extension String{
    // This method will encrypt and return Cipher string
    func aesEncrypt(key:String) throws -> String {
        let key: [UInt8] = Array(key.utf8) as [UInt8]
        let enc = try AES(key:key, blockMode: ECB(),padding: .pkcs7).encrypt(Array(self.utf8))
        return enc.toBase64()!
        
    }
    
    func aesDecrypt(key:String) throws -> String {
        guard let data = Data(base64Encoded: self) else { return "" }
        let key: [UInt8] = Array(key.utf8) as [UInt8]
        let dec = try AES(key: key, blockMode: ECB(), padding: .pkcs7).decrypt([UInt8](data))
        return String(bytes: dec, encoding: .utf8) ?? self
    }
    
}

