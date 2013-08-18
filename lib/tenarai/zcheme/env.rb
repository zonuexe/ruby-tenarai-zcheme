(require 'tenarai/zcheme/version')
(require 'pathname')

(class Tenarai::Zcheme::Env
   (attr_accessor :dic)
   (def initialize
      (self.dic = {})
      (self.dic.merge! (load_zcm 'default')) end)

   (def eval (sexp)
      (if (not list?(sexp))
         (if (immediate_val? sexp)
            sexp
          else
            (lookup_primitive_fun sexp)
          end)
       else
         (fun  = (self.eval (car sexp)))
         (args = (eval_list (cdr sexp)))
         (apply fun, args)
       end)
    end)

   (def apply (fun, args)
      (apply_primitive_fun fun, args) end
    (private :apply))

   (def apply_primitive_fun (fun, args)
      ((fun.fetch 1). (args)) end
    (private :apply_primitive_fun))

   (def load_zcm (file)
      (path = (File.expand_path "./env/#{file}.zcm.rb", __dir__))
      (zcm  = ((open path).read))
      (instance_eval zcm) end
    (private :load_zcm))

   (def eval_list (list)
    (list.map {|e| self.eval e}) end
    (private :eval_list))

   (def list? (sexp)
      (sexp.is_a? Array) end
    (private :list?))

   (def car (list)
      (list.fetch 0) end
    (private :car))

   (def cdr (list)
      (list.slice 1..-1) end
    (private :cdr))

   (def lookup_primitive_fun (sexp)
      (self.dic.fetch sexp) end
    (private :lookup_primitive_fun))

   (def immediate_val? (sexp)
      (num? sexp) end
    (private :immediate_val?))

   (def num? (sexp)
      (sexp.is_a? Numeric) end
    (private :num?))
 end)
