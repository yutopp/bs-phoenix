# bs-phoenix - BuckleScript bindings for Phoenix.js

This package is a fork of [yawaramin/bs-phoenix](https://github.com/yawaramin/bs-phoenix).

Phoenix.js is the JavaScript client for the Phoenix framework:
https://github.com/phoenixframework/phoenix/blob/v1.3/assets/js/phoenix.js

This binding aims to be as close as possible to idiomatic OCaml. There is
another existing binding, https://github.com/phoenix-china/bucklescript-phx ,
which is more feature-complete. The difference between this one and that is,
this one is very much a work in progress! Also, this one sticks more closely
with the `Module.function` idiom that's normal in OCaml.

For example, a JavaScript snippet from the Phoenix.js module:

```javascript
let socket = new Socket("/socket", {params: {userToken: "123"}})
```

translates to the corresponding OCaml in bs-phoenix:

```ocaml
open Phoenix

let socket = Socket.make "/socket" [%obj { params = { userToken = "123" } }]
```

## Use

Add the package to your npm project:

    $ npm install @yutopp/bs-phoenix

Add the BuckleScript dependency to your `bsconfig.json`:

    {
      ...,
      "bs-dependencies": [..., "@yutopp/bs-phoenix"]
    }

And see the `src/test.ml` file for examples of what the code should look
like.
