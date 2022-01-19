(* (c) 2017, 2018 Hannes Mehnert, all rights reserved *)

open Mirage

let dns_handler =
  let packages =
    [
      package "logs" ;
      package "dns";
      package "dns-server";
      package "dns-mirage";
      package ~sublibs:[ "mirage" ] "dns-resolver";
    ]
  in
  foreign
    ~packages
    "Unikernel.Main" (console @-> random @-> pclock @-> mclock @-> time @-> stackv4v6 @-> job)

let () =
  register "resolver" [dns_handler $ default_console $ default_random $ default_posix_clock $ default_monotonic_clock $ default_time $ generic_stackv4v6 default_network ]
