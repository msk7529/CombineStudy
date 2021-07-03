# Chapter2 key point

- publisher는 시간이 지남에 따라 동기 또는 비동기적으로 한 개 이상의 subscriber에게 값을 전송한다.
- subscriber은 publisher을 구독하여 값을 받을 수 있다. 그러나 subscriber의 입력 및 실패 유형은 publisher의 출력 및 실패 유형과 일치해야 한다.
- publisher를 구독하는데 사용할 수 있는 기본 제공 연산자는 sink, assign.
- subscriber은 값을 받을 때마다 demand를 늘릴 수 있지만, 줄일 수는 없다.
- 리소스를 해제하고 사이드이펙트를 방지하려면, 완료 후 각각의 구독들을 취소해주는 것이 좋다.
- subscription을 객체 또는 Set<AnyCancellable>에 저장하여 deinit 될 때 자동으로 취소시킬 수 있다.
- Future은 비동기적으로 나중에 단일 값을 받을 때 사용할 수 있다.
- Subject는 외부 호출자가 시작 값이 있거나 없는 subscriber들에게 여러 값을 비동기적으로 보낼 수 있도록 하는 publisher이다.
- Type erasure은 호출자(caller)가 underlying type의 추가 세부 정보에 액세스 할 수 없도록 한다.
- publisher의 print() 를 사용하여 모든 이벤트를 콘솔에 기록하고 진행 상황을 확인 할 수 있다.
