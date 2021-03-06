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

class MapMultipleViewController: MapBaseViewController, TTMapViewDelegate {
    override func setupInitialCameraPosition() {
        mapView.center(on: TTCoordinate.AMSTERDAM(), withZoom: 12)
    }

    weak var secondMap: TTMapView!

    override func setupMap() {
        super.setupMap()
        mapView.delegate = self
    }

    override func onMapReady() {
        super.onMapReady()
        self.setupSecondMap()
    }

    func setupSecondMap() {
        let defaultStyle = TTMapStyleDefaultConfiguration()
        let builder = TTMapConfigurationBuilder.create().withTrafficKey(Key.Traffic).withMapKey(Key.Map).withMapStyleConfiguration(defaultStyle)
        let map = TTMapView(mapConfiguration: builder.build())
        self.secondMap = map
        self.secondMap.clipsToBounds = true
        self.secondMap.layer.borderColor = UIColor.white.cgColor
        self.secondMap.layer.borderWidth = TTSecoundMap.SecoundMapBorderSize()
        let customStyle = Bundle.main.path(forResource: "style", ofType: "json")
        secondMap.setStylePath(customStyle)
        super.mapView.addSubview(secondMap)
        self.setupConstrains()
        self.secondMap.setCameraPosition(TTCameraPositionBuilder.create(withCameraPosition: TTCoordinate.AMSTERDAM()).withZoom(8).build())
        drowShapes()
    }

    // MARK: TTMapViewDelegate

    func mapView(_: TTMapView, onCameraChanged cameraPosition: TTCameraPosition) {
        updateSecoundMap(coordinate: cameraPosition.cameraPosition)
    }

    func drowShapes() {
        self.secondMap.annotationManager.removeAllOverlays()
        var coordinates: [CLLocationCoordinate2D] = []
        coordinates.append(self.mapView.currentBounds().nwBounds)
        coordinates.append(CLLocationCoordinate2D(latitude: self.mapView.currentBounds().nwBounds.latitude, longitude: self.mapView.currentBounds().seBounds.longitude))
        coordinates.append(self.mapView.currentBounds().seBounds)
        coordinates.append(CLLocationCoordinate2D(latitude: self.mapView.currentBounds().seBounds.latitude, longitude: self.mapView.currentBounds().nwBounds.longitude))
        coordinates.append(self.mapView.currentBounds().nwBounds)
        let color = UIColor.yellow
        let pointsCount = 5
        let polyLine = TTPolyline(coordinates: &coordinates, count: UInt(pointsCount), opacity: 1, width: 1.0, color: color)
        self.secondMap.annotationManager.add(polyLine)
    }

    func updateSecoundMap(coordinate: CLLocationCoordinate2D) {
        if self.secondMap != nil {
            drowShapes()
            self.secondMap.setCameraPosition(TTCameraPositionBuilder.create(withCameraPosition: coordinate).build())
        }
    }

    func setupConstrains() {
        let mapSize = super.mapView.bounds.width / 2
        self.secondMap.translatesAutoresizingMaskIntoConstraints = false
        self.secondMap.heightAnchor.constraint(equalToConstant: mapSize).isActive = true
        self.secondMap.widthAnchor.constraint(equalToConstant: mapSize).isActive = true
        self.secondMap.topAnchor.constraint(equalTo: self.mapView.topAnchor, constant: 5).isActive = true
        self.secondMap.rightAnchor.constraint(equalTo: self.mapView.rightAnchor, constant: -5).isActive = true
        self.secondMap.layer.cornerRadius = mapSize / 2
    }
}
