//
//  Player.m
//  sim-ff
//
//  Created by Nico, Carla on 29/09/2017.
//  Copyright © 2017 Silver Mines. All rights reserved.
//

#import "Player.h"
#import "Action.h"

@implementation Player

+(Player *) newWhiteMage
{
	Player *p = [Player alloc] init];
	
	p.latency = 0;
	p.job = @"WHM";
	
	[p loadAbilities];
	return p;
}

- (void) loadAbilities
{
	NSMutableArray *tmp = [NSMutableArray alloc] init];
	Action *a;
	a = [Action alloc] init];
	a.name = @"Stone";
	a.jobRestiction = Job.WHM;
	a.prequisiteComboActionName = @"";
	a.aspect = Aspect.Earth;
	a.type = ActionType.Spell;
	a.animationLock = 0;
	a.recast = 250;
	a.cast = 250; //2.5 seconds
	a.tpCost = 0;
	a.mpCost = 720;
	a.damageOverTimePotencyPerTick = 0;
	a.hasDamageOverTime = NO;
	a.comboPotency = 0;
	a.potency = 250;
	a.isOffGCD = NO;
	[tmp addObject: a];
	
	a = [Action alloc] init];
	a.name = @"Assize";
	a.jobRestiction = Job.WHM;
	a.prequisiteComboActionName = @"";
	a.aspect = Aspect.Unaspected;
	a.type = ActionType.Ability;
	a.animationLock = 750;
	a.recast = 600;
	a.cast = 0; //instant
	a.tpCost = 0;
	a.mpCost = 0;
	a.damageOverTimePotencyPerTick = 0;
	a.hasDamageOverTime = NO;
	a.comboPotency = 0;
	a.potency = 300;
	a.isOffGCD = YES;
	[tmp addObject: a];
	
	a = [Action alloc] init];
	a.name = @"Aero II";
	a.jobRestiction = Job.WHM;
	a.prequisiteComboActionName = @"";
	a.aspect = Aspect.Wind;
	a.type = ActionType.Spell;
	a.animationLock = 0;
	a.recast = 250;
	a.cast = 0; //instant
	a.tpCost = 0;
	a.mpCost = 600;
	a.damageOverTimePotencyPerTick = 50;
	a.damageOverTimeDuration = 18; //seconds
	a.hasDamageOverTime = YES;
	a.comboPotency = 0;
	a.potency = 50;
	a.isOffGCD = NO;
	[tmp addObject: a];
	
	a = [Action alloc] init];
	a.name = @"Aero III";
	a.jobRestiction = Job.WHM;
	a.prequisiteComboActionName = @"";
	a.aspect = Aspect.Wind;
	a.type = ActionType.Spell;
	a.animationLock = 0;
	a.recast = 250;
	a.cast = 250; //instant
	a.tpCost = 0;
	a.mpCost = 960;
	a.damageOverTimePotencyPerTick = 40;
	a.damageOverTimeDuration = 24; //seconds
	a.hasDamageOverTime = NO;
	a.comboPotency = 0;
	a.potency = 50;
	a.isOffGCD = NO;
	[tmp addObject: a];
	
	a = [Action alloc] init];
	a.name = @"	Presence of Mind";
	a.jobRestiction = Job.WHM;
	a.prequisiteComboActionName = @"";
	a.aspect = Aspect.Unaspected;
	a.type = ActionType.Ability;
	a.animationLock = 750;
	a.recast = 600;
	a.cast = 0; //instant
	a.tpCost = 0;
	a.mpCost = 0;
	a.damageOverTimePotencyPerTick = 0;
	a.hasDamageOverTime = NO;
	a.comboPotency = 0;
	a.potency = 300;
	a.isOffGCD = YES;
	[tmp addObject: a];
	
	self.actions = [NSArray arrayWithArray: tmp];
}



@property (nonatomic) BOOL isOffGCD; //yes for Abilities
@property (nonatomic) BOOL hasDamageOverTime;

@property (nonatomic) int potency;
@property (nonatomic) int comboPotency; //potency in case combo was done

@property (nonatomic) int damageOverTimePotencyPerTick;

//resource cost
@property (nonatomic) int mpCost;
@property (nonatomic) int tpCost;

//times
@property (nonatomic) int cast;
@property (nonatomic) int recast;
@property (nonatomic) int animationLock; //general consensus seems to be this is 750 (0.75 ms) for most abilities (that is ogcd stuff)

//combo
@property (nonatomic) NSString* prequisiteComboActionName; //OffGCD will not break combos right? //keeping this string for easier debugging for now at least
@property (nonatomic) NSString* name;
@property (nonatomic) NSString* jobRestiction;
@property (nonatomic) AbilityType type;

@end
