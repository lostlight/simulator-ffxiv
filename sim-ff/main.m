//
//  main.m
//  sim-ff
//
//  Created by Nico, Carla on 28/09/2017.
//  Copyright © 2017 Silver Mines. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
    }
    return 0;



    /*
     abilities: no cost, own cd, oGCD, animation lock time?
     spell: cast, recast, mp cost, range, radius, potency, target(s), other effects, aspect, 
     weaponskill: cast, recast, potency, tp cost, range, radius, combo preq, [] combo effect and duration, potency,

     
     stats: intelligence, mind, strength, dexterity, ...
     resources: mp, tp, hp, ??
     
     target: multipliers[crit, physical damage, ??], dots[parent-needs to be unique, otherwise pre-assign every 3s damage? how to do overwrites? add them as "shadow" ticks? to the "rotation"? which should resolve without increasing the fight duration timer],
     
     player: buffs[spellspeed, statincrease, crit[], damage, ??]
     
     group: mainactor, other (other can just set buffs depending on class at start) //resolve party buffs
     */
}
