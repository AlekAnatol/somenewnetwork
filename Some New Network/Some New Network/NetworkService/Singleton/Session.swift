//
//  Session.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 15.02.2022.
//

import Foundation

class Session {

    static let instance = Session()

    private init() {}

    var id: Int?
    var token: String?
}
