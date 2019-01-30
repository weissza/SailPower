//
//  connectionController.swift
//  sailPower
//
//  Created by MARYANNE WEISS on 12/31/18.
//  Copyright © 2018 WSE. All rights reserved.
//

import Foundation


class connectionController{
    private var socket: SocketPort?
    
    
    public func connectToHost(host: String, port: UInt16){
        socket = SocketPort.init(remoteWithTCPPort: port, host: host)
        if socket == nil {
            NSLog("error opening socket\n")
        }
    }
    
    public func isConnected() -> Bool? {
        
        return socket?.isValid
    }
    
    
}
