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
