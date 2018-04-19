import Foundation

public class Callback<T> {
  private var successCallback: ((T) -> Void)?
  private var failureCallback: ((Swift.Error) -> Void)?
  
  public init(){
    
  }
  
  public func success(result: T) {
    if let callback = successCallback {
      callback(result)
    }
  }
  
  public func success(callback: @escaping (T) -> Void) -> Callback<T> {
    successCallback = callback
    return self
  }
  
  public func failure(error: Swift.Error) {
    if let callback = failureCallback {
      callback(error)
    }
  }
  
  public func failure(callback: @escaping (Swift.Error) -> Void) -> Callback<T> {
    failureCallback = callback
    return self;
  }
}
