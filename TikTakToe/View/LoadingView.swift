
import SwiftUI

struct LoadingView: View {
    @State  private var playerOne = ""
    @State  private var playerTwo = ""
    @State private var navigateToGame = false
    
    var body: some View {
        
        NavigationStack {
            NavigationLink(destination: TicTacToeView(player1: playerOne, player2: playerTwo), isActive: $navigateToGame) {
                
            }
            VStack {
                HStack {
                    ForEach(Array("XOXO").indices, id: \.self) { index in
                        let char = Array("XOXO")[index]
                        Text(String(char))
                            .font(.custom("verdana", size: 24))
                            .bold()
                            .foregroundColor(index % 2 == 0 ? .blue : .red)
                            .padding(.bottom, 40)
                    }
                }
            
            Text("Welcome to Tic-Tac-Toe!")
                .font(.custom("verdana", size: 16))
                .bold()
                .foregroundStyle(.gray)
                .padding(.bottom, 40)
            
                VStack(alignment: .leading){
                    Text("Player 1")
                        .font(.custom("verdana", size: 22))
                        .bold()
                        .foregroundStyle(.blue)
                    
                    TextField("Enter Your Name ", text: $playerOne)
                        .frame(width: 300, height: 40)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 40)
                    
                    Text("Player 2")
                        .font(.custom("verdana", size: 22))
                        .bold()
                        .foregroundStyle(.red)
                    
                    TextField("Enter Your Name ", text: $playerTwo)
                        .frame(width: 300, height: 40)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.bottom, 20)
                
                Button("Start"){
                    if !playerOne.isEmpty && !playerTwo.isEmpty {
                        navigateToGame = true
                    }
                }
                .frame(width: 100, height: 40)
                .background(Color.mint)
                .foregroundColor(.white)
                .cornerRadius(13)
                .font(.custom("verdana", size: 20))
                .bold()
            }
        }
    }
}

#Preview {
    LoadingView()
}
