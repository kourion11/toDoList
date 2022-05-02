//
//  Tasks+CoreDataProperties.swift
//  toDoList
//
//  Created by Сергей Юдин on 02.05.2022.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var name: String?
    @NSManaged public var text: String?

}

extension Tasks : Identifiable {

}
