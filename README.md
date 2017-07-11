# REEEEEEEEEEEEEEEEEAD MEEE!!

1. GitBash 사용법
    + 리모트 저장소를 로컬 저장소로 사용하기
    + 로컬 저장소에서 리모트 저장소로 파일 업로드

<br>

2. 마크다운 꾸미기
    + Headers
    + List style
    + Coding Block
    + Horizontal LIne
    + Link
    + Highlight
    + image

<hr/>

# 1. GitBash 사용법

## 1.1 리모트 저장소를 로컬 저장소로 사용하기

github에서 새로운 저장소 만든 뒤에 

    git clone [repository URL] [file name(optional)]

를 이용해서 복사해 온다 (브런치생성, URL의 닉네임이 origin으로 자동생성)

## 1.2 로컬 저장소에서 리모트 저장소로 파일 업로드

로컬 저장소에서 파일 수정 후 확인

    git status 

로컬 저장소와 리모트 저장소 사이에 스테이징

    git add [file name]

커밋

    git commit -m "message"

푸시(업로드)

    git push origin [branch name]


# 2. 마크다운 꾸미기

## 2.1 Headers

> Code
```md
# This is an Header1
## This is an Header2
### This is an Header3
#### This is an Header4
##### This is an Header5
###### This is an Header6
```
> Output
# This is an Header1
## This is an Header2
### This is an Header3
#### This is an Header4
##### This is an Header5
###### This is an Header6

<br>

## 2.2 list style

> Code
```md
1. First
2. Second
3. Third

<br>

1. First
2. Third
3. Second
```
>Output
1. First
2. Second
3. Third

<br>

1. First
3. Third
2. Second

> Code2
```md
+ high level
  - mid level
  * mid level2
    * low level
```

> Output2
+ high level
  - mid level
  * mid level2
    * low level

<br>

## 2.3 Coding Block
> Code
```md
<pre><code>Hello</code></pre>
    Hello
```

> Output
<pre><code>Hello</code></pre>
    Hello

<br>

## 2.4 Horizontal line
>Code
```md
***
*****
- - - -
---------
<hr/>
```

>Output All I write
***

<br>

## 2.5 link

> Code
```md
[Title](link)

[regression repository](https://github.com/saebuck/regression/branches)
```

> Output

[regression repository](https://github.com/saebuck/regression/branches)

<br>

## 2.6 Highlight
Code | Output
--|--
\*Italic* or \_Italic_ | _Italic_
\*\*Bold** or \_\_Bold__ | **Bold**
\*\*\*BoldItalic*** or \_\_\_BoldItalic___ | ***BoldItalic***
\<U>underline\</U> | <U>underline</U>
\~\~strike-out~~ | ~~strike-out~~

## 2.7 Image

> Code
```md
![Alt text](path)

![Alt text](http://cfile26.uf.tistory.com/image/2463694C53D0A5D80629B3)
```
> Output
![Alt text](http://cfile26.uf.tistory.com/image/2463694C53D0A5D80629B3)



