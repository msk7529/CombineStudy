# Chapter 4 Key points

- filtering operator를 사용하면 upstream publihser가 내보낸 값이 downstream, 다른 operator 또는 consumer에게 전송되는 것을 제어할 수 있다.
- value를 무시하고, 완료 event만 원할 때는 ignoreOutput을 사용하면 된다.
- 값을 찾을때는 first(where:), last(where:)을 사용할 수 있다.
- first(where:)은 lazy로 동작하며, 필요한만큼의 값만 취한 다음 완료된다. last(where:)은 greedy로 동작하며, 어떤 값이 마지막으로 조건을 충족하는지 결정하기 전에 값의 전체 범위를 알아야 한다.
- drop operator를 사용하여 값을 downstream으로 보내기 전에, 무시되는 upstream publisher가 내보낸 값의 수를 제어할 수 있다.
- prefix operator를 사용하여 값을 downstream으로 보내기 전에, upstream publishes가 내보낼 수 있는 값의 수를 제어할 수 있다.
