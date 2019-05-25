//
//  Connector.swift
//  JustGo-iOS
//
//  Created by 조우진 on 16/05/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

public class Connector{
    
    public static let instance = Connector()
    
    private let baseUrl = "baseUrl"
    private init(){ }
    
    func getRequest(_ subPath: API, method: RequestMethod, params: [String : Any]? = nil) -> URLRequest{
        var urlStr = baseUrl + subPath.getPath()
        
        if method == .get{
            var query = params?.map{ "\($0)=\($1)" }.reduce(""){ f, s -> String in "\(f)&\(s)" } ?? ""
            if !query.isEmpty{ query.removeFirst(); urlStr += ("?" + query) }
        }
        
        var request = URLRequest(url: URL(string: urlStr)!)
        request.httpMethod = method.rawValue
        
        if method != .get, params != nil{
            let jsonData = try? JSONSerialization.data(withJSONObject: params!)
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        return request
    }
    
}

public extension URLRequest{
    
    func emptyData(vc: UIViewController) -> Observable<Int>{
        return decodeData(String.self, vc: vc).map{ $0.0 }
    }
    
    func decodeData<T>(_ type: T.Type, vc: UIViewController? = nil) -> Observable<(Int, T?)> where T: Decodable{
        return requestData(self)
            .single()
            .map{ ($0.0.statusCode, $0.1) }
            .map{ (code, data) in
                let decodeData = try? JSONDecoder().decode(type, from: data)
                return (code, decodeData)
            }
            .filter{ (code, _) in
                if code == 500{ print("서버 오류") }
                return code != 500
        }
    }
    
}

public enum RequestMethod: String{
    
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
    
}
