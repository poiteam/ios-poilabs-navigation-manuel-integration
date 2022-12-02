//
//  PLPositioningManager.h
//  PoilabsNavigation
//
//  Created by Emre Kuru on 8.11.2022.
//  Copyright © 2022 poilabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "PoilabsPositioning/PoilabsPositioning.h"
#import "PLNavigationManager.h"
#import "PLNPositioningManagerDelegate.h"
#import "Mapbox/Mapbox.h"
#import "PLNPositioningManagerDelegate.h"

@interface PLPositioningManager: NSObject<MGLLocationManager, PoilabsPositioningDelegate>

+ (instancetype _Nonnull )sharedInstance;

@property (nonatomic, weak) id<MGLLocationManagerDelegate> _Nullable delegate;
@property (nonatomic, weak) id<PLNPositioningManagerDelegate> _Nullable errorDelegate;

@property (nonatomic, readonly) CLAuthorizationStatus authorizationStatus;

@property(assign, nonatomic, nullable) CLLocation *lastLocation;

@property(strong,nonatomic) PLPositioning * _Nullable positioningManager;

-(void) startPositioningWith:(NSArray<PLPBeaconNode*>*_Nonnull)beacons;

-(void)getFirstLocation;

@property(assign, nonatomic) bool isRouteActive;

@property(strong, nonatomic) NSMutableArray<CLLocation*> * _Nullable routeCoordinates;

-(double)getDistanceBetweenRouteAndLocation:(CLLocationCoordinate2D)location;
@end
