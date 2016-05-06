//
//  ViewController.swift
//  oop exercise
//
//  Created by Ben Graham on 6/05/2016.
//  Copyright © 2016 Ben Graham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player1 : Character!
    var player2 : Character!
    var message : String = ""

    @IBOutlet weak var gameMessageLbl: UILabel!
    @IBOutlet weak var player1Btn: UIButton!
    @IBOutlet weak var player2Btn: UIButton!
    @IBOutlet weak var restartGameBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1 = Character(playerName: "Billy Bob", startingHP: 100, attackPwr: 20)
        player2 = Character(playerName: "Sally Anne", startingHP: 100, attackPwr: 20)
 
    }

    func enableButton1() {
        if player2Btn.enabled {
            player1Btn.enabled = true
        }
    }

    func enableButton2() {
        if player1Btn.enabled {
            player2Btn.enabled = true
        }
    }

    
    func disableButtonFor3Seconds(button: UIButton) {
        if button.tag == 1 {
            player2Btn.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(enableButton2), userInfo: nil, repeats: false)
        } else {
            player1Btn.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(enableButton1), userInfo: nil, repeats: false)
        }
    }
    
    func enableRestartGame() {
        restartGameBtn.hidden = false
    }
    
    @IBAction func restartGame(sender: AnyObject) {
        restartGameBtn.hidden = true
        player1.resetHP(100)
        player2.resetHP(100)
        gameMessageLbl.text = "Ready to Begin!"
        player1Btn.enabled = true
        player2Btn.enabled = true
    }
    
    @IBAction func player1AttackBtn(sender: AnyObject) {
        if player2Btn.enabled {
            disableButtonFor3Seconds(player1Btn)
            player2.startAttack(player1.attackPower)
            gameMessageLbl.text = "\(player1.name) (\(player1.hp)HP) attacks \(player2.name) (\(player2.hp)HP)!"
            if !player2.isAlive {
                gameMessageLbl.text = "\(player1.name) wins!"
                player1Btn.enabled = false
                player2Btn.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: #selector(enableRestartGame), userInfo: nil, repeats: false)
            }
        }
    }
    
    @IBAction func player2AttackBtn(sender: AnyObject) {
        if player1Btn.enabled {
            disableButtonFor3Seconds(player2Btn)
            player1.startAttack(player2.attackPower)
            gameMessageLbl.text = "\(player2.name) (\(player2.hp)HP) attacks \(player1.name) (\(player1.hp)HP)!"
            if !player1.isAlive {
                gameMessageLbl.text = "\(player2.name) wins!"
                player1Btn.enabled = false
                player2Btn.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: #selector(enableRestartGame), userInfo: nil, repeats: false)
            }
        }
    }
    

}

