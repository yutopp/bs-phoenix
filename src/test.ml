let () =
  let socket = Socket.make "/socket" [%obj { params = { userToken = "123" } }] in
  let channel = Socket.channel "room:123" ~chanParams:[%obj { token = "123" }] socket in

  Channel.on "new_msg" (Js.log2 "Got message") channel;

  channel
    |> Channel.push "new_msg" [%obj { body = "a" }] ~timeoutMs:10_000.0
    |> Push.receive "ok" (Js.log2 "Created message")
    |> Push.receive "error" (Js.log2 "Create failed")
    |> Push.receive "timeout" (fun _ -> Js.log "Network issue")
    |> ignore;

  channel
    |> Channel.join
    |> Push.receive "ok" (Js.log2 "Catching up")
    |> Push.receive "error" (fun payload -> Js.log2 "Failed to join" payload##reason)
    |> Push.receive "timeout" (fun _ -> Js.log "Network issue. Still waiting...")
    |> ignore
