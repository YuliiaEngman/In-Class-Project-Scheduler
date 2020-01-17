//
//  PersistanceHelper.swift
//  Scheduler
//
//  Created by Yuliia Engman on 1/17/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

// we want to save event in first VC, where we have all other events

enum DataPersistanceError: Error { // conforming to the Error Protocol
    case savingError(Error) // associated value
}

class PersistanceHelper {
    // CRUD - create, write, update, delete
    
    // array of events
    private static var events = [Event]()
    
    private static let filename = "schedules.plist" // for static func bleow we need static var/let
    
    // create - save item to document directory
    // this function just saves the data, but does not show us YET! - for that we will use load (what we saved).
    static func save(event: Event) throws {
        // STEP 1.
        // throws - this will show error in VC (for us!)
       // get url path to the file that the event will be saved to
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        
        // STEP 2.
        // append new event to the events array
        events.append(event)
        
        // events array will be object being converted to Data
        // we will use the Data object and write (save) it to documents directory
        do {
            // STEP 3.
            // convert (serialize) thr events array to Data
            let data = try PropertyListEncoder().encode(events) // encode events (array of events) to data
            // try means that when something goes wrong we have to notify the user
            // writes, saves, persist  the data to the documents directory
            
            // STEP 4.
            try data.write(to: url, options: .atomic) // write to this url (let url above), atomic means write all the data at once
        } catch {
            // STEP 5.
            throw DataPersistanceError.savingError(error)
        }
        
    }
    
    // read - load (retrieve) items from documents directory
    // update
    // delete - remove item from documents directory
}
