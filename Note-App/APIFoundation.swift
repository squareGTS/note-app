//
//  APIFoundation.swift
//  Note-App
//
//  Created by Maxim Bekmetov on 23.06.2021.
//

import Foundation
import Alamofire

struct Note: Decodable {
    var title: String
    var date: String
    var _id: String
    var note: String
}

class APIFunctions {
    
    var delegate: DataDelegate?
    static let function = APIFunctions()
    
    func fetchNotes() {
        AF.request("http://192.168.1.15:3000/fetch").response { response in
            
            print(response.data!)
            
            let data = String(data: response.data!, encoding: .utf8)
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func addNote(date: String, title: String, note: String) {
        AF.request("http://192.168.1.15:3000/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "date": date, "note": note]).responseJSON {
            response in
            print(response)
        }
    }
    
    func updateNote(date: String, title: String, note: String, id: String) {
        AF.request("http://192.168.1.15:3000/update", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "date": date, "note": note, "id": id]).responseJSON {
            response in
            print(response)
        }
    }
    
    
    func deleteNote(id: String) {
        AF.request("http://192.168.1.15:3000/delete", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id]).responseJSON {
            response in
            print(response)
        }
    }
}
