//
//  SaveManager.swift
//  iFilterCities
//
//  Created by Lucas Chae on 5/24/22.
//

import Foundation


func getDocumentsDirectory() -> URL {
    // find all possible documents directories for this user
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    // just send back the first one, which ought to be the only one
    return paths[0]
}
