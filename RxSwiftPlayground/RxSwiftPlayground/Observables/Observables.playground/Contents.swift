//: Playground - noun: a place where people can play

import RxSwiftPlayground
import RxSwift

func create(count: Int) -> Observable<Int> {
    return Observable.create { subscriber -> Disposable in
        for i in 0...count {
            subscriber.onNext(i)
        }
        subscriber.onCompleted()
        return Disposables.create()
    }
}

func deferred(count: Int) -> Observable<Int> {
    return Observable.deferred { () -> Observable<Int> in
        return create(count: 2)
    }
}

_ = create(count: 1).subscribe(onNext: { value in
    print(value)
})

_ = Observable.from([2, 3]).subscribe(onNext: { value in
    print(value)
})

_ = Observable.of(4, 5).subscribe(onNext: { value in
    print(value)
})

_ = deferred(count: 1).subscribe(onNext: { value in
    print(value)
})
