//
//  UsersModel.swift
//  getJsonFile
//
//  Created by 土橋正晴 on 2020/10/24.
//

import Foundation

struct UsersModel: Codable {
    let id: Int
    let name: String
    let age: String?
    let childUsers: [UsersModel]?
    
    
    
    static func fetchUsers() -> [UsersModel] {
        
        guard let url = Bundle.main.url(forResource: "Users", withExtension: "json") else {
            return []
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return []
        }
        
        do {
            return try JSONDecoder().decode([UsersModel].self, from: data)
        }
        catch {
            print("error")
            return []
        }
    }
}
