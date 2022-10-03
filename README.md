# 2022interaction
互動技術概論 
UC的部落格網址=> https://2022interaction.blogspot.com/search/label/09160455_%E9%BB%83%E6%A6%86%E8%90%B1
 # Week01 2022-09-05
```
1. GitHub + Git for Windows
2. Processing 介面
3. 第一個程式: 點、線、面、色彩
4. 兩種模式: 直接跑 vs. 互動 (static vs. active)
5. 第一個互動程式: 小畫家
6. 將程式匯出到網頁
```
## 下載processing
```
1.先上自己的moodle帳號



2.進入互動技術概論的課程資訊



3.點入上課用軟體



4.下載後=>解壓縮至桌面開啟後就成功拉👍
```
## 程式複習
```C
1.可以開啟一個500*500的視窗
=> size(500,500);



2.可以改變背景視窗的顏色
=> background(顏色代號);




3.將顏色填充
=> fill(顏色代號);
 


4.做出一個四邊形
=> rect(100,100,100,100);



```
## 讓程式更有互動性
==>差別在於加上void setup, draw
==>透過mouseX,mouseY來改變移動座標
```C
void setup(){
size(500,500);
}
void draw(){
background(#FFE54D);
fill(#6A91C6);
rect(100,100,100,100);
rect(mouseX,mouseY,100,100);
}


```
## 將程式透過網頁顯示
```
1. 把互動的程式複製到 
Processing to P5.js(https://pde2js.herokuapp.com/)
2.將原本的程式碼復後貼上在左側
3.複製右側至剛剛processing p5.js的視窗
4.跳至網頁成功~

```
## 小畫家的感覺
=>line(畫線),mousepressed(滑鼠點擊)
```C
void setup(){
size(500,500);
}
void draw(){
  if(mousePressed){
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
}

```
## 透過滑鼠鍵盤切換改變筆觸顏色
```C

function setup() {
    initializeFields();
    createCanvas(500, 500);
    background(color(0x5C, 0x8C, 0xCE));
    stroke(255, 0, 0);
}

function draw() {
    if (mouseIsPressed) {
        line(mouseX, mouseY, pmouseX, pmouseY);
    }
}

function keyPressed() {
    if (key == '1')
        stroke(color(0xD2, 0x58, 0xDB));
    if (key == '2')
        stroke(color(0x32, 0xBF, 0xB2));
    if (key == '3')
        stroke(color(0xE5, 0xCD, 0x43));
}

function initializeFields() {
}
```
# Week02

## 今天要做很像塔羅牌的東西

### PART1!!!

```

1.先做出背景

==> size(500,500);

2.劃出第一個牌面

==> rect(100,100,150,250,20);

3.填入顏色

==> fill(#629BE3);

4.畫入內側牌的大小

==> int w=25;

        rect(100-w/2,100-w/2,150+w,250+w,20);

```




### PART2 劃出好多張牌

>>> 圖片中的int w要設多少可以自己決定喔!!

```C

1.透過void setup畫出背景大小500x500

2.透過void draw呼叫出下方函式繪製出的圖像

3.函式draw card()裡面設置x,y數值==>卡片成型的位置✧*｡٩(ˊᗜˋ*)

void setup(){

  size(500,500);

}

int w=25;

void draw(){

  drawCard(100,100);

  drawCard(150,100);

}

void drawCard(int x,int y){

  fill(255);

  rect(x-w/2,y-w/2,150+w,250+w,20);

  fill(#629BE3);

  rect(x,y,150,250,20);

}

```
### PART3 做出像撲克牌面的東西~

```C

1.最一開始的步驟跟前面沒有不一樣

2.把DrawCard改名成PokerCard(但其實不改也沒差)

3.然後打上文字的位置

      fill(0);

      textSize(40);

      text(face,x,y+40);

```




### PART4 加上中文字怎麼加???

>>> 只要加上  PFont font=createFont("標楷體",40);  和 textFont(font);

就可以變成中文字喔~

```C

void setup(){

  size(500,500);

  PFont font=createFont("標楷體",40);

  textFont(font);

}

int w=25;

void draw(){

  drawPokerCard(100,100,"黑桃4");

  drawPokerCard(130,150,"紅心3");

  drawPokerCard(160,200,"方塊5");

  drawPokerCard(190,250,"梅花J");

}

void drawPokerCard(int x,int y,String face){

  fill(255);

  rect(x-w/2,y-w/2,150+w,250+w,20);

  fill(#629BE3);

  rect(x,y,150,250,20);

  fill(0);

  textSize(40);

  text(face,x,y+40);

}

```
### PART5 透過 IF indexof來判斷顏色差別

>>>   if(face.indexOf("黑桃")==-1 && face.indexOf("梅花")==-1) fill(#FF0000); else fill(0);

>>>  除了梅花和黑桃外，紅心和方塊的文字會變成紅色

```C

void setup(){

  size(500,500);

  PFont font=createFont("標楷體",40);

  textFont(font);

}

int w=25;

void draw(){

  drawPokerCard(100,100,"黑桃4");

  drawPokerCard(130,150,"紅心3");

  drawPokerCard(160,200,"方塊5");

  drawPokerCard(190,250,"梅花J");

}

void drawPokerCard(int x,int y,String face){

  fill(255);

  rect(x-w/2,y-w/2,150+w,250+w,20);

  fill(#629BE3);

  rect(x,y,150,250,20);

  if(face.indexOf("黑桃")==-1 && face.indexOf("梅花")==-1) fill(#FF0000);

  else fill(0);

  textSize(40);

  text(face,x,y+40);

}

```
### PART6 隨機抽出4張亂數牌
```C
1.將黑桃、方塊、紅心、梅花加入陣列裏頭
==>  String []flower={"黑桃","紅心","方塊","梅花"};
2.分別宣告 從花色中C4取1，隨機的數值1~13 加1是為了讓數值不為0
==> face1=flower[int(random(4))]+int(random(13)+1);
3. 在draw 上面宣告 字串String
==> String face1,face2,face3,face4;
4. 最後隨機用出牌組
==> void draw(){
      drawPokerCard(100,100,face1);
      drawPokerCard(130,150,face2);
      drawPokerCard(160,200,face3);
      drawPokerCard(190,250,face4);
    }
```
```C
最後程式碼
void setup(){
  size(500,500);
  PFont font=createFont("標楷體",40);
  textFont(font);
  String []flower={"黑桃","紅心","方塊","梅花"};
  face1=flower[int(random(4))]+int(random(13)+1);
  face2=flower[int(random(4))]+int(random(13)+1);
  face3=flower[int(random(4))]+int(random(13)+1);
  face4=flower[int(random(4))]+int(random(13)+1);
}
String face1,face2,face3,face4;
void draw(){
  drawPokerCard(100,100,face1);
  drawPokerCard(130,150,face2);
  drawPokerCard(160,200,face3);
  drawPokerCard(190,250,face4);
}
void drawPokerCard(int x,int y,String face){
  int w=25;
  fill(255);
  rect(x-w/2,y-w/2,150+w,250+w,20);
  fill(#629BE3);
  rect(x,y,150,250,20);
  if(face.indexOf("黑桃")==-1 && face.indexOf("梅花")==-1) fill(#FF0000);
  else fill(0);
  textSize(40);
  text(face,x,y+40);
}
```
 # week03 2022/09/19

## 今日主題

```
Week03 2022-09-19
主題: 撲克牌、圍棋、象棋
1. (複習) 放牌、秀牌、洗牌
2. 洗牌的正確方法: 2.1. 52張牌 0.....51 2.2. 把它 兩兩亂數對調 2.3. 取前面4張
3. 如何選到牌
4. class 物件
5. 心理學實驗--學習、記憶
```

## 複習

```

1.放牌、秀牌、洗牌

2.如何選到牌

3.class物件

```

## 上週程式碼

>>> 亂數選取任意花色卡牌

```C

最後程式碼

void setup(){

  size(500,500);

  PFont font=createFont("標楷體",40);

  textFont(font);

  String []flower={"黑桃","紅心","方塊","梅花"};

  face1=flower[int(random(4))]+int(random(13)+1);

  face2=flower[int(random(4))]+int(random(13)+1);

  face3=flower[int(random(4))]+int(random(13)+1);

  face4=flower[int(random(4))]+int(random(13)+1);

}

String face1,face2,face3,face4;

void draw(){

  drawPokerCard(100,100,face1);

  drawPokerCard(130,150,face2);

  drawPokerCard(160,200,face3);

  drawPokerCard(190,250,face4);

}

void drawPokerCard(int x,int y,String face){

  int w=25;

  fill(255);

  rect(x-w/2,y-w/2,150+w,250+w,20);

  fill(#629BE3);

  rect(x,y,150,250,20);

  if(face.indexOf("黑桃")==-1 && face.indexOf("梅花")==-1) fill(#FF0000);

  else fill(0);

  textSize(40);

  text(face,x,y+40);

}

```

## 進階更改程式

>>> 透過滑鼠點擊來變更花色,myshuffle()

```

void setup(){

  size(500,500);

  PFont font=createFont("標楷體",40);

  textFont(font);

  myShuffle();

}

void myShuffle(){

  String []flower={"黑桃","紅心","方塊","梅花"};

  face1=flower[int(random(4))]+int(random(13)+1);

  face2=flower[int(random(4))]+int(random(13)+1);

  face3=flower[int(random(4))]+int(random(13)+1);

  face4=flower[int(random(4))]+int(random(13)+1);

}

void mousePressed(){///透過滑鼠點擊改變花色

  myShuffle();

}

String face1,face2,face3,face4;

void draw(){

  drawPokerCard(100,100,face1);

  drawPokerCard(130,150,face2);

  drawPokerCard(160,200,face3);

  drawPokerCard(190,250,face4);

}

void drawPokerCard(int x,int y,String face){

  int w=25;

  fill(255);

  rect(x-w/2,y-w/2,150+w,250+w,20);

  fill(#629BE3);

  rect(x,y,150,250,20);

  if(face.indexOf("黑桃")==-1 && face.indexOf("梅花")==-1) fill(#FF0000);

  else fill(0);

  textSize(40);

  text(face,x,y+40);

}

``` 
## 做出52張牌的格子
```
1.寫出一個for迴圈,跑從1~52
2.取餘數的方式取出個位數到10,11從下一行開始
3.再畫出格子的大小
```
## 格子裡加入花色名稱
>>> 使用Pfont可以讓中文字正確顯示(上禮拜有筆記可以看)
```C
1. 宣告字串,裡面有所有花色的名稱
=>   
 String []faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K"
};
2.在void draw裡設定文字顏色為黑色,並排列在格子中
=> fill(0); text(faces[i],x+25,y+80);
```


## 目前的程式碼

```C

void setup()

{

  PFont font=createFont("標楷體",10);

  textFont(font);

  size(700,700);

}

String []faces={

  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",

  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",

  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",

  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K"

};

void draw(){

  background(#629BE3);

  for(int i=0;i<52;i++){

    int x=(i%10)*60;//除法10的餘數(個位數)

    int y=int(i/10)*120;//十位數

    fill(255);rect(x,y,60,120);

    fill(0); text(faces[i],x+25,y+80);

  }

}

```
## 將紅心和方塊變成紅色

>>> 使用indexOf

```C

void setup()

{

  PFont font=createFont("標楷體",16);

  textFont(font);

  size(800,600);

}

String []faces={

  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",

  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",

  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",

  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K"

};

void draw(){

  background(#629BE3);

  for(int i=0;i<52;i++){

    int x=(i%13)*60;//除法10的餘數(個位數)

    int y=int(i/13)*120;//十位數

    fill(255);rect(x,y,60,120);

    if(faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1) fill(0);

    else fill(255,0,0);

    text(faces[i],x+10,y+60);

  }

}

```
## 透過滑鼠點擊來做洗牌

```

1.設定兩個變數做交換

2.  String temp=faces[a];

     faces[a]=faces[b];

     faces[b]=temp;

```

## 前面程式碼加上新加上的程式碼

```C

void mousePressed(){

  int a=int(random(52));

  int b=int(random(52));

  //目標:faces[a] vs faces[b]交換

  String temp=faces[a];

  faces[a]=faces[b];

  faces[b]=temp;

}

```

## 今日總結

```

1.以第一周的程式為基底

2.加入今日第5個程式的宣告

3.使得程式變成亂數抽取4張

```

```C

void setup(){

  size(500,500);

  PFont font=createFont("標楷體",40);

  textFont(font);

  myShuffle();

}

String []faces={

  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",

  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",

  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",

  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K"

};

String face1,face2,face3,face4;

void myShuffle(){

  for(int k=0;k<10000;k++){

    int a=int(random(52));

    int b=int(random(52));

    //目標:faces[a] vs faces[b]交換

    String temp=faces[a];

    faces[a]=faces[b];

    faces[b]=temp;

  }

  face1=faces[0];

  face2=faces[1];

  face3=faces[2];

  face4=faces[3];

}

void mousePressed(){

  myShuffle();

}

void draw(){

  drawPokerCard(100,100,face1);

  drawPokerCard(130,150,face2);

  drawPokerCard(160,200,face3);

  drawPokerCard(190,250,face4);

}

void drawPokerCard(int x,int y,String face){

  int w=25;

  fill(255);

  rect(x-w/2,y-w/2,150+w,250+w,20);

  fill(#629BE3);

  rect(x,y,150,250,20);

  if(face.indexOf("黑桃")==-1 && face.indexOf("梅花")==-1) fill(#FF0000);

  else fill(0);

  textSize(40);

  text(face,x,y+40);

}

```
# Week04 2022-09-26
```
=>这个iPhone 14 Pro系列灵动岛游戏有点意思！🤣🤣🤣
(https://www.facebook.com/watch/?v=2296475820490477)
1. 主題: 打磚塊
2. 主題: 圍棋
```
## 1-1做出類似動態島彈力球的遊戲
```C
1.一樣設定出畫面的大小
=>size(500,500);
2.  ellipse( x , y , 寬 , 長); 
=> ellipse(x,y,10,10);//橢圓
  --目前成果會做出一個往右上角前進的小球

```
## 1-2 加入反彈座標
```C
1.再多加入2個變數vx,vy
=> 讓速度變化
2.設定if判斷句
=> x超過畫面換方向,y進行反彈


```
## 1-3 加入反彈板(半完成)
```C
1.設定背景顏色
=> backgrounf(#6ED4F2);
2.透過rect做出反彈板板
=>  rect(boardx,470,100,15,5);
3.將boardx變數設定為mouseX ///使得反彈板板會跟著滑鼠一起移動
=> int boardx=mouseX;
4.設定白球碰到板子時會進行回彈(x~x+100)
=> if(y>470 && x>boardx && x<boardx+100) vy=-vy;
```
## 讓彈珠檯有加速度的感覺(快完成)
```C
1. 在板子中間控制
=> 將boardx改為 mouseX- boardW/2
2.算出滑鼠的移動量加進vx
=> vx+=(mouseX-pmouseX)/2;


```
## 讓反彈板可以縮放
```C
1.右鍵是縮小
=> if(mousePressed && mouseButton==RIGHT) boardw *= 0.99;

2.左鍵是放大
=> if(mousePressed && mouseButton==LEFT) boardw *= 1.01; 
```


## FINAL PROGRAM!!!
```C
void setup(){
  size(500,500);
}
float x=250,y=250;
float vx=1.0,vy=-2.5;
float boardx,boardy=470,boardw=100,boardh=20;
void draw(){
  background(#6ED4F2);
  boardx=mouseX-boardw/2;
  rect(boardx,boardy,boardw,boardh,20);
  ellipse(x,y,10,10);//橢圓
  x=x+vx;
  y=y+vy;
  if(x>500) vx=-vx;
  if(x<0) vx=-vx;
  if(y<0) vy=-vy;
  if((y>boardy && y<boardy+boardh) && (x>boardx && x<boardx+boardw))
  {
    vy=-vy;
    vx+=(mouseX-pmouseX)/2;
  }
  if(mousePressed && mouseButton==LEFT) boardw *= 1.01; 
  if(mousePressed && mouseButton==RIGHT) boardw *= 0.99;
}

```
## 2-1圍棋的雛型
```C
1.一樣先設定出視窗範圍
2.透過for畫出9*9顆白測棋子
=>  for(int x=50;x<=450;x+=50)
          {
            for(int y=50;y<=450;y+=50)
            {
                  ellipse(x,y,50,50);
            }
          }
    



```
## 2-2 判別為黑子還白子
```C
1.土法煉鋼
=> 如果數字是1為黑子否則為白子
  




```
## 設定1時下黑子2時下白子 0是都不下(半完成)
```
1.透過for畫出棋盤格線
=> for(int i=1;i<=9;i++){
            for(int j=1;j<=9;j++){
               line( 50 , i*50 , 450 , i*50);//橫線
               line(i*50,   50 , i*50, 450 );//直線
                 }
       }
2.讀到1時畫黑子
=> if(go[i][j]==1){
         fill(0);
         ellipse( 50+j*50 , 50+i*50 , 50, 50); 
       }
3.讀到2時畫白子
=>  else if(go[i][j]==2){
         fill(255);
         ellipse( 50+j*50 , 50+i*50 , 50, 50);
       }


```
## 真的可以玩的圍棋來啦!!(白子先攻)
```C
1.設定1變數為n
2.判斷下棋的位置             
=> int j = (mouseX-25)/50;
      int i = (mouseY-25)/50;
3.切換黑白子
=> go[i][j] = (N%2==0)?1:2;



```
## SECOND PROGRAM
```C
void setup(){
 size(500,500); 
}
int [][] go={
  {0,0,0,0,0,0,0,0,0}, 
  {0,0,0,0,0,0,0,0,0}, 
  {0,0,0,0,0,0,0,0,0},  
  {0,0,0,0,0,0,0,0,0},  
  {0,0,0,0,0,0,0,0,0}, 
  {0,0,0,0,0,0,0,0,0}, 
  {0,0,0,0,0,0,0,0,0}, 
  {0,0,0,0,0,0,0,0,0}, 
  {0,0,0,0,0,0,0,0,0}, 
};///建立9*9的陣列
int N=0;
void mousePressed()
{
    int j = (mouseX-25)/50;
    int i = (mouseY-25)/50;
    go[i][j] = (N%2==0)?1:2;
    N++;
}
void draw(){
   background(246,194,108);
   for(int i=1;i<=9;i++){
     for(int j=1;j<=9;j++){
       line( 50 , i*50 , 450 , i*50);//橫線
       line(i*50,   50 , i*50, 450 );//直線
     }
   }
   for(int i=0 ; i<9 ; i++){
     for( int j=0 ; j<9 ; j++){
       if(go[i][j]==1){
         fill(0);//當讀到1時畫黑棋
         ellipse( 50+j*50 , 50+i*50 , 50, 50); 
       }
       else if(go[i][j]==2){
         fill(255);
         ellipse( 50+j*50 , 50+i*50 , 50, 50);
       }
     }
   }
}

```
 # Week05 2022-09-26

## 今日主題

```

1. 卜象棋暗棋

2. 記憶卡片遊戲
3. 主題: 圖片                              

```

## 1-1圍棋的線條

```C

1.利用等差級數的想法來畫線

2.第一個for畫出x軸的線條

=> for(int x=50;x<=450;x+=50){

          line(x,50,x,500);

            }

3.第二個for畫出y軸的線條

=> for(int y=50;y<=500;y+=50){

          line(50,y,450,y);

            }

```

## 1-2分出楚河漢界的感覺還有小標記

```C

1.楚河漢界在哪裡嘞

=> for (int x=50; x<=450; x+=50) {

    line(x, 50, x, 250);

    line(x, 300, x, 500);

      }

2.i是算出2維陣列中的橫行

3.J試算出2維陣列中的縱行

4.在透過for將board[i][j]的值帶入

=>for (int i=0; i<4; i++) {

    for (int j=0; j<9; j++) {

      text(board[i][j], 50+j*50, 50+i*50);

        }

     }

```

## 1-3把象旗子的東西到棋盤上!!

```C

1.加入PFont用來顯示中文字

2.使文字置中對齊

=> textAlign(CENTER,CENTER);

3.宣告變數id為剛剛2維陣列的代表,並從1開始

=> int id=board[i][j];

4.讀到0時請陣列回去重新開始

=> if(id==0)continue;



```

## 1-4 做出對手的棋和棋子的形狀

```C

1.加入對手名稱字串

=>String[]name2={"帥", "仕", "相", "俥", "傌", "炮", "兵"};

2.將對手棋的位置加上負號並印出(紅色)

=>  {-7, 0, -7, 0, -7, 0, -7, 0, -7},

  {-0, -6, 0, 0, 0, 0, 0, -6, 0},

  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},

  {-4, -5, -3, -2, -1, -2, -3, -5, -4},

=>text(name2[-id-1], 50+j*50, 50+i*50-3);


```

##1-5 滑鼠點擊下棋!!

```C

1.加入mousePressed

2.當滑鼠點擊時，棋子變成將，也可以取代其他棋子

=> void mousePressed(){

  for(int i=0;i<10;i++){

    for(int j=0;j<9;j++){

      if(dist(mouseX,mouseY,50+j*50,50+i*50)<20){

        board[i][j]=1;

      }

    }

  }

}


```

## FIRST PROGRAM

>>> 可以移動的棋子

```

1.加入背景才不會有殘影!

2.可以移動的棋子

=> if(handChess!=0)ellipse(mouseX,mouseY,40,40);

=> int handChess=0;

3.拖曳的程式碼

=> void mouseReleased(){

  int i=(mouseY+25-50)/50;

  int j=(mouseX+25-50)/50;

  board[i][j]=handChess;

  handChess=0;

}

```

```C

int [][]board={

  {4, 5, 3, 2, 1, 2, 3, 5, 4},

  {0, 0, 0, 0, 0, 0, 0, 0, 0},

  {0, 6, 0, 0, 0, 0, 0, 6, 0},

  {7, 0, 7, 0, 7, 0, 7, 0, 7},

  {0, 0, 0, 0, 0, 0, 0, 0, 0},

  {0, 0, 0, 0, 0, 0, 0, 0, 0},

  {-7, 0, -7, 0, -7, 0, -7, 0, -7},

  {-0, -6, 0, 0, 0, 0, 0, -6, 0},

  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},

  {-4, -5, -3, -2, -1, -2, -3, -5, -4},

};//1:將,2:士,3:象,4:車,5:馬,6:包,7:卒

String[]name={"將", "士", "象", "車", "馬", "包", "卒"};

String[]name2={"帥", "仕", "相", "俥", "傌", "炮", "兵"};

void setup() {

  size(500, 550);

  PFont font=createFont("標楷體", 30);

  textFont(font);

  textAlign(CENTER, CENTER);

}

void draw() {

  background(#F7A246);

  for (int x=50; x<=450; x+=50) {

    line(x, 50, x, 250);

    line(x, 300, x, 500);

  }

  for (int y=50; y<=500; y+=50) {

    line(50, y, 450, y);

  }

  for (int i=0; i<10; i++) {

    for (int j=0; j<9; j++) {

      int id=board[i][j];

      if (id==0)continue;

      if (id>0) {

        fill(255);

        ellipse(50+j*50, 50+i*50, 40, 40);

        fill(0);

        text(name[id-1], 50+j*50, 50+i*50-3);

      } else if (id<0) {

        fill(255);

        ellipse(50+j*50, 50+i*50, 40, 40);

        fill(255,0,0);

        text(name2[-id-1], 50+j*50, 50+i*50-3);

      }

    }

  }

  if(handChess!=0)ellipse(mouseX,mouseY,40,40);

}

int handChess=0;

void mousePressed(){

  for(int i=0;i<10;i++){

    for(int j=0;j<9;j++){

      if(dist(mouseX,mouseY,50+j*50,50+i*50)<20){

        handChess=board[i][j];

        board[i][j]=0;

      }

    }

  }

}

void mouseReleased(){

  int i=(mouseY+25-50)/50;

  int j=(mouseX+25-50)/50;

  board[i][j]=handChess;

  handChess=0;


}

```
