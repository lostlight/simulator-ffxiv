//
//  Ability.h
//  sim-ff
//
//  Created by Nico, Carla on 29/09/2017.
//  Copyright © 2017 Silver Mines. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ActionType) {
  Abiltiy,
  Spell,
  Weaponskill
};

typedef NS_ENUM(NSInteger, Aspect) {
	Unaspected,
	Earth,
	Wind
};

typedef NS_ENUM(NSInteger, Job) {
	WHM,
	AST,
	SAM,
	BRD,
	MNK
};

@interface Action : NSObject

@property (nonatomic) BOOL isOffGCD; //yes for Abilities
@property (nonatomic) BOOL hasDamageOverTime;
@property (nonatomic) ActionType type;
@property (nonatomic) Job jobRestiction;
@property (nonatomic) Aspect aspect;

@property (nonatomic) int potency;
@property (nonatomic) int comboPotency; //potency in case combo was done

@property (nonatomic) int damageOverTimePotencyPerTick;
@property (nonatomic) int damageOverTimeDuration;

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


@end

