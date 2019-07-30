//
// Created by Nahuel Chaves on 2019-07-29.
// Copyright (c) 2019 Seats.io. All rights reserved.
//

import Foundation

struct SeatsioObject: Decodable {
    let objectType: Optional<String>
    let label: Optional<String>
    let numberOfSelectableObjects: Optional<Int16>
}
