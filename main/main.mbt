fn main {
  listen_event(
    "md5",
    fn {
      String(str) =>
        ignore(send_event("output", String(@mooncrypto.md5(str).to_string())))
      _ => println("Invalid data type")
    },
  )
  listen_event(
    "sha256",
    fn {
      String(str) =>
        ignore(
          send_event("output", String(@mooncrypto.sha256(str).to_string())),
        )
      _ => println("Invalid data type")
    },
  )
  listen_event(
    "sha1",
    fn {
      String(str) =>
        ignore(send_event("output", String(@mooncrypto.sha1(str).to_string())))
      _ => println("Invalid data type")
    },
  )
  listen_event(
    "base64encode",
    fn {
      String(str) =>
        send_event("output", String(@mooncrypto.base64_encode(str))) |> ignore()
      _ => println("Invalid data type")
    },
  )
  listen_event(
    "base64decode",
    fn {
      String(str) => {
        let r = @mooncrypto.base64_decode(str).or(
          "Error decoding base64 string",
        )
        send_event("output", String(r)) |> ignore()
      }
      _ => println("Invalid data type")
    },
  )
}
