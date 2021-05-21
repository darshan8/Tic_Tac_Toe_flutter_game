import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  // To add Icon image
  var cross = Icon(Icons.cancel, size: 80);
  var circle = Icon(Icons.circle, size: 80);
  var edit = Icon(Icons.blur_circular, size: 80);

  bool isCross = true;
  String message = "";
  List<String> gameState = [""];

  // Initialize Box with Empty Value
  @override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message = "";
    super.initState();
  }

  // To Play Game
  playGame(int index){
    if(this.gameState[index] == "empty"){
      setState(() {
        if(this.isCross){
          this.gameState[index] = "cross";
        }
        else{
          this.gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  //Reset Game
  resetGame(){
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = "";
    });
  }

  // To Get Icon Image
  Icon? getIcon(String title){
    switch(title){
      case ('empty'):
      return edit;
      break;

      case ('cross'):
      return cross;
      break;

      case ('circle'):
      return circle;
      break;
    }
  }

  // To check wining
  checkWin(){
      if((gameState[0] != "empty") && (gameState[0] == gameState[1]) && (gameState[1] == gameState[2])) {
        setState(() {
          this.message = this.gameState[0] + 'Win';
        });
      } else if((gameState[3] != "empty") && (gameState[3] == gameState[4]) && (gameState[4] == gameState[5])) {
        setState(() {
          this.message = this.gameState[3] + 'Win';
        });
      } else if ((gameState[6] != "empty") && (gameState[6] == gameState[7]) && (gameState[7] == gameState[8])) {
        setState(() {
          this.message = this.gameState[6] + 'Win';
        });
      } else if((gameState[0] != "empty") && (gameState[0] == gameState[3]) && (gameState[3] == gameState[6])){
            setState(() {
              this.message = this.gameState[0] + 'Win';
            });
          } else if ((gameState[1] != "empty") && (gameState[1] == gameState[4]) && (gameState[4] == gameState[7])){
            setState(() {
              this.message = this.gameState[1] + 'Win';
            });
          } else if((gameState[2] != "empty") && (gameState[2] == gameState[5]) && (gameState[5] == gameState[7])) {
        setState(() {
          this.message = this.gameState[2] + 'Win';
        });
      }else if((gameState[0] != "empty") && (gameState[0] == gameState[4]) && (gameState[4] == gameState[8])) {
        setState(() {
          this.message = this.gameState[0] + 'Win';
        });
      }else if ((gameState[2] != "empty") && (gameState[2] == gameState[4]) &&
          (gameState[4] == gameState[6])) {
        setState(() {
          this.message = this.gameState[2] + 'Win';
        });
      } else if (!gameState.contains("empty")){
        setState(() {
          message = "Game Draw";
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                  ),
                  itemCount: gameState.length,
                  itemBuilder: (context, index) => SizedBox(
                    width: 100,
                    height: 100,
                    child: MaterialButton(
                      onPressed: (){
                        this.playGame(index);
                      },
                      child: getIcon(this.gameState[index]),
                    ),
                  )),
          ),
          Text(message,
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          Container(
            child: MaterialButton(
              color: Colors.blue[800],
                minWidth: 150,
                onPressed:(){
                 resetGame();
                },
              child: Text("Reset Game", style: TextStyle(color: Colors.white),),
            ),
          ),
          Text("@Flutter with Darshan")
        ],
      ),
    );
  }
}

