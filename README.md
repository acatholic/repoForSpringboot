
메이븐 기반 스프링부트 CRUD 구현한 이클립스 프로젝

- jdk 는 17 버전 사용
- 디비는 오라클 사용
- 오라클 접속 정보는
  /saleMng/src/main/resources/application-local.properties 에 있음
 본인들 아이디. 비번으로 변경 필요함
  
오라클에 아래 테이블이 존재해야 하니 아래 스크립트로 테이블 생성해야 함

CREATE TABLE SYSTEM.SALE_MNG

(

    SALE_DATE       DATE NOT NULL,
    
    SALE_SITE       VARCHAR2(30) NOT NULL,
    
    SALE_ITEM       VARCHAR2(30) NOT NULL,
    
    SALE_AMT        NUMBER,
    
    SALE_MANAGER    VARCHAR2(30),
    
    SALE_REG_DATE   DATE
    
)


테스트 데이터는 사용자가 몇개 넣어야 함.


이후 
아래 

https://blog.naver.com/acatholic/223540022654 

동영상 보면서 아래 순서로 세팅 후 기능 테스트 진행


생성된 eclipse project 를 import

컴파일 환경 - jdk 17 로 세팅 

실행 환경  - jre 17 로 세팅  

facet -jdk 17 로 세팅  in eclipse

maven update - 컴파일과 실행에 필요한 jar 파일 다운받음 

clean install - project 을 배포가능한 상태(jar 파일 or war 파일 생성) 로 build 

서버실행  

초기화면 방문 

페이징 기능 테스트 

실행쿼리 확인  

list 화면 상단 검색기능 테스트  

검색 결과에서 페이징 기능 테스트  

신규 데이타 입력 수정 삭제 테스트 , 실행로그확인 


