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

#import "MapRasterTrafficViewController.h"
#import <TomTomOnlineSDKMaps/TomTomOnlineSDKMaps.h>

@implementation MapRasterTrafficViewController

- (void)setupCenterOnWillHappen {
    [self.mapView centerOnCoordinate:[TTCoordinate LONDON] withZoom:12];
}

- (OptionsView *)getOptionsView {
    return [[OptionsViewMultiSelect alloc] initWithLabels:@[@"Incidents", @"Flow", @"No traffic"] selectedID:2];
}

- (void)setupMap {
    [super setupMap];
    [self.mapView setTilesType:TTMapTilesRaster];
    self.mapView.trafficTileStyle = [TTRasterTileType setStyle:TTRasterStyleRelative];
    self.mapView.trafficIncidentsStyle = TTTrafficIncidentsStyleRaster;
}

#pragma mark OptionsViewDelegate

- (void)displayExampleWithID:(NSInteger)ID on:(BOOL)on {
    [super displayExampleWithID:ID on:on];
    switch (ID) {
        case 2:
            [self hideTraffic];
            break;
        case 1:
            [self displayFLow];
            break;
        default:
            [self displayIncidents];
            break;
    }
}

#pragma mark Examples

- (void)displayIncidents {
    self.mapView.trafficIncidentsOn = YES;
}

- (void)displayFLow {
    self.mapView.trafficFlowOn = YES;
}

- (void)hideTraffic {
    self.mapView.trafficIncidentsOn = NO;
    self.mapView.trafficFlowOn = NO;
}

@end