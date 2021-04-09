import Foundation

@propertyWrapper
public struct Clamped<Value: Comparable> {
    
    var value: Value
    var range: ClosedRange<Value>
    
    
    // MARK: - Init
    public init(
        wrappedValue defaultValue: Value,
        within range: ClosedRange<Value>
    ) {
        precondition(
            range.contains(defaultValue),
            """
            Clamped properties should be initialized with a value that's \
            contained by their range.
            """
        )
        
        self.value = defaultValue
        self.range = range
    }
    
    
    public var wrappedValue: Value {
        get { value }
        set { value = clampedValue(for: newValue) }
    }
}


extension Clamped {
    
    private func clampedValue(for newValue: Value) -> Value {
        min(
            max(range.lowerBound, newValue),
            range.upperBound
        )
    }
}


