//
//  YandexTranslateAPI.swift
//  Translator
//
//  Created by Andrew Dzhur on 19/01/2019.
//  Copyright © 2019 Andrew Dzhur. All rights reserved.
//

import Foundation
import Alamofire

class YandexAPI {
    static let api_Key: String = "trnsl.1.1.20181222T141104Z.57c139e28564cd89.660969f999660096a166979a9baa30155087b983"
    static let url_translate: String = "https://translate.yandex.net/api/v1.5/tr.json/translate"
    
    static func translateText(text: String, lang: String) {
        let length = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)?.count
        let parameters: [String: Any] = ["key": api_Key, "text": text, "lang": lang]
        let HTTPHeaders: [String: String] = ["Content-Type": "application/x-www-form-urlencoded", "Host": "translate.yandex.net", "Accept": "*/*", "Content-Length": String(length!)]
        
        request(url_translate, method: .post, parameters: parameters, headers: HTTPHeaders).validate().responseJSON { responseJSON in
            switch responseJSON.result {
            case .success(let value):
                guard let json = value as? [String: Any] else { return }
                guard let response = Response(json: json) else { return }
                print(response)
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
    struct Response {
        var code: Int
        var lang: String
        var text: [String]
        
        init?(json: [String: Any]) {
            
            guard
                let code = json["code"] as? Int,
                let lang = json["lang"] as? String,
                let text = json["text"] as? [String]
            else {
                    return nil
            }
            
            self.code = code
            self.lang = lang
            self.text = text
        }
        
    }
}
