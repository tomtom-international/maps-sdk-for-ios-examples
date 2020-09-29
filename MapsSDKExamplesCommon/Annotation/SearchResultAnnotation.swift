//
/**
 * Copyright (c) 2020 TomTom N.V. All rights reserved.
 *
 * This software is the proprietary copyright of TomTom N.V. and its subsidiaries and may be used
 * for internal evaluation purposes or commercial use strictly subject to separate licensee
 * agreement between you and TomTom. If you are the licensee, you are only permitted to use
 * this Software in accordance with the terms of your license agreement. If you are not the
 * licensee then you are not authorised to use this software in any manner and should
 * immediately return it to TomTom N.V.
 */

import Foundation
import TomTomOnlineSDKMaps
import TomTomOnlineSDKSearch

public class SearchResultAnnotation: TTAnnotation {
    @objc public let result: TTSearchResult

    @objc public init(result: TTSearchResult) {
        self.result = result
        let image = TTAnnotationImage.createPNG(withName: "Favourite")!
        super.init(coordinate: result.position, annotationImage: image, anchor: .bottom, type: .focal)
        self.canShowCallout = false
    }
}
