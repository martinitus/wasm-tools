(component
  (type (;0;)
    (component
      (type (;0;)
        (instance
          (type (;0;) u32)
          (export (;1;) "t" (type (eq 0)))
        )
      )
      (export (;0;) "a" "pkg:/bar/a" (instance (type 0)))
    )
  )
  (export (;1;) "bar" "pkg:/bar" (type 0))
  (type (;2;)
    (component
      (type (;0;)
        (instance
          (type (;0;) u32)
          (export (;1;) "t" (type (eq 0)))
        )
      )
      (import "a2" "pkg:/bar/a" (instance (;0;) (type 0)))
      (alias export 0 "t" (type (;1;)))
      (type (;2;)
        (instance
          (alias outer 1 1 (type (;0;)))
          (export (;1;) "t" (type (eq 0)))
        )
      )
      (export (;1;) "foo" "pkg:/foo/foo" (instance (type 2)))
      (type (;3;)
        (component)
      )
      (export (;0;) "a" "pkg:/foo/a" (component (type 3)))
    )
  )
  (@producers
    (processed-by "wit-component" "$CARGO_PKG_VERSION")
  )
  (export (;3;) "foo" "pkg:/foo" (type 2))
)