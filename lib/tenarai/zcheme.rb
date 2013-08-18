(require "tenarai/zcheme/version")
(require "tenarai/zcheme/env")

(module Tenarai::Zcheme
   (def self.eval (sexp)
      (Zcheme::Env.global.eval sexp) end)
 end)
