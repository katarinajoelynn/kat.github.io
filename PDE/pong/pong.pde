float player1Y = height/2;
float player2Y = height/2;
float player1Score = 0;
float player2Score = 0;
float ball;
float gameStarted = false;
float t = 0;


//Constants
float PAUSE_TIME = 60;
float PLAYER_MOVE_SPEED = 2;
float BALL_SPEED = 2.5;
float PADDLE_HEIGHT = 100;
float PADDLE_WIDTH = 20;

angleMode = "degrees";

var Ball = function(position, speed) {
    this.position = position;
    this.speed = speed || BALL_SPEED;
    
    this.radius = 12;
    
    this.resetVelocity = function() {
        this.theta = random(0, 360);
        this.velocity = new PVector(
        this.speed*cos(this.theta), -this.speed*sin(this.theta));
        player2Y = height/2;
    };
    this.resetVelocity();
    
    this.draw = function() {
        fill(255, 255, 255);
        noStroke();
        ellipse(this.position.x, this.position.y,
        this.radius*2, this.radius*2);
    };
    
    this.collideWithPaddle = function(x, y) {
        if (this.position.x - this.radius < x + PADDLE_WIDTH/2 &&
        this.position.x + this.radius > x - PADDLE_WIDTH/2) {
            if (dist(0, this.position.y, 0, y) <
            PADDLE_HEIGHT/2 + this.radius) {
                if (this.position.x > x) {
                    this.position.x = x + 
                    this.radius + PADDLE_WIDTH/2;
                }
                else if (this.position.x < x) {
                    this.position.x = x - 
                    this.radius - PADDLE_WIDTH/2;
                }
                this.velocity.mult(new PVector(-1, 1));
            }
        }
    };
    
    this.update = function() {
        //Handle wall collisions
        if (this.position.x < 0) {
            player2Score++;
            this.position = new PVector(width/2, height/2);
            gameStarted = false;
            this.resetVelocity();
        }
        else if (this.position.x > width) {
            player1Score++;
            this.position = new PVector(width/2, height/2);
            gameStarted = false;
            this.resetVelocity();
        }
        if (this.position.y < 0) {
            this.position.y = 0;
            this.velocity.mult(new PVector(1, -1));
        }
        else if (this.position.y > height) {
            this.position.y = height;
            this.velocity.mult(new PVector(1, -1));
        }
        
        //Handle paddle collisions
        this.collideWithPaddle(20, player1Y);
        this.collideWithPaddle(width-20, player2Y);
        
        this.position.add(this.velocity);
    };
};

ball = new Ball(new PVector(width/2, height/2));

var drawScores = function() {
    var s;
    
    fill(255, 255, 255);
    textSize(20);
    
    s = "Player 1: " + player1Score;
    text(s, width*0.25-textWidth(s)/2, 25);
    s = "Player 2: " + player2Score;
    text(s, width*0.75-textWidth(s)/2, 25);
};

var updatePlayer2 = function() {
    if (abs(player2Y-ball.position.y) < PLAYER_MOVE_SPEED){
        player2Y = ball.position.y;
    }
    else if (player2Y-ball.position.y >= PLAYER_MOVE_SPEED) {
        player2Y -= PLAYER_MOVE_SPEED;
    }
    else if (player2Y-ball.position.y <= PLAYER_MOVE_SPEED) {
        player2Y += PLAYER_MOVE_SPEED;
    }
    
};

//Move the player up
var movePlayerUp = function() {
    player1Y -= PLAYER_MOVE_SPEED;
};

//Move the player down
var movePlayerDown = function() {
    player1Y += PLAYER_MOVE_SPEED;
};

var drawPlayers = function() {
    //Constrain the player movement
    player1Y = constrain(player1Y, 0, 400); 
    
    rectMode(CENTER);
    fill(255, 255, 255);
    rect(20, player1Y, PADDLE_WIDTH, PADDLE_HEIGHT);
    rect(width-20, player2Y, PADDLE_WIDTH, PADDLE_HEIGHT);
};

void setup() {
size(400, 400); 
//background(0,0,0); 
};

draw = function() {
    //Control Player 1
    if(keyIsPressed){
     if(keyCode === UP){
         movePlayerUp();
     } else if (keyCode === DOWN){
         movePlayerDown(); 
     }
    }
    //Draw the environment
    background(0, 0, 0);
    updatePlayer2();
    drawPlayers();
    drawScores();
    stroke(255, 255, 255);
    line(width/2, 0, width/2, height);
    
    //Draw the ball
    ball.draw();
    
    if (!gameStarted) {
        t++;
        if (t >= PAUSE_TIME) {
            t = 0;
            gameStarted = true;
        }
        return;
    }
    
    ball.update();
};