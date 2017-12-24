open Common

type t

external resend : timeoutMs -> _ = "" [@@bs.send.pipe: t]
external send : t -> _ = "" [@@bs.send]

external receive : event -> ('payload Js.t -> unit) -> t = "" [@@bs.send.pipe: t]
