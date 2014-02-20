//
//  PlayingCard.m
//  BlackJack
//
//  Created by Student on 2/20/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(BOOL) isAnAce{
    if(self.value==1) return YES; // test this in a bit with no "==1"
    return NO;
}

+(NSMutableArray *) createDeck{
    NSMutableArray *array = [NSMutableArray array];
    PlayingCard *card;
    int suit, value;
    
    for(suit =0; suit<4; suit++){
        for(value =1; value<=13; value++){
            card = [[PlayingCard alloc] init];
            
            card.suit = suit;
            card.value = value;
            
            [array addObject:card];
      }
    }
    NSLog(@"%d",array.count);

    return array;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%d of %d", self.value,self.suit];
}

-(BOOL) isAFaceOrTenCard{
    if(_value >=10 && _value <=13)
    {
        return true;
    }
    return false;
}
@end
