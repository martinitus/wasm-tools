(component
  (type (;0;)
    (component
      (type (;0;)
        (instance
          (type (;0;) (func))
          (export (;0;) "foo" (func (type 0)))
        )
      )
      (export (;0;) "foo" "pkg:/import-and-export/foo" (instance (type 0)))
      (type (;1;)
        (instance
          (type (;0;) (func))
          (export (;0;) "bar" (func (type 0)))
        )
      )
      (export (;1;) "bar" "pkg:/import-and-export/bar" (instance (type 1)))
      (type (;2;)
        (component
          (type (;0;)
            (instance
              (type (;0;) (func))
              (export (;0;) "foo" (func (type 0)))
            )
          )
          (import "foo" "pkg:/import-and-export/foo" (instance (;0;) (type 0)))
          (type (;1;)
            (instance
              (type (;0;) (func))
              (export (;0;) "bar" (func (type 0)))
            )
          )
          (export (;1;) "bar" "pkg:/import-and-export/bar" (instance (type 1)))
        )
      )
      (export (;0;) "import-and-export" "pkg:/import-and-export/import-and-export" (component (type 2)))
    )
  )
  (@producers
    (processed-by "wit-component" "$CARGO_PKG_VERSION")
  )
  (export (;1;) "import-and-export" "pkg:/import-and-export" (type 0))
)