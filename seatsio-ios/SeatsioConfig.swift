//
// Created by Nahuel Chaves on 2019-07-15.
// Copyright (c) 2019 Seats.io. All rights reserved.
//

import Foundation


extension Encodable {
    var convertToString: String? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        do {
            var jsonData = try jsonEncoder.encode(self)
            var result = String(data: jsonData, encoding: .utf8)!
            result.removeLast(2);
            result.append(",\n tooltipInfo: async (object) => await native.onTooltipInfo(JSON.stringify(object))")
            result.append("\n}")
            return result
        } catch {
            return nil
        }
    }
}

public struct SeatsioConfig : Encodable {
    var publicKey: String;
    var divId: String = "chart";
    var event: String;
    var holdOnSelect: Bool = false;

    init(publicKey: String, event: String) {
        self.publicKey = publicKey;
        self.event = event;
    }

    enum CodingKeys: String, CodingKey {
        case publicKey
        case event
    }

}