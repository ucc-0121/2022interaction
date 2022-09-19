# 2022interaction
互動技術概論
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

1.撲克牌

2.圍棋

3.象棋

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

