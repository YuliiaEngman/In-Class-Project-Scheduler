//
//  FileManager+Extensions.swift
//  Scheduler
//
//  Created by Yuliia Engman on 1/17/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

extension FileManager {
    
    // function gets URL path to documents directory
    // FileManager.getDocumentsDirectory() // type method
    //let fileManager = FileManager()
    // fileManager.getDocumentsDirectory() // instance method
    //
    
    // documents/
    static func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] // [0] - means basically that there is only 1 Documents folder
        // userDomainMask - is all url for this specific user
     
    }
    
    // if we would add a file ir would be like this:
    // documents/schedules.plist "schedules.plist"
    // gives acces to specifil file in our documents (if file excist!)
    // if file does not excist it will cfeate fileAND give accesss to it!!!
    static func pathToDocumentsDirectory(with filename: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(filename)
    }
}
