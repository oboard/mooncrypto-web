fn main {
  listen_event(
    "md5",
    fn(data) {
      match data {
        String(str) =>
          ignore(send_event("output", String(@mooncrypto.md5(str).to_string())))
        _ => println("Invalid data type")
      }
    },
  )
  listen_event(
    "sha256",
    fn(data) {
      match data {
        String(str) =>
          ignore(
            send_event("output", String(@mooncrypto.sha256(str).to_string())),
          )
        _ => println("Invalid data type")
      }
    },
  )
  listen_event(
    "sha1",
    fn(data) {
      match data {
        String(str) =>
          ignore(
            send_event("output", String(@mooncrypto.sha1(str).to_string())),
          )
        _ => println("Invalid data type")
      }
    },
  )
  listen_event(
    "base64encode",
    fn(data) {
      match data {
        String(str) =>
          ignore(send_event("output", String(@mooncrypto.base64_encode(str))))
        _ => println("Invalid data type")
      }
    },
  )
  listen_event(
    "base64decode",
    fn(data) {
      match data {
        String(str) =>
          ignore(
            send_event(
              "output",
              String(
                match @mooncrypto.base64_decode(str) {
                  Ok(s) => s
                  _ => "Error decoding base64 string"
                },
              ),
            ),
          )
        _ => println("Invalid data type")
      }
    },
  )
}
