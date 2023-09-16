//
//  URLSession+HTTPWorker.swift
//  ITCnance
//
//  Created by Michał Bagrowski on 04/08/2023.
//

import Foundation

protocol HTTPWorker {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: HTTPWorker {}
