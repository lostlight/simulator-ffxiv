//
//  FightSimulator.h
//  sim-ff
//
//  Created by Nico, Carla on 29/09/2017.
//  Copyright © 2017 Silver Mines. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FightSimulator : NSObject

@property (nonatomic) int totalDamage;
@property (nonatomic) float fightDuration;

//duration is ms here
-  (void) runSimulationFor: (int) duration;

@end
