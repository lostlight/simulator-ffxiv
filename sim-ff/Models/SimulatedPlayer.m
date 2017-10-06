//
//  SimulatedPlayer.m
//  sim-ff
//
//  Created by Nico, Carla on 29/09/2017.
//  Copyright © 2017 Silver Mines. All rights reserved.
//

#import "SimulatedPlayer.h"

@interface SimulatedPlayer()

    @property (nonatomic, strong) NSMutableDictionary* currentModifiers; //buffs //dictionary of arrays?
    @property (nonatomic, strong) NSMutableDictionary* currentStats;
@property (nonatomic, strong) NSMutableDictionary* currentResources;

    @property (nonatomic) int damageDone;
    @property (nonatomic) int potencyDamageDone;
    

    @property (nonatomic, strong) NSArray* beforeFightStart; //?? TODO LATER
    @property (nonatomic, strong) NSMutableArray* actionHistory; //what the player has executed so far

@property (nonatomic, strong) NSMutableDictionary* cooldowns; //will hold NSNumber for the next time it's going to be available

@end

@implementation SimulatedPlayer

- (void) reset
{
    _damageDone = 0;
    _potencyDamageDone = 0;
    _nextOGCDActionTime = -1;
    _nextGCDActionTime = -1;
    _baseRotationCurrentIndex = 0;
    _actionHistory = [[NSMutableArray alloc] init];
    _cooldowns = [[NSMutableDictionary alloc] init];
}

- (BOOL) isActionReady: (Action *) action forTime: (int) time
{
    return [_cooldowns[action.name] intValue] < time;
}

- (int) damageFor: (Action *)action onTarget:(Target *) target atTime: (int) time
{
    int damage = 0;
    //we're using this action so add it do the cooldown bar
    [_cooldowns setValue:[NSNumber numberWithInt: time + action.recast] forKey: action.name];

    //need to apply buffs in good order

    if (action.isOffGCD)
    {
        _nextOGCDActionTime = time + action.animationLock + self.latency;
    }
    else
    {
        _nextGCDActionTime = time + action.recast + self.latency; //does cast time need to go in here somehow?
    }
    _potencyDamageDone += action.potency;

    //add it to the action history too
    NSString *s = [NSString stringWithFormat:@"Time: %d Action: %@ Damage: %d Potency: %d", time, action.name, _damageDone, _potencyDamageDone];
    [_actionHistory addObject: @{@"action": action, @"log": s}];

    _damageDone += damage;
    return damage;
}

- (Action *) nextAction
{
	if (self.playerDelegate)
		return [playerDelegate nextAction];
	else
	{
		if (baseRotationCurrentIndex >= baseRotation.Length) baseRotationCurrentIndex = baseRotationCurrentIndex % baseRotation.Length;
		return baseRotation[baseRotationCurrentIndex];
	}
}

@end
