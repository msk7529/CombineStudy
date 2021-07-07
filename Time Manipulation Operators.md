# Chapter 6 Key points

- Combine의 비동기 이벤트 처리는 자체적으로 시간을 manipulate 할 수 있다.
- time-traveling option을 제공하지 않더라도, 프레임워크에는 개별 이벤트를 처리하는 것이 아닌 장기간에 걸쳐 작업을 추상화 할 수 있는 연산자가 있다.
- delay operator를 이용하여 시간을 조절할 수 있다.
- collect operator를 이용하여 시간이 지남에 따라 값의 흐름을 조정할 수 있다.
- debounce와 throttle operator를 이용하여 시간이 지남에 따라 개별적인 값들을 선택할 수 있다.
- timeout operator는 시간을 낭비하는 것은 방지해준다.(번역이 이게 맞나..)
- measureInterval operator로 전달받은 값들의 시간간격을 측정할 수 있다.
