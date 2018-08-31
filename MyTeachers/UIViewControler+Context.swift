//
//  UIViewControler+Context.swift
//  MyTeachers
//
//  Created by Daniel Aguiar on 31/08/18.
//  Copyright © 2018 Daniel Aguiar. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController{
    var context: NSManagedObjectContext {
        return(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
}
