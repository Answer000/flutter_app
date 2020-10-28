//
//  FlutterNativePlugin.swift
//  Runner
//
//  Created by pet on 2020/10/27.
//

import UIKit
import Flutter

class FlutterNativePlugin: NSObject, FlutterPlugin {
    
    private let kSecretKeyOfSMS    = "c1bf727e20320049de30e52ada3802c7"
    
    static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel.init(name: "flutter_ios", binaryMessenger: registrar.messenger())
        let instance = FlutterNativePlugin.init()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "func_AES256" {
            var resultStr : String = ""
            if let arguments = call.arguments as? [String : Any],
                let encode = arguments["encode"] as? String,
                let phone = arguments["phone"] as? String,
                let areaCode = arguments["areaCode"] as? String {
                resultStr = handleSecretParams(encode: encode, phone: phone, areaCode: areaCode) ?? ""
            }
            result(resultStr)
        }else{
            result(FlutterMethodNotImplemented)
        }
    }
    
    func handleSecretParams(encode: String?, phone: String, areaCode: String) -> String? {
        /*然後到時後發短訊的流程就會是
         1.先call 一個api, 最得加密過的([resultA]AES256)
         2.前台解密 AES256 + SecretKey 解密 -> 得到resultA
         3.再用SecretKey 加密成 ([resultA + Phone + "N" + AreaCode] AES256) = resultB
         4.然後把這個resultB 傳到sms接口的header 中
         */
        guard let encode = encode else { return nil }
        // 做解密处理，拿到时间戳
        guard let secretKey = kSecretKeyOfSMS.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        let resultA = AES256Helper.aes256Decrypt(with: encode, key: secretKey)
        // 拼接成特定格式的字符串
        let targetStr = "\(resultA)\(phone)N\(areaCode)"
        // 加密
        let resultB = AES256Helper.aes256Encrypt(with: targetStr, key: secretKey)
        return resultB
    }
}

