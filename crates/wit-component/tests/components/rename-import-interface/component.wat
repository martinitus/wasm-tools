(component
  (type (;0;)
    (instance
      (type (;0;) (func))
      (export (;0;) "the-func" (func (type 0)))
    )
  )
  (import "bar" (instance (;0;) (type 0)))
  (core module (;0;)
    (type (;0;) (func))
    (import "bar" "the-func" (func (;0;) (type 0)))
    (@producers
      (processed-by "wit-component" "$CARGO_PKG_VERSION")
      (processed-by "my-fake-bindgen" "123.45")
    )
  )
  (alias export 0 "the-func" (func (;0;)))
  (core func (;0;) (canon lower (func 0)))
  (@producers
    (processed-by "wit-component" "$CARGO_PKG_VERSION")
  )
  (core instance (;0;)
    (export "the-func" (func 0))
  )
  (core instance (;1;) (instantiate 0
      (with "bar" (instance 0))
    )
  )
)