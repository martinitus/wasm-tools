(component
  (core module (;0;)
    (type (;0;) (func))
    (import "old" "thunk" (func (;0;) (type 0)))
    (@producers
      (processed-by "wit-component" "$CARGO_PKG_VERSION")
      (processed-by "my-fake-bindgen" "123.45")
    )
  )
  (core module (;1;)
    (type (;0;) (func))
    (func (;0;) (type 0))
    (export "thunk" (func 0))
  )
  (core module (;2;)
    (type (;0;) (func))
    (func $adapt-old-thunk (;0;) (type 0)
      i32.const 0
      call_indirect (type 0)
    )
    (table (;0;) 1 1 funcref)
    (export "0" (func $adapt-old-thunk))
    (export "$imports" (table 0))
    (@producers
      (processed-by "wit-component" "$CARGO_PKG_VERSION")
    )
  )
  (core module (;3;)
    (type (;0;) (func))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "$imports" (table (;0;) 1 1 funcref))
    (elem (;0;) (i32.const 0) func 0)
    (@producers
      (processed-by "wit-component" "$CARGO_PKG_VERSION")
    )
  )
  (core instance (;0;) (instantiate 2))
  (alias core export 0 "0" (core func (;0;)))
  (core instance (;1;)
    (export "thunk" (func 0))
  )
  (core instance (;2;) (instantiate 0
      (with "old" (instance 1))
    )
  )
  (core instance (;3;) (instantiate 1))
  (alias core export 0 "$imports" (core table (;0;)))
  (alias core export 3 "thunk" (core func (;1;)))
  (@producers
    (processed-by "wit-component" "$CARGO_PKG_VERSION")
  )
  (core instance (;4;)
    (export "$imports" (table 0))
    (export "0" (func 1))
  )
  (core instance (;5;) (instantiate 3
      (with "" (instance 4))
    )
  )
)