//
//  Utils.swift
//  PListTest
//
//  Created by Lia An on 10/21/24.
//

import UIKit
import UniformTypeIdentifiers


func urlWithFileName(_ fileName: String, type: UTType = .propertyList) -> URL {
    let fileManager = FileManager.default
    let documentsURLs = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    let documentURL = documentsURLs[0]
    let fileURL = documentURL.appendingPathComponent(fileName, conformingTo: .propertyList)
    
    return fileURL
}

//
//func urlWithFileName(_ fileName: String) -> URL {
//    return Bundle.main.url(forResource: fileName, withExtension: nil)!
//}
