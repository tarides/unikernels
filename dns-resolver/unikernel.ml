open Lwt.Infix

(* (c) 2017, 2018 Hannes Mehnert, all rights reserved *)
module Main (C : Mirage_console.S) (R : Mirage_random.S) (P : Mirage_clock.PCLOCK) (M : Mirage_clock.MCLOCK) (T : Mirage_time.S) (S : Tcpip.Stack.V4V6) = struct
  module D = Dns_resolver_mirage.Make(R)(P)(M)(T)(S)

  let start console _r _pclock _mclock _ s =
    C.log console "Hello World!" >>= fun () ->
    let now = M.elapsed_ns () in
    let server =
      Dns_server.Primary.create ~rng:R.generate Dns_resolver_root.reserved
    in
    let p = Dns_resolver.create now R.generate server in
    D.resolver ~timer:1000 ~root:true s p ;
    S.listen s
end
