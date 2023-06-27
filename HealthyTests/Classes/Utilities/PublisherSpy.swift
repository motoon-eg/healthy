import Combine

final class PublisherSpy<T> {
    private(set) var value: T!
    private var cancellable: Cancellable?
    init(_ publisher: AnyPublisher<T, Never>) {
        cancellable = publisher.sink { [weak self] value in
            self?.value = value
        }
    }
}

final class PublisherMultibleValueSpy<T> {
    private(set) var values: [T] = []
    private var cancellable: Cancellable?
    init(_ publisher: AnyPublisher<T, Never>) {
        cancellable = publisher.sink { [weak self] value in
            self?.values.append(value)
        }
    }
}
