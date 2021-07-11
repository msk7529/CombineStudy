# Chapter 11 Key points

- objective-C 코드에 대한 향수가 있다면 RunLoop를 사용하여 timer를 생성하자.(왠만하면 쓰지말라는 듯)
- 특정 RunLoop에서 주어진 시간간격에 따라 값을 얻고 싶으면 Timer.publish를 사용하여 timer를 생성하자.
- dispatch queue에서 이벤트를 내보내는 최신 timer를 사용하고 싶으면, DispatchQueue.schedule을 사용하여 timer를 생성하자.
