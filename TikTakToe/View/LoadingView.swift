
import SwiftUI

struct LoadingView: View {
    @State  private var playerOne = ""
    @State  private var playerTwo = ""
    @State private var navigateToGame = false
    
    var body: some View {
        
        NavigationStack {
            NavigationLink(destination: TicTacToeView(player1: playerOne, player2: playerTwo), isActive: $navigateToGame) {
                
            }
           Text("XOXO")
                .font(.custom("verdana", size: 24))
                .foregroundStyle(.mint)
                .bold()
                .padding(.bottom)
            Text("Welcome to Tic-Tac-Toe!")
                .font(.custom("verdana", size: 12))
                .bold()
                .foregroundStyle(.gray)
                .padding(.bottom, 40)
            
                VStack(alignment: .leading){
                    Text("Player 1")
                        .font(.custom("verdana", size: 16))
                        .bold()
                        .foregroundStyle(.blue)
                    
                    TextField("Enter Your Name ", text: $playerOne)
                        .frame(width: 300, height: 40)
                        .font(.custom("verdana", size: 16))
                        .bold()
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 30)
                    
                    Text("Player 2")
                        .font(.custom("verdana", size: 16))
                        .bold()
                        .foregroundStyle(.red)
                    
                    TextField("Enter Your Name ", text: $playerTwo)
                        .font(.custom("verdana", size: 16))
                        .bold()
                        .frame(width: 300, height: 30)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.bottom, 20)
                
                Button("Start"){
                    if !playerOne.isEmpty && !playerTwo.isEmpty {
                        navigateToGame = true
                    }
                }
                .frame(width: 120, height: 40)
                .background(Color.mint)
                .foregroundColor(.white)
                .cornerRadius(13)
                .font(.custom("verdana", size: 16))
                .bold()
            }
        }
    }


#Preview {
    LoadingView()
}
