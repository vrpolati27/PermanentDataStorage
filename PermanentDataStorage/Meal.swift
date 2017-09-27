//
//  Meal.swift
//  PermanentDataStorage
//
//  Created by Vinay Reddy Polati on 9/13/17.
//  Copyright © 2017 m1m2Solutions. All rights reserved.
//

import Foundation;
import  os.log;

class Meal: NSObject, NSCoding{
    //Mark: Properties
    var name:String = String();
    var rating:Int = 0;
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!;
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals");
    
    
    init(name:String, rating:Int){
        self.name = name;
        self.rating = rating;
    }
    
    //MARK: Types
    struct PropertyKey {
        static let name = "name";
        static let photo = "photo";
        static let rating = "rating";
    }
    
    public func encode(with aCoder: NSCoder){
        aCoder.encode(name, forKey: PropertyKey.name);
        aCoder.encode(self.rating, forKey: PropertyKey.rating);
    }
    
    required  convenience init?(coder aDecoder: NSCoder){
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
        else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil;
        }
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating);
        self.init(name: name, rating: rating);
    }
}
