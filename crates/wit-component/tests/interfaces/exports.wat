(component
  (type (;0;)
    (component
      (type (;0;)
        (instance
          (type (;0;) (record (field "a" u32)))
          (export (;1;) "my-struct" (type (eq 0)))
          (type (;2;) (func (param "a" 1) (result string)))
          (export (;0;) "my-function" (func (type 2)))
        )
      )
      (export (;0;) "foo" "pkg:/exports/foo" (instance (type 0)))
      (type (;1;)
        (component
          (type (;0;)
            (instance
              (type (;0;) (record (field "a" u32)))
              (export (;1;) "my-struct" (type (eq 0)))
              (type (;2;) (func (param "a" 1) (result string)))
              (export (;0;) "my-function" (func (type 2)))
            )
          )
          (export (;0;) "foo" "pkg:/exports/foo" (instance (type 0)))
        )
      )
      (export (;0;) "export-foo" "pkg:/exports/export-foo" (component (type 1)))
    )
  )
  (@producers
    (processed-by "wit-component" "$CARGO_PKG_VERSION")
  )
  (export (;1;) "exports" "pkg:/exports" (type 0))
)