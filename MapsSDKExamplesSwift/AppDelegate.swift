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
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ExampleDisplayRequest {
    var window: UIWindow?
    weak var mainVC: OptionsViewController!

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let layout = UICollectionViewFlowLayout()
        let mainVC = OptionsViewController(collectionViewLayout: layout)
        self.mainVC = mainVC
        mainVC.exampleDelegate = self
        window?.rootViewController = UINavigationController(rootViewController: mainVC)
        return true
    }

    func requestExample(index: Int, category: Options.Category) {
        var newViewController: BaseViewController!
        if category == .Map {
            switch index {
            case 0:
                newViewController = MapTilesViewController()
            case 1:
                newViewController = MapVectorTrafficViewController()
            case 2:
                newViewController = MapRasterTrafficViewController()
            case 3:
                newViewController = MapLanguageViewController()
            case 4:
                newViewController = MapGeopoliticalViewController()
            case 5:
                newViewController = MapCustomStyleViewController()
            case 6:
                newViewController = MapLayersVisibilityViewController()
            case 7:
                newViewController = MapPoiLayersVisibilityViewController()
            case 8:
                newViewController = MapDynamicMapSourcesViewController()
            case 9:
                newViewController = MapDynamicLayerOrderingViewController()
            case 10:
                newViewController = MapInteractiveLayersViewController()
            case 11:
                newViewController = MapImageClusteringViewController()
            case 12:
                newViewController = MapStaticImageViewController()
            case 13:
                newViewController = MapCenteringViewController()
            case 14:
                newViewController = MapInitializationViewController()
            case 15:
                newViewController = MapPerspectiveViewController()
            case 16:
                newViewController = MapSnapshotImageViewController()
            case 17:
                newViewController = MapEventsViewController()
            case 18:
                newViewController = MapUIExtensionsViewController()
            case 19:
                newViewController = MapMarkersViewController()
            case 20:
                newViewController = MapAdvancedMarkersViewController()
            case 21:
                newViewController = MapBallonsViewController()
            case 22:
                newViewController = MapShapesViewController()
            case 23:
                newViewController = MapMarkersClusteringViewController()
            case 24:
                newViewController = MapMultipleViewController()
            case 25:
                newViewController = MapWithBuildingHeightsViewController()
            case 26:
                newViewController = MapRouteCustomisationViewController()
            case 27:
                newViewController = MapTrafficAlongTheRoute()
            default:
                fatalError("This VC is not handled")
            }
        } else if category == .Traffic {
            switch index {
            case 0:
                newViewController = TrafficIncidentsViewController()
            default:
                fatalError("This VC is not handled")
            }
        } else if category == .Routing {
            switch index {
            case 0:
                newViewController = RoutingTravelModesViewController()
            case 1:
                newViewController = RoutingRouteTypesViewController()
            case 2:
                newViewController = RoutingRouteAvoidsViewController()
            case 3:
                newViewController = RoutingRouteWithWaypointsViewController()
            case 4:
                newViewController = RoutingDepartureArrivalTimeViewController()
            case 5:
                newViewController = RoutingAlternativesRouteViewController()
            case 6:
                newViewController = RoutingManeuverListViewController()
            case 7:
                newViewController = RoutingConsumptionModelViewController()
            case 8:
                newViewController = RoutingSupportingPointsViewController()
            case 9:
                newViewController = RoutingReachableRangeViewController()
            case 10:
                newViewController = RoutingBatchRouteViewController()
            case 11:
                newViewController = RoutingBatchReachableRouteViewController()
            case 12:
                newViewController = RoutingMatrixViewController()
            case 13:
                newViewController = RoutingAvoidVignettesAndAreasViewController()
            case 14:
                newViewController = LongDistanceEVRoutingViewController()
            default:
                fatalError("This VC is not handled")
            }
        } else if category == .Driving {
            switch index {
            case 0:
                newViewController = MapFollowTheChevronController()
            case 1:
                newViewController = MapMatchingViewController()
            case 2:
                newViewController = RouteMatchingViewController()
            case 3:
                newViewController = ZoomingTheRouteViewController()
            default:
                fatalError("This VC is not handled")
            }
        } else if category == .Search {
            switch index {
            case 0:
                newViewController = SearchAddressViewController()
            case 1:
                newViewController = SearchPoiCategoriesViewController()
            case 2:
                newViewController = SearchCategoryViewController()
            case 3:
                newViewController = SearchLanguageSelectorViewController()
            case 4:
                newViewController = SearchTypeaheadParameterViewController()
            case 5:
                newViewController = SearchAutocompleteViewController()
            case 6:
                newViewController = SearchMaxFuzzinessLevelViewController()
            case 7:
                newViewController = SearchReverseGeocodingViewController()
            case 8:
                newViewController = SearchAlongTheRouteViewController()
            case 9:
                newViewController = SearchGeometryViewController()
            case 10:
                newViewController = SearchChargingStationsViewController()
            case 11:
                newViewController = SearchEntryPointsViewController()
            case 12:
                newViewController = SearchAdditionalDataViewController()
            case 13:
                newViewController = SearchBatchViewController()
            case 14:
                newViewController = SearchPolygonsForRevGeoViewController()
            case 15:
                newViewController = SearchOpeningHoursViewController()
            case 16:
                newViewController = SearchPoiDetailsAndPhotosViewController()
            default:
                fatalError("This VC is not handled")
            }
        } else if category == .Geofencing {
            switch index {
            case 0:
                newViewController = GeofencingReportViewController()
            default:
                fatalError("This VC is not handled")
            }
        }
        newViewController.name = MenuLabels.titleFor(index: category.rawValue, subindex: index)
        mainVC.displayExample(newViewController)
    }
}
