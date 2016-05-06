//
//  Character.swift
//  oop exercise
//
//  Created by Ben Graham on 6/05/2016.
//  Copyright © 2016 Ben Graham. All rights reserved.
//

import Foundation

class Character {
    private var _name : String!
    private var _attackPower = 20
    private var _hp = 100
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var name: String {
        return _name
    }
    
    var attackPower: Int {
        return _attackPower
    }
    
    var isAlive: Bool {
        if hp <= 0 {
            return false
        }
        return true
    }
    
    init(playerName: String, startingHP: Int, attackPwr: Int) {
        self._name = playerName
        self._hp = startingHP
        self._attackPower = attackPwr
    }
    
    func resetHP(newHP: Int) {
        self._hp = newHP
    }
    
    func startAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        return true
    }
}
