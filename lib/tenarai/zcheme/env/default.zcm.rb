{
  :+ => [:prim, ->(args){ args.inject(:+) }],
  :- => [:prim, ->(args){ args.inject(:-) }],
  :* => [:prim, ->(args){ args.inject(:*) }],
  :/ => [:prim, ->(args){ args.inject(:/) }],
}
