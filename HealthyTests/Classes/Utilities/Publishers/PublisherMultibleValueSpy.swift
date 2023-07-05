import Combine

final class PublisherMultibleValueSpy<T> {
    private(set) var values: [T] = []
    private var cancellable: Cancellable?
    init(_ publisher: any Publisher<T, Never>) {
        cancellable = publisher.sink { [weak self] value in
            self?.values.append(value)
        }
    }
}
