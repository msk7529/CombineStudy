# Chapter 12 Key points

- Key-Value Observing은 Objective-C 런타임에 의존하고 NSObject 클래스를 상속받아야 한다.
- Apple 프레임워크의 많은 Objective-C 클래스는 일부 KVO 호환 property를 제공한다.
- class를 NSObject를 상속하도록 하고, property에 @objc dynamic 속성을 추가하면 해당 property를 observable하게 만들 수 있다.
- class를 ObservableObject를 상속하도록 하고, property에 @Published 속성을 추가하면 해당 property를 observable하게 만들 수 있다. 그러나 @Published 속성을 가진 프로퍼티가 많다면, objectWillChange Publisher는 어떤 프로퍼티가 어떻게 변화했는지 알 수는 없다. 프로퍼티의 정학한 변화를 알고싶다면 KVO 방식을 사용해야 할 듯.
