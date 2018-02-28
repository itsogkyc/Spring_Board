스프링(Spring) 웹 개발 프로젝트 [게시판]
===================

----------

스프링 프레임워크를 사용한 게시판 개발
-------------
> Note :
>  스프링 프레임워크를 사용한 MVC(Model-View-Control) 구조 게시판 개발

#### Develop Environment

>- OS : Windows10
>- IED : Eclipse Java EE IDE Oxygen.1a Release (4.7.1a)
>- JDK : Java SE 9.0.1 
>- Tomcat : Tomcat v8.5
>- SpringFrameWork 4.3.4
>- Ojdbc6 12.1.0.2
>- Mybatis 3.4.1
>- Mybatis-spring 1.3.0
>- Spring-jdbc 
>- jackson-databind 2.8.8


#### Feature
>- 게시판 목록
>- 게시글 작성
>- 게시글 조회
>- 게시글 수정
>- 게시글 삭제 
>- 게시판 페이징 처리
>- 댓글 입력, 삭제, 수정
>- 일부 특수문자 변환


----------
MVC ( Model-View-Controller ) 
-------------
본 프로젝트는 Spring 프레임워크를 사용하여 MVC 디자인패턴으로 개발하였습니다. 
아래와 같이 프로젝트에 사용된 각 요소들은 다음과 같은 역할을 수행 합니다. 
#### **Model** 
 * boardService : 실질적인 비즈니스 로직을 담는 클래스로서 데이터베이스와 관련된 DATA가공을 책임지는 
 컴포넌트

#### **View**
* boardList.jsp : 게시판 목록과 관련된 사용자 인터페이스 요소를 나타내는 역할 수행
* boardOneView.jsp : 게시글 조회와 댓글관련 화면 인터페이스 요소를 나타내는 역할 수행
* boardRegisterForm.jsp : 게시글 등록과 관련된 인터페이스 요소를 나타내는 역할 수행

#### **Controller**    
* HomeController.java : View에 게시글 목록과 관련된 DATA 흐름을 제어하는 역할을 수행하는 Class
* PageMaker.java : 게시글 페이징 처리와 관련된 로직을 수행하는 Class
* ReplyController.java : 댓글과 관련된 DATA 흐름을 제어하는 Class


------------

게시판 동작화면
-------------

####  **게시판 목록**
게시글 목록을 보여주는 화면입니다. 기본값으로 1페이지 [ 글 10개, 페이징block 10개] 설정되어 있으며, 코드 수정을 통해 페이징과 글목록 수정이 가능하도록 지원하고 있습니다.
 댓글이 있는 글의 제목 옆에 댓글 갯수를 표시하도록 만들었습니다.
 
![enter image description here](https://github.com/itsogkyc/Spring_Board/blob/master/imgfile/img_01.png?raw=true)

####  **게시글 수정/삭제 , 댓글 입력/수정/삭제**
게시글 수정 / 삭제가 가능하고, 각 게시글에 댓글을 입력 / 수정 / 삭제 할 수 있도록 구현 하였습니다.

![enter image description here](https://github.com/itsogkyc/Spring_Board/blob/master/imgfile/img_04.png?raw=true)

----------

### 문의사항
기타 궁금하신 사항은 아래 메일로 연락 주세요.
itsogkyc@gmail.com

