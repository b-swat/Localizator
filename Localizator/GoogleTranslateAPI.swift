//
//  GoogleTranslateAPI.swift
//  Localizator
//
//  Created by N.D. on 23/07/2018.
//  Copyright © 2018 N.D. All rights reserved.
//

import Foundation

public struct GoogleAITranslateParams {
    
    public init() {
        
    }
    
    public init(source:String, target:String, text:String) {
        self.source = source
        self.target = target
        self.text = text
    }
    
    public var source = "en"
    public var target = "en"
    public var text = "Hallo"
}

open class YandexTranslate {
    
    /// Store here the Google Translate API Key
    public var apiKey = "trnsl.1.1.20180724T072727Z.4fb7237c6c20bbad.2c64fb1397d1b357e662aa2b851477ec4f770603"
    
    ///
    /// Initial constructor
    ///
    public init() {
        
}
    open func translateGetLang() {
        
        guard apiKey != "" else {
            return
        }
        
        
        let queryItems = [URLQueryItem(name: "key", value: self.apiKey), URLQueryItem(name: "ui", value: "en")]
        let urlComps = NSURLComponents(string: "https://translate.yandex.net/api/v1.5/tr.json/getLangs")!
        urlComps.queryItems = queryItems
        let URLstring = urlComps.url!
        print(URLstring)
        let url = URL(string: URLstring.absoluteString)! //change the url
        
        //create the session object
        let session = URLSession.shared
         //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
      
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
              //  print(NSString(data: data, encoding: String.Encoding.utf8.rawValue))
                //create json object from data
               if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
        
    
    }
}
