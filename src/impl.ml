type event = string
type timeoutMs = float

module Push = struct
  type t

  external resend : timeoutMs -> _ = "" [@@bs.send.pipe: t]
  external send : t -> _ = "" [@@bs.send]

  external receive : event -> ('payload Js.t -> unit) -> t =
    "" [@@bs.send.pipe: t]
end

module rec Channel : sig
  type t

  external make : string -> 'params Js.t -> Socket.t -> t =
    "Channel" [@@bs.new] [@@bs.module "phoenix"]

  external rejoinUntilConnected : t -> _ = "" [@@bs.send]

  external join : ?timeoutMs:timeoutMs -> Push.t =
    "" [@@bs.send.pipe: t]

  external onClose : ('reason -> 'a) -> unit =
    "" [@@bs.send.pipe: t]

  external onError : ('reason -> 'a) -> unit = "" [@@bs.send.pipe: t]

  external on : event -> ('reason -> 'a) -> unit =
    "" [@@bs.send.pipe: t]

  external off : event -> unit = "" [@@bs.send.pipe: t]
  external canPush : unit -> bool = "" [@@bs.send.pipe: t]

  external push :
    event -> 'payload Js.t -> ?timeoutMs:timeoutMs -> Push.t =
    "" [@@bs.send.pipe: t]

  external leave : ?timeoutMs:timeoutMs -> Push.t =
    "" [@@bs.send.pipe: t]
end = struct
  type t

  external make : string -> 'params Js.t -> Socket.t -> t =
    "Channel" [@@bs.new] [@@bs.module "phoenix"]

  external rejoinUntilConnected : t -> _ = "" [@@bs.send]

  external join : ?timeoutMs:timeoutMs -> Push.t =
    "" [@@bs.send.pipe: t]

  external onClose : ('reason -> 'a) -> unit = "" [@@bs.send.pipe: t]
  external onError : ('reason -> 'a) -> unit = "" [@@bs.send.pipe: t]

  external on : event -> ('reason -> 'a) -> unit =
    "" [@@bs.send.pipe: t]

  external off : event -> unit = "" [@@bs.send.pipe: t]
  external canPush : unit -> bool = "" [@@bs.send.pipe: t]

  external push :
    event -> 'payload Js.t -> ?timeoutMs:timeoutMs -> Push.t =
    "" [@@bs.send.pipe: t]

  external leave : ?timeoutMs:timeoutMs -> Push.t =
    "" [@@bs.send.pipe: t]
end

and Socket : sig
  type t

  external make : string -> 'opts Js.t -> t =
    "Socket" [@@bs.new] [@@bs.module "phoenix"]

  external protocol : t -> string = "" [@@bs.send]
  external endPointURL : t -> string = "" [@@bs.send]

  external disconnect : (unit -> 'a) -> 'code -> string -> 'a =
    "" [@@bs.send.pipe: t]

  external connect : 'params Js.t -> unit = "" [@@bs.send.pipe: t]
  external onOpen : (event -> 'a) -> unit = "" [@@bs.send.pipe: t]
  external onClose : (event -> 'a) -> unit = "" [@@bs.send.pipe: t]
  external onError : (event -> 'a) -> unit = "" [@@bs.send.pipe: t]
  external onMessage : (event -> 'a) -> unit = "" [@@bs.send.pipe: t]
  external onConnOpen : t -> unit = "" [@@bs.send]
  external onConnClose : event -> unit = "" [@@bs.send.pipe: t]
  external onConnError : event -> unit = "" [@@bs.send.pipe: t]
  external triggerChanError : t -> unit = "" [@@bs.send]
  external connectionState : t -> string = "" [@@bs.send]
  external isConnected : t -> bool = "" [@@bs.send]
  external remove : Channel.t -> unit = "" [@@bs.send.pipe: t]

  external channel : string -> ?chanParams:'params Js.t -> Channel.t =
    "" [@@bs.send.pipe: t]
end = struct
  type t

  external make : string -> 'opts Js.t -> t =
    "Socket" [@@bs.new] [@@bs.module "phoenix"]

  external protocol : t -> string = "" [@@bs.send]
  external endPointURL : t -> string = "" [@@bs.send]

  external disconnect : (unit -> 'a) -> 'code -> string -> 'a =
    "" [@@bs.send.pipe: t]

  external connect : 'params Js.t -> unit = "" [@@bs.send.pipe: t]
  external onOpen : (event -> 'a) -> unit = "" [@@bs.send.pipe: t]
  external onClose : (event -> 'a) -> unit = "" [@@bs.send.pipe: t]
  external onError : (event -> 'a) -> unit = "" [@@bs.send.pipe: t]
  external onMessage : (event -> 'a) -> unit = "" [@@bs.send.pipe: t]
  external onConnOpen : t -> unit = "" [@@bs.send]
  external onConnClose : event -> unit = "" [@@bs.send.pipe: t]
  external onConnError : event -> unit = "" [@@bs.send.pipe: t]
  external triggerChanError : t -> unit = "" [@@bs.send]
  external connectionState : t -> string = "" [@@bs.send]
  external isConnected : t -> bool = "" [@@bs.send]
  external remove : Channel.t -> unit = "" [@@bs.send.pipe: t]

  external channel : string -> ?chanParams:'params Js.t -> Channel.t =
    "" [@@bs.send.pipe: t]
end
