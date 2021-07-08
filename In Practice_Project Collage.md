# Chapter 8 Key points

- 일반적으로, 콜백 또는 delegate-based API를 사용할 때가 많다. 이런 경우, subject를 사용하여 Future 또는 publisher로 쉽게 래핑할 수 있다.
- 딜리게이션이나 콜백과 같은 다양한 패턴에서 single publisher/subcriber 패턴을 사용하면 뷰컨트롤러를 present 하거나 값을 가져오는 것을 쉽게 할 수 있다.
- 동일한 Publisher를 여러번 구독할 때 사이드이펙트를 방지하려면 share() operator를 통해 shared publisher를 사용하자.
