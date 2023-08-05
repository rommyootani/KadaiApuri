//
//  WorkScheduler.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation
import Combine

final class WorkScheduler {

    static var backgroundWorkScheduler: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 5
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return operationQueue
    }()

    static let mainScheduler = RunLoop.main
    static let mainThread = DispatchQueue.main
}
