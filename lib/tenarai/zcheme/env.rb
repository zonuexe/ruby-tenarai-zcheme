(require 'tenarai/zcheme/version')
(require 'pathname')

(class Tenarai::Zcheme::Env
   (attr_accessor :dic)
   (def initialize
      (self.dic = {}) end)

   (def self.global
      (newenv_obj = new)
      (newenv_obj.dic.merge! (load_zcm :default))
      newenv_obj end)

   (def eval (sexp)
      (if (not (list? sexp))
         (if (immediate_val? sexp)
            sexp
          else
            (lookup_primitive_fun sexp)
          end)
       else
         (func = (self.eval (car sexp)))
         (args = (eval_list (cdr sexp)))
         (apply func, args)
       end) end)

   (def apply (fun, args)
      (apply_primitive_fun fun, args) end
    (private :apply))

   (def apply_primitive_fun (fun, args)
      ((fun.fetch 1). (args)) end
    (private :apply_primitive_fun))

   (def self.load_zcm (file)
      (path = (File.expand_path "./env/#{file}.zcm.rb", __dir__))
      (zcm  = ((open path).read))
      (instance_eval zcm) end)

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
      (dic.fetch sexp) end
    (private :lookup_primitive_fun))

   (def immediate_val? (sexp)
      (num? sexp) end
    (private :immediate_val?))

   (def num? (sexp)
      (sexp.is_a? Numeric) end
    (private :num?))

   (def lookup_var (var, env)
      (alist = (env.find? do |alist| (alist.key? var) end))
      (if alist == nil
         (raise "couldn't find value to variables:'#{var}'") end)
      (alist.fetch var) end)

   (def extend_env (params, args, env)
      (alist = (Hash[params.zip args]))
      ([h].concat env)
    end)

   (def let? (sexp)
      ((sexp.fetch 1).eql? :let) end)

   (def eval_let (sexp, env)
      (params, args, body = let_to_parameters_args_body(exp))
      (new_exp = [[:lambda, params, body]] + args)
      (self.eval new_exp, env) end)

   (def let_to_parameters_args_body(exp)
      [((exp.fetch 1).map do |e| (e.fetch 0) end),
       ((exp.fetch 1).map do |e| (e.fetch 1) end),
       (exp.fetch 2)] end)

   (def eval_lambda (sexp, env)
      (make_clocure sexp, env) end)

   (def make_closure (sexp, env)
      (params = (exp.fetch 0))
      (body =   (exp.fetch 1))
      [:closure, params, body, env] end)

   (def lambda_apply (closure, args)
      (params, body, env = closure_to_parameters_body_env)
      (new_env = (extend_env params, args, env))
      (self.eval body, new_env) end)

   (def closure_to_parameters_body_env (closure)
      [(closure.fetch 1),
       (closure.fetch 2),
       (closure.fetch 3)]
    end)
 end)
