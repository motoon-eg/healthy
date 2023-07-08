/// A typealias that combines the `TargetType` and `ResponseDecoder` protocols.
public typealias RequestType = TargetType & ResponseDecoder & URLRequestConvertible
