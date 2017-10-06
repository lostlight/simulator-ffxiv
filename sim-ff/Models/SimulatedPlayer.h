//
//  SimulatedPlayer.h
//  sim-ff
//
//  Created by Nico, Carla on 29/09/2017.
//  Copyright © 2017 Silver Mines. All rights reserved.
//

#import "Player.h"
#import "Action.h"
#import "Target.h"

@interface SimulatedPlayer : Player

@property (nonatomic) int baseRotationCurrentIndex;
@property (nonatomic, strong) NSArray* baseRotation; //abilities, spells, weaponskills used in order of appearance here

@property (nonatomic) int nextGCDActionTime; //ms
@property (nonatomic) int nextOGCDActionTime;
@property (nonatomic, weak) PlayerDelegate * delegate;

- (Action *) nextAction;
- (BOOL) isActionReady: (Action *) action forTime: (int) time;
- (int) damageFor: (Action *)action onTarget:(Target *) target atTime: (int) time;

@end
