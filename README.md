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
```
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
```processing
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
```
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



