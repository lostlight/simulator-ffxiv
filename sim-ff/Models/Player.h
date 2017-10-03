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

+(Player *) loadWhiteMage;
+(Player *) loadAstrologian;
+(Player *) loadScholar;
+(Player *) loadMonk;
+(Player *) loadMSamurai;
+(Player *) loadMNinja;
+(Player *) loadBard;
+(Player *) loadMachinist;
+(Player *) loadBlackMage;
+(Player *) loadRedMage;
+(Player *) loadPaladin;
+(Player *) loadWarrior;
+(Player *) loadDarkKnight;

@end
