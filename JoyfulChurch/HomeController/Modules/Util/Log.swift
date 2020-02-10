//
//  Lot.swift
//  Cashdoc
//
//  Created by bzjoowan on 2019/12/28.
//  Copyright © 2019 Cashwalk. All rights reserved.
//

import Foundation

class Log {
    //Dictionay형태를 받아와서 보여줌, 주로 API통신이나 스크래핑에 쓸예정
    class func d(_ dict: [String: Any]) {
        #if DEBUG
        print("==============================================================")
        let order = dict.sorted(by: { $0.0 < $1.0 })
        for (key, value) in order {
            print("<\(key)>")
            if let getString = value as? String {
                print(getString.prefix(500)) //String형태일때 길면 500자로 짤라주자
            } else {
                print(value)
            }
        }
        print("==============================================================")
        #endif
    }

    //info 정보들을 알려줄때 사용하자
    class func i(_ any: Any, filename: String = #file, funcName: String = #function) {
        #if DEBUG
        print("[ℹ️][\(sourceFileName(filePath: filename))] \(funcName) -> \(any)")
        #endif
    }

    //error 먼가 에러가 날법한데 넣어두었다가 확인용
    class func e(_ any: Any, filename: String = #file, funcName: String = #function) {
        #if DEBUG
        print("[⁉️][\(sourceFileName(filePath: filename))] \(funcName) -> \(any)")
        #endif
    }

    //tj's Log 개인취향존중 알아서 바꾸세여
    class func tj(_ any: Any, filename: String = #file, funcName: String = #function) {
        #if DEBUG
        print("[🐼tj][\(sourceFileName(filePath: filename))] \(funcName) -> \(any)")
        #endif
    }

    private class func sourceFileName(filePath: String) -> String {
       let components = filePath.components(separatedBy: "/")
       return components.isEmpty ? "" : components.last!
    }
}
