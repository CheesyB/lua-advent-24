package = "lua-advent-24"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
dependencies = {
   "lua >= 5.1, < 5.5"
   "inspect >= 3.1"
}
build = {
   type = "builtin",
   modules = {
       main="src/main.lua"
   }
}
