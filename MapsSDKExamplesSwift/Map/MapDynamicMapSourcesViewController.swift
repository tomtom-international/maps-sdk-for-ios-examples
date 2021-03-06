/**
 * Copyright (c) 2019 TomTom N.V. All rights reserved.
 *
 * This software is the proprietary copyright of TomTom N.V. and its subsidiaries and may be used
 * for internal evaluation purposes or commercial use strictly subject to separate licensee
 * agreement between you and TomTom. If you are the licensee, you are only permitted to use
 * this Software in accordance with the terms of your license agreement. If you are not the
 * licensee then you are not authorised to use this software in any manner and should
 * immediately return it to TomTom N.V.
 */

import MapsSDKExamplesCommon
import MapsSDKExamplesVC
import TomTomOnlineSDKMaps
import UIKit

class MapDynamicMapSourcesViewController: MapBaseViewController, TTMapViewDelegate {
    let GEO_LAYER_ID = "layer-line-id"
    let IMG_LAYER_ID = "layer-image-id"
    let IMG_SOURCE = "image-source"

    var currentStyle: TTMapStyle!

    override func onMapReady() {
        currentStyle = mapView.styleManager.currentStyle
        mapView.delegate = self
        addImageSource()
        addGeoJSONSource()
    }

    override func setupInitialCameraPosition() {
        mapView.center(on: TTCoordinate.BUCKINGHAM_PALACE_CENTER(), withZoom: 16)
    }

    override func getOptionsView() -> OptionsView {
        return OptionsViewMultiSelect(labels: ["GeoJson", "Image"], selectedID: -1)
    }

    func addGeoJSONSource() {
        var path = Bundle.main.path(forResource: "geojson_source", ofType: "json")
        let geojsonJSON = try! String(contentsOfFile: path!, encoding: .utf8)
        let sourceMap = TTMapSource.create(withSourceJSON: geojsonJSON)
        currentStyle.add(sourceMap!)
        path = Bundle.main.path(forResource: "layer_fill", ofType: "json")
        let layerJSON = try! String(contentsOfFile: path!, encoding: .utf8)
        let layerMap = TTMapLayer.create(withStyleJSON: layerJSON, withMap: mapView)
        currentStyle.add(layerMap!)
    }

    func addImageSource() {
        let image = UIImage(named: "buckingham_palace")
        let quad = TTLatLngQuad(topLeft: TTCoordinate.BUCKINGHAM_PALACE_TOP_LEFT(),
                                withTopRight: TTCoordinate.BUCKINGHAM_PALACE_TOP_RIGHT(),
                                withBottomRight: TTCoordinate.BUCKINGHAM_PALACE_BOTTOM_LEFT(),
                                withBottomLeft: TTCoordinate.BUCKINGHAM_PALACE_BOTTOM_RIGHT())
        let sourceMap = TTMapImageSource.create(withID: IMG_SOURCE, image: image!, coordinates: quad)
        currentStyle.add(sourceMap)

        let path = Bundle.main.path(forResource: "layer_raster", ofType: "json")
        let layerJSON = try! String(contentsOfFile: path!, encoding: .utf8)
        let layerMap = TTMapLayer.create(withStyleJSON: layerJSON, withMap: mapView)
        currentStyle.add(layerMap!)
    }

    // MARK: OptionsViewDelegate

    override func displayExample(withID ID: Int, on: Bool) {
        super.displayExample(withID: ID, on: on)
        let geoLayer = currentStyle?.getLayerByID(GEO_LAYER_ID)
        let imgLayer = currentStyle?.getLayerByID(IMG_LAYER_ID)
        switch ID {
        case 1:
            imgLayer?.visibility = on ? .visible : .none
        default:
            geoLayer?.visibility = on ? .visible : .none
        }
    }

    func mapView(_ mapView: TTMapView, didSingleTap coordinate: CLLocationCoordinate2D) {
        let tap = mapView.point(for: coordinate)
        let geoJSONFeatures = mapView.features(at: tap, inStyleLayerIdentifiers: [GEO_LAYER_ID])
        if !geoJSONFeatures.features.isEmpty {
            toast.toast(message: "GeoJSON Polygon clicked!")
        }
    }
}
