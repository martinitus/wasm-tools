use wast::parser::{self, Parse, ParseBuffer, Parser, Result};
use wast::Wat;

pub struct Comments<'a> {
    comments: Vec<&'a str>,
}

impl<'a> Parse<'a> for Comments<'a> {
    fn parse(parser: Parser<'a>) -> Result<Comments<'a>> {
        let comments = parser.step(|mut cursor| {
            let mut comments = Vec::new();
            loop {
                let (comment, c) = match cursor.comment()? {
                    Some(pair) => pair,
                    None => break,
                };
                cursor = c;
                comments.push(if comment.starts_with(";;") {
                    &comment[2..]
                } else {
                    &comment[2..comment.len() - 2]
                });
            }
            Ok((comments, cursor))
        })?;
        Ok(Comments { comments })
    }
}

pub struct Documented<'a, T> {
    comments: Comments<'a>,
    item: T,
}

impl<'a, T: Parse<'a>> Parse<'a> for Documented<'a, T> {
    fn parse(parser: Parser<'a>) -> Result<Self> {
        let comments = parser.parse()?;
        let item = parser.parens(T::parse)?;
        Ok(Documented { comments, item })
    }
}


#[test]
fn foo()  {
    let buf = ParseBuffer::new(
        r#"
        ( module $foo
            (
                func $sum (param i32) (param i32) (result i32)
                    local.get 0
                    local.get 1
                    i32.add
            )

            (
                func (export "sum2") (param i32) (param i32) (result i32)
                    call $sum (local.get 1) (local.get 1)
            )
        )
        "#,
    ).unwrap();

    let mut d: Wat = parser::parse(&buf).unwrap();
    d.encode().unwrap();
    println!("{:?}", d);
}


#[test]
fn parse_comments() -> anyhow::Result<()> {
    let buf = ParseBuffer::new(
        r#"
;; hellop
(; again ;)
(module)
    "#,
    )?;

    let d: Documented<wast::core::Module> = parser::parse(&buf)?;
    assert_eq!(d.comments.comments, vec![" hello", " again "]);
    drop(d.item);

    let buf = ParseBuffer::new(
        r#"
;; this
(; is
on
multiple;)


;; lines
(func)
    "#,
    )?;

    let d: Documented<wast::core::Func> = parser::parse(&buf)?;
    assert_eq!(
        d.comments.comments,
        vec![" this", " is\non\nmultiple", " lines"]
    );
    drop(d.item);
    Ok(())
}
