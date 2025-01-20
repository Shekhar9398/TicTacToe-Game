import SwiftUI
import CoreGraphics

struct TicTacToeView: View {
    @State private var points: [DrawablePoint] = []
    @State private var x: CGFloat = 60
    @State private var y: CGFloat = 60
    @State private var playerTurn = false
    
    @State var textString : [String] = ["", "", "", "", "", "", "", "", ""]
    @State var matchingPattern: [String] = [""]
    @State var isWin = false
    @State var isGameOver = false
    @State var playAgain = false
    @State var crossLine: Int = -1
    
    @State var player1: String
    @State var player2: String
    @State private var tapCount = 0
    @State private var matchWin = 0
    
    private var turnText: String {
        if tapCount == 9 && !isWin{
               return "Draw"
           } else {
               return "Player Turn: \(playerTurn ? player2 : player1)"
           }
       }
       
       private var winText: String {
           if isWin {
               return "Winner: \(!playerTurn ? player2 : player1)"
           } else {
               return ""
           }
       }
    
    @State private var scoreP1: Int = 0
    @State private var scoreP2: Int = 0

    private func updateScores() {
        if isWin {
            if playerTurn {
                scoreP1 += 1
            } else {
                scoreP2 += 1
            }
        }
    }

    
    var body: some View {
 
        VStack {
            
            HStack{
                VStack{
                    Text("\(player1)")
                        .foregroundStyle(.blue)
                        .frame(width: 120)
                    
                    Text("\(scoreP1)")
                        .foregroundStyle(.blue)
                        .frame(width: 120)
                }
                
                Spacer()
                
                Text("VS")
                Spacer()
                
                VStack{
                    Text("\(player2)")
                        .foregroundStyle(.red)
                        .frame(width: 120)
                    
                    Text("\(scoreP2)")
                        .foregroundStyle(.red)
                        .frame(width: 120)
                }
            }
            .font(.custom("verdana", size: 16))
            .bold()
            .padding(.horizontal, 20)
            
            if isWin{
                Text(winText)
                    .foregroundColor(.mint)
                    .font(.custom("verdana", size: 20))
                    .bold()
                    .padding(30)
            }else {
                Text(turnText)
                    .foregroundColor(playerTurn ? .red : .blue)
                    .font(.custom("verdana", size: 16))
                    .bold()
                    .padding(30)
            }
           
            
            ZStack {
                // Background
                Color.white
                    .ignoresSafeArea()
                
                ///////////////Blocks///////////////
                VStack {
                    RoundedRectangle(cornerRadius: 1)
                        .frame(width: 2, height: 360)
                }
                .position(CGPoint(x: 120.0, y: 180))
                
                VStack {
                    RoundedRectangle(cornerRadius: 1)
                        .frame(width: 2, height: 360)
                }
                .position(CGPoint(x: 240.0, y: 180))
                
                HStack {
                    RoundedRectangle(cornerRadius: 1)
                        .frame(width: 360, height: 2)
                }
                .position(CGPoint(x: 180, y: 120.0))
                
                HStack {
                    RoundedRectangle(cornerRadius: 1)
                        .frame(width: 360, height: 2)
                }
                .position(CGPoint(x: 180, y: 240.0))
                ///////////////////////////////////////
                
                //////////////Cross Lines/////////////
                switch crossLine {
                    ///1. Verticle
                case 0:
                    Rectangle()
                        .frame(width: 2, height: 360)
                        .foregroundStyle(.mint)
                        .position(x: 60, y: 180)
                    
                case 1:
                    Rectangle()
                        .frame(width: 2, height: 360)
                        .foregroundStyle(.mint)
                        .position(x: 180, y: 180)
                    
                case 2:
                    Rectangle()
                        .frame(width: 2, height: 360)
                        .foregroundStyle(.mint)
                        .position(x: 300, y: 180)
                    
                case 3:
                    //2.Horizontal
                    Rectangle()
                        .frame(width: 360, height: 2)
                        .foregroundStyle(.mint)
                        .position(x: 180, y: 180)
                    
                case 4:
                    Rectangle()
                        .frame(width: 360, height: 2)
                        .foregroundStyle(.mint)
                        .position(x: 180, y: 60)
                    
                case 5:
                    Rectangle()
                        .frame(width: 360, height: 2)
                        .foregroundStyle(.mint)
                        .position(x: 180, y: 300)
                    
                case 6:
                    //3. Diagonal
                    Rectangle()
                        .frame(width: 2, height: 510)
                        .foregroundStyle(.mint)
                        .position(x: 180, y: 180)
                        .rotationEffect(.degrees(45))
                    
                case 7:
                    Rectangle()
                        .frame(width: 2, height: 510)
                        .foregroundStyle(.mint)
                        .position(x: 180, y: 180)
                        .rotationEffect(.degrees(-45))
                    
                default:
                    Text("")
                }
                //////////////////////////////////////
              
                ForEach(Array(textString.enumerated()), id: \.offset) { index, val in
                    if playAgain {
                        Text("")
                    }else {
                        
                        Text(val)
                            .foregroundColor(val == "X" ? .blue : .red)
                            .bold()
                            .position(positionX(block: index+1))
                            .font(.custom("verdana", size: 30))
                    }
                }
            }
            .frame(width: 360, height: 360)
            .onTapGesture { points in
                
                tapCount += 1
                print("TapCount - \(tapCount)")
                
                if !isWin {
                    if points.x <= 120 && points.y <= 120 {
                        print("Block 1")
                        if textString[0] == ""{
                            textString[0] = (playerTurn ? "O" : "X")
                            
                            playerTurn = !playerTurn
                        }
                    }else  if points.x <= 240 && points.y <= 120 {
                        print("Block 2")
                        if textString[1] == ""{
                            textString[1] = (playerTurn ? "O" : "X")
                            
                            playerTurn = !playerTurn
                        }
                    }else  if points.x <= 360 && points.y <= 120 {
                        print("Block 3")
                        if textString[2] == ""{
                            textString[2] = (playerTurn ? "O" : "X")
                            
                            playerTurn = !playerTurn
                        }
                    }
                    
                    else if points.x <= 120 && points.y <= 240 {
                        print("Block 4")
                        if textString[3] == ""{
                            textString[3] = (playerTurn ? "O" : "X")
                            
                            playerTurn = !playerTurn
                        }
                    }else  if points.x <= 240 && points.y <= 240 {
                        print("Block 5")
                        if textString[4] == ""{
                            textString[4] = (playerTurn ? "O" : "X")
                            playerTurn = !playerTurn
                        }
                    }else  if points.x <= 360 && points.y <= 240 {
                        print("Block 6")
                        if textString[5] == ""{
                            textString[5] = (playerTurn ? "O" : "X")
                            playerTurn = !playerTurn
                        }
                    }
                    
                    else if points.x <= 120 && points.y <= 360 {
                        print("Block 7")
                        if textString[6] == ""{
                            textString[6] = (playerTurn ? "O" : "X")
                            playerTurn = !playerTurn
                        }
                    }else  if points.x <= 240 && points.y <= 360 {
                        print("Block 8")
                        if textString[7] == ""{
                            textString[7] = (playerTurn ? "O" : "X")
                            playerTurn = !playerTurn
                        }
                    }else  if points.x <= 360 && points.y <= 360 {
                        print("Block 9")
                        if textString[8] == ""{
                            textString[8] = (playerTurn ? "O" : "X")
                            playerTurn = !playerTurn
                        }
                    }
                }
                checkIfWinner()
            }
            
            Button("Play Again"){
                withAnimation(.snappy) {
                    playAgain = true
                    checkIfWinner()
                    tapCount = 0
                }
            }
            .frame(width: 120, height: 40)
            .background(Color.mint)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.custom("verdana", size: 16))
            .bold()
            .padding(30)
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func checkIfWinner(){
        //Check if win
        //1,2,3
        if (textString[0] != ""){
            if (textString[0] == textString[1] && textString[0] == textString[2]){
                
                isWin = true
                crossLine = 4
            }
        }
        
        //4,5,6
        if (textString[3] != ""){
            if (textString[3] == textString[4] && textString[3] == textString[5]){
                isWin = true
                crossLine = 3
            }
        }
        
        //7,8,9
        if (textString[6] != ""){
            if (textString[6] == textString[7] && textString[6] == textString[8]){
                isWin = true
                crossLine = 5
            }
        }
        
        //1,4,7
        if (textString[0] != ""){
            if (textString[0] == textString[3] && textString[0] == textString[6]){
                isWin = true
                crossLine = 0
            }
        }
        
        //2,5,8
        if (textString[1] != ""){
            if (textString[1] == textString[4] && textString[1] == textString[7]){
                isWin = true
                crossLine = 1
            }
        }
        
        //3,6,9
        if (textString[2] != ""){
            if (textString[2] == textString[5] && textString[2] == textString[8]){
                isWin = true
                crossLine = 2
            }
        }
        
        //1,5,9
        if (textString[0] != ""){
            if (textString[0] == textString[4] && textString[0] == textString[8]){
                isWin = true
                crossLine = 7
            }
        }
        
        //3,5,7
        if (textString[2] != ""){
            if (textString[2] == textString[4] && textString[2] == textString[6]){
                isWin = true
                crossLine = 6
            }
        }
        
        ///Mark :- restart game
        if playAgain {
            updateScores()
            
            for i in 0...8{
                textString[i] = ""
            }
            playAgain = false
            isWin = false
            playerTurn = false
            crossLine = -1
        }
 
    }
    
    // Corrected function name to positionX
    func positionX(block: Int) -> CGPoint {
        switch block {
        case 1:
            return CGPoint(x: 60, y: 60)
        case 2:
            return CGPoint(x: 180, y: 60)
        case 3:
            return CGPoint(x: 300, y: 60)
            
            
        case 4:
            return CGPoint(x: 60, y: 180)
        case 5:
            return CGPoint(x: 180, y: 180)
        case 6:
            return CGPoint(x: 300, y: 180)
            
            
        case 7:
            return CGPoint(x: 60, y: 300)
        case 8:
            return CGPoint(x: 180, y: 300)
        case 9:
            return CGPoint(x: 300, y: 300)
            
        default:
            return CGPoint(x: x, y: y)
        }
    }
    
}

// A custom struct to store each point with a unique ID
struct DrawablePoint: Identifiable {
    let id: UUID
    let location: CGPoint
}

#Preview {
    TicTacToeView(player1: "player1", player2: "player2")
}
