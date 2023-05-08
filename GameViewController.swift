//
//  GameViewController.swift
//  NotA-Game
//
//  Created by Steve Roseik on 1/24/21.
//

import UIKit


var winner = 2;
var gameBoard = [0,0,0,0,0,0,0,0,0];
var GameOver = false;
var messageEnd = "";
let combinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
class GameViewController: UIViewController {

    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var B6: UIButton!
    @IBOutlet weak var B7: UIButton!
    @IBOutlet weak var B8: UIButton!
    @IBOutlet weak var B9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameBoard = [0,0,0,0,0,0,0,0,0];
        GameOver = false;
       self.B1.setBackgroundImage(nil,for: .normal)
       self.B2.setBackgroundImage(nil,for: .normal)
       self.B3.setBackgroundImage(nil,for: .normal)
       self.B4.setBackgroundImage(nil,for: .normal)
       self.B5.setBackgroundImage(nil,for: .normal)
       self.B6.setBackgroundImage(nil,for: .normal)
       self.B7.setBackgroundImage(nil,for: .normal)
       self.B8.setBackgroundImage(nil,for: .normal)
       self.B9.setBackgroundImage(nil,for: .normal)
        
    }
    

    

    @IBAction func setX (_sender: AnyObject){
      
       
        if (gameBoard[_sender.tag-1] == 0 && !GameOver){
            _sender.setBackgroundImage(UIImage(named: "xImage"), for: UIControl.State())
                    gameBoard[_sender.tag-1] = 1
            
        //Check for win
            var win = check()
            if GameOver{
                switch win {
                case 1:
                    messageEnd = "The winner is X"
                    winner = 1;
                    break
                case 2:
                    messageEnd = "The winner is O"
                    winner = 2;
                    break
                case 3:
                    messageEnd = "DRAW!"
                     winner = ((Int.random(in: 0...100)) % 2) + 1
                    break
                default:
                    Label1.text = Label1.text
                }
                let alertEnd = UIAlertController(title: "Game Ended", message: messageEnd + " Would you like to restart the game?", preferredStyle: .alert)
               
                alertEnd.addAction(UIAlertAction(title: "Yes", style: .default, handler:{ action in
                     gameBoard = [0,0,0,0,0,0,0,0,0];
                     GameOver = false;
                    self.B1.setBackgroundImage(nil,for: .normal)
                    self.B2.setBackgroundImage(nil,for: .normal)
                    self.B3.setBackgroundImage(nil,for: .normal)
                    self.B4.setBackgroundImage(nil,for: .normal)
                    self.B5.setBackgroundImage(nil,for: .normal)
                    self.B6.setBackgroundImage(nil,for: .normal)
                    self.B7.setBackgroundImage(nil,for: .normal)
                    self.B8.setBackgroundImage(nil,for: .normal)
                    self.B9.setBackgroundImage(nil,for: .normal)
                    
                    if (winner == 2){
                        var randomInt = ((Int.random(in: 0...100)) % 9)
                        var block = -1
                        if gameBoard[randomInt] == 0 {
                            block = randomInt
                        }else{
                            while randomInt != 0{
                                randomInt = ((Int.random(in: 0...100)) % 9)
                                if gameBoard[randomInt] == 0 {
                                   block = randomInt
                                }
                            }
                        }
                       
                        if block != -1 {
                        switch block {
                        case 0:
                            self.B1.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[0] = 2;
                            break
                        case 1:
                            self.B2.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[1] = 2;
                            break
                        case 2:
                            self.B3.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[2] = 2;
                            break
                        case 3:
                            self.B4.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[3] = 2;
                            break
                        case 4:
                            self.B5.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[4] = 2;
                            break
                        case 5:
                            self.B6.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[5] = 2;
                            break
                        case 6:
                            self.B7.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[6] = 2;
                            break
                        case 7:
                            self.B8.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[7] = 2;
                            break
                        case 8:
                            self.B9.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[8] = 2;
                            break
                        default:
                            self.Label1.text = "DRAW"
                        }
                            
                        }
                    }
                    
                }))
                alertEnd.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                //ALERT
                self.present(alertEnd, animated: true)
            }
            //END OF CHECK
        
        
        
        if (!GameOver){
            let block = randomplay()
            if block != -1 {
            switch block {
            case 0:
                B1.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                gameBoard[0] = 2;
                break
            case 1:
                B2.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                gameBoard[1] = 2;
                break
            case 2:
                B3.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                gameBoard[2] = 2;
                break
            case 3:
                B4.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                gameBoard[3] = 2;
                break
            case 4:
                B5.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                gameBoard[4] = 2;
                break
            case 5:
                B6.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                gameBoard[5] = 2;
                break
            case 6:
                B7.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                gameBoard[6] = 2;
                break
            case 7:
                B8.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                gameBoard[7] = 2;
                break
            case 8:
                B9.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                gameBoard[8] = 2;
                break
            default:
                Label1.text = "DRAW"
            }
                
            }
            win = check()
            if GameOver{
                switch win {
                case 1:
                    messageEnd = "You WON! That's unexpected!"
                    winner = 1
                    break
                case 2:
                    messageEnd = "You LOST!!"
                    winner = 2
                    break
                case 3:
                    messageEnd = "DRAW!"
                    winner = ((Int.random(in: 0...100)) % 2) + 1
                    break
                default:
                    Label1.text = Label1.text
                }
                let alertEnd = UIAlertController(title: "Game Ended", message: messageEnd + " Would you like to restart the game?", preferredStyle: .alert)
                alertEnd.addAction(UIAlertAction(title: "Yes", style: .default, handler:{ action in
                     gameBoard = [0,0,0,0,0,0,0,0,0];
                     GameOver = false;
                    self.B1.setBackgroundImage(nil,for: .normal)
                    self.B2.setBackgroundImage(nil,for: .normal)
                    self.B3.setBackgroundImage(nil,for: .normal)
                    self.B4.setBackgroundImage(nil,for: .normal)
                    self.B5.setBackgroundImage(nil,for: .normal)
                    self.B6.setBackgroundImage(nil,for: .normal)
                    self.B7.setBackgroundImage(nil,for: .normal)
                    self.B8.setBackgroundImage(nil,for: .normal)
                    self.B9.setBackgroundImage(nil,for: .normal)
                    
                    if (winner == 2){
                        var randomInt = ((Int.random(in: 0...100)) % 9)
                        var bloc = -1
                        if gameBoard[randomInt] == 0 {
                            bloc = randomInt
                        }else{
                            while randomInt != 0{
                                randomInt = ((Int.random(in: 0...100)) % 9)
                                if gameBoard[randomInt] == 0 {
                                   bloc = randomInt
                                }
                            }
                        }
                       
                        if bloc != -1 {
                        switch block {
                        case 0:
                            self.B1.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[0] = 2;
                            break
                        case 1:
                            self.B2.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[1] = 2;
                            break
                        case 2:
                            self.B3.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[2] = 2;
                            break
                        case 3:
                            self.B4.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[3] = 2;
                            break
                        case 4:
                            self.B5.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[4] = 2;
                            break
                        case 5:
                            self.B6.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[5] = 2;
                            break
                        case 6:
                            self.B7.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[6] = 2;
                            break
                        case 7:
                            self.B8.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[7] = 2;
                            break
                        case 8:
                            self.B9.setBackgroundImage(UIImage(named: "oImage"), for: UIControl.State())
                            gameBoard[8] = 2;
                            break
                        default:
                            self.Label1.text = "DRAW"
                        }
                            
                        }
                    }
                    
                    
                }))
                alertEnd.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                //ALERT
                self.present(alertEnd, animated: true)
            }
            }
        }else{
           print("ERROR HERE")
        }
    }
        
}





    func randomplay ()->Int{
        var counter = 0;
        // TRY TO WIN
        for i in combinations{
            counter = 0;
            for  x in 0...2{
                if (gameBoard[i[x]] == 2){
                    counter += 1
                }
            }
            if (counter == 2){
                for j in 0...2{
                    if gameBoard[i[j]] == 0 {
                        return i[j]
                    }
                }
            }
        }
        //BLOCK X FROM WINNING
        for i in combinations{
            counter = 0;
            for  x in 0...2{
                if (gameBoard[i[x]] == 1){
                    counter += 1
                }
            }
            if (counter == 2){
                for j in 0...2{
                    if gameBoard[i[j]] == 0 {
                        return i[j]
                    }
                }
            }
        }
        // Try again to win
        var zer = 0
        var tou = 0
        for i in combinations{
            zer = 0
            tou = 0
            for  x in 0...2{
                if (gameBoard[i[x]] == 0){
                    zer += 1
                }else if (gameBoard[i[x]] == 0){
                    tou += 1
                }
            }
            
            if (zer == 2 && tou == 2){
                for  j in 0...2{
                    if (gameBoard[i[j]] == 0){
                        return i[0]
                    }
                }
            
            }
        }
        //Game Strategy
        if (gameBoard[4] == 0){
            return 4
        }else{
           //hot corners
            if gameBoard[4] == 1 && gameBoard[0] == 2 && gameBoard[8] == 1
            && gameBoard[2] == 0{
                return 2
            }
            if gameBoard[1] == 1 && gameBoard[3] == 1{
                if gameBoard[0] == 0{
                    return 0
                }
            }else if gameBoard[3] == 1 && gameBoard[7] == 1{
                if gameBoard[6] == 0{
                    return 6
                }
            }else if gameBoard[7] == 1 && gameBoard[5] == 1{
                if gameBoard[8] == 0{
                    return 8
                }
            }else if gameBoard[1] == 1 && gameBoard[5] == 1{
                if gameBoard[2] == 0{
                    return 2
                }
            }
            if (gameBoard[0] == 1 && gameBoard[8] == 1){
               
                    if gameBoard[1] == 0{
                        return 1
                    }else if gameBoard[3]==0{
                        return 3
                    }else if gameBoard[5]==0{
                        return 5
                    }else if gameBoard[7]==0{
                        return 7
                    }
                
            }else if (gameBoard[2] == 1 && gameBoard[6] == 1){
                if gameBoard[1] == 0{
                    return 1
                }else if gameBoard[3]==0{
                    return 3
                }else if gameBoard[5]==0{
                    return 5
                }else if gameBoard[7]==0{
                    return 7
                }
            }
            
                if gameBoard[0] == 1{
                    if gameBoard[4] == 2 {
                        if gameBoard[8] == 0{
                            return 8
                        }else if gameBoard[6] == 0{
                            return 6
                        }
                    }
                }else{
                    if gameBoard[2] == 1{
                    
                        if gameBoard[6] == 0{
                            return 6
                        }else if gameBoard[7] == 0{
                            return 7
                        }
                    }//continue algo
        }
        }
        //another algo
        if gameBoard[4] == 1{
            if gameBoard[0] == 0 && gameBoard[2] == 0 &&
                gameBoard[6] == 0 && gameBoard[8] == 0{
                var tacPlay = -1
                while (tacPlay != 2 && tacPlay != 0 && tacPlay != 6
                        && tacPlay != 8){
                    tacPlay = Int.random(in: 0...9)
                }
                return tacPlay
            }
        }
        
        var randomInt = ((Int.random(in: 0...100)) % 9)
        if gameBoard[randomInt] == 0 {
             return randomInt
        }
        while gameBoard[randomInt] != 0{
            randomInt = ((Int.random(in: 0...100)) % 9)
            if gameBoard[randomInt] == 0 {
                 return randomInt
            }
        }

    return -1
    }

    func check()->Int{
        for i in combinations{
            if gameBoard[i[0]] != 0 && gameBoard[i[0]] == gameBoard[i[1]] && gameBoard[i[1]] == gameBoard[i[2]]{
                    GameOver = true
                    if (gameBoard[i[0]] == 1){
                        return 1    //X wins
                    }else{
                        return 2    //O wins
                    }
            }
        }
                var flag = true
        for i in 0...8{
                    if gameBoard[i] == 0{
                        flag = false
                    }
                }
                    if flag{
                        GameOver=true
                        return 3 //DRAW
                    }else{
                        return 0
                    }
    }
