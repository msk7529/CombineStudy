# Chapter 13 Key points

- subscription work를 공유하는 것은 자원이 많이 들어가는 프로세스(예를 들어 네트워킹)에서 매우 중요하다.
- share()를 사용하면 하나의 publisher를 여러개의 subscriber와 공유할 수 있다.
- upstream publisher가 작동하기 시작하는 시기와 값이 subscriber들에게 전파되는 방식을 세밀하게 제어할 때는 multicast를 사용하자.
- 단일 연산의 결과값을 여러개의 subscriber와 공유하려면 Future을 사용하면 된다.
