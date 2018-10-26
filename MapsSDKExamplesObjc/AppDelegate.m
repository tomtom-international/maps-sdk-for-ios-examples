/**
 * Copyright (c) 2018 TomTom N.V. All rights reserved.
 *
 * This software is the proprietary copyright of TomTom N.V. and its subsidiaries and may be used
 * for internal evaluation purposes or commercial use strictly subject to separate licensee
 * agreement between you and TomTom. If you are the licensee, you are only permitted to use
 * this Software in accordance with the terms of your license agreement. If you are not the
 * licensee then you are not authorised to use this software in any manner and should
 * immediately return it to TomTom N.V.
 */

#import "AppDelegate.h"
#import "MapTilesViewController.h"
#import "MapVectorTrafficViewController.h"
#import "MapRasterTrafficViewController.h"
#import "MapLanguageViewController.h"
#import "MapGeopoliticalViewController.h"
#import "MapCustomStyleViewController.h"
#import "MapStaticImageViewController.h"
#import "MapCenteringViewController.h"
#import "MapPerspectiveViewController.h"
#import "MapEventsViewController.h"
#import "MapUIExtensionsViewController.h"
#import "MapMarkersViewController.h"
#import "MapAdvancedMarkersViewController.h"
#import "MapBallonsViewController.h"
#import "MapShapesViewController.h"
#import "MapMarkersClusteringViewController.h"
#import "TrafficIncidentsViewController.h"
#import "SearchAddressViewController.h"
#import "SearchCategoryViewController.h"
#import "SearchLanguageSelectorViewController.h"
#import "SearchTypeaheadParameterViewController.h"
#import "SearchMaxFuzzinessLevelViewController.h"
#import "SearchReverseGeocodingViewController.h"
#import "SearchAlongTheRouteViewController.h"
#import "SearchGeometryViewController.h"
#import "SearchEntryPointsViewController.h"
#import "SearchAdditionalDataViewController.h"
#import "SearchBatchViewController.h"
#import "RoutingTravelModesViewController.h"
#import "RoutingRouteTypesViewController.h"
#import "RoutingRouteAvoidsViewController.h"
#import "RoutingRouteWithWaypointsViewController.h"
#import "RoutingDepartureArrivalTimeViewController.h"
#import "RoutingAlternativesRouteViewController.h"
#import "RoutingManeuverListViewController.h"
#import "RoutingConsumptionModelViewController.h"
#import "RoutingSupportingPointsViewController.h"
#import "RoutingReachableRangeViewController.h"
#import "RoutingBatchRouteViewController.h"

@interface AppDelegate () <ExampleDisplayRequest>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.window makeKeyAndVisible];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    OptionsViewController *mainVC = [[OptionsViewController alloc] initWithCollectionViewLayout:layout];
    self.mainVC = mainVC;
    mainVC.exampleDelegate = self;
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    return YES;
}

#pragma mark ExampleDisplayRequest

- (void)requestExampleWithIndex:(NSInteger)index category:(enum Category)category {
    BaseViewController *newViewController;
    if(category == 0) {
        switch (index) {
            case 0:
                newViewController = [MapTilesViewController new];
                break;
            case 1:
                newViewController = [MapVectorTrafficViewController new];
                break;
            case 2:
                newViewController = [MapRasterTrafficViewController new];
                break;
            case 3:
                newViewController = [MapLanguageViewController new];
                break;
            case 4:
                newViewController = [MapGeopoliticalViewController new];
                break;
            case 5:
                newViewController = [MapCustomStyleViewController new];
                break;
            case 6:
                newViewController = [MapStaticImageViewController new];
                break;
            case 7:
                newViewController = [MapCenteringViewController new];
                break;
            case 8:
                newViewController = [MapPerspectiveViewController new];
                break;
            case 9:
                newViewController = [MapEventsViewController new];
                break;
            case 10:
                newViewController = [MapUIExtensionsViewController new];
                break;
            case 11:
                newViewController = [MapMarkersViewController new];
                break;
            case 12:
                newViewController = [MapAdvancedMarkersViewController new];
                break;
            case 13:
                newViewController = [MapBallonsViewController new];
                break;
            case 14:
                newViewController = [MapShapesViewController new];
                break;
            case 15:
                newViewController = [MapMarkersClusteringViewController new];
                break;
            default:
                [NSException raise:NSInternalInconsistencyException format:@"This VC is not handled"];
                break;
        }
    } else if (category == 1) {
        switch (index) {
            case 0:
                newViewController = [TrafficIncidentsViewController new];
                break;
            default:
                [NSException raise:NSInternalInconsistencyException format:@"This VC is not handled"];
                break;
        }
    } else if (category == 2) {
        switch (index) {
            case 0:
                newViewController = [RoutingTravelModesViewController new];
                break;
            case 1:
                newViewController = [RoutingRouteTypesViewController new];
                break;
            case 2:
                newViewController = [RoutingRouteAvoidsViewController new];
                break;
            case 3:
                newViewController = [RoutingRouteWithWaypointsViewController new];
                break;
            case 4:
                newViewController = [RoutingDepartureArrivalTimeViewController new];
                break;
            case 5:
                newViewController = [RoutingAlternativesRouteViewController new];
                break;
            case 6:
                newViewController = [RoutingManeuverListViewController new];
                break;
            case 7:
                newViewController = [RoutingConsumptionModelViewController new];
                break;
            case 8:
                newViewController = [RoutingSupportingPointsViewController new];
                break;
            case 9:
                newViewController = [RoutingReachableRangeViewController new];
                break;
            case 10:
                newViewController = [RoutingBatchRouteViewController new];
                break;
            default:
                [NSException raise:NSInternalInconsistencyException format:@"This VC is not handled"];
                break;
        }
    } else if (category == 3) {
        switch (index) {
            case 0:
                newViewController = [SearchAddressViewController new];
                break;
            case 1:
                newViewController = [SearchCategoryViewController new];
                break;
            case 2:
                newViewController = [SearchLanguageSelectorViewController new];
                break;
            case 3:
                newViewController = [SearchTypeaheadParameterViewController new];
                break;
            case 4:
                newViewController = [SearchMaxFuzzinessLevelViewController new];
                break;
            case 5:
                newViewController = [SearchReverseGeocodingViewController new];
                break;
            case 6:
                newViewController = [SearchAlongTheRouteViewController new];
                break;
            case 7:
                newViewController = [SearchGeometryViewController new];
                break;
            case 8:
                newViewController = [SearchEntryPointsViewController new];
                break;
            case 9:
                newViewController = [SearchAdditionalDataViewController new];
                break;
            case 10:
                newViewController = [SearchBatchViewController new];
                break;
            default:
                [NSException raise:NSInternalInconsistencyException format:@"This VC is not handled"];
                break;
        }
    }
    newViewController.name = [MenuLabels titleForIndex:category subindex:index];
    [self.mainVC displayExample:newViewController];
}

@end