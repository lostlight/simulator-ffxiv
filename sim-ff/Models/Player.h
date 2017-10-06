//
//  Player.h
//  sim-ff
//
//  Created by Nico, Carla on 29/09/2017.
//  Copyright © 2017 Silver Mines. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong) NSArray* actions; //will have all available abilities, spells, weaponskills...
//@property (nonatomic, strong) NSArray* spells;
//@property (nonatomic, strong) NSArray* weaponskills;
@property (nonatomic, strong) NSDictionary* stats;
@property (nonatomic, strong) NSDictionary* resources;
@property (nonatomic) int latency; //will do this as 50 ms? for now

@property (nonatomic) NSString* job;

+(Player *) newWhiteMage;
+(Player *) newAstrologian;
+(Player *) newScholar;
+(Player *) newMonk;
+(Player *) newMSamurai;
+(Player *) newMNinja;
+(Player *) newBard;
+(Player *) newMachinist;
+(Player *) newBlackMage;
+(Player *) newRedMage;
+(Player *) newPaladin;
+(Player *) newWarrior;
+(Player *) newDarkKnight;

@end
