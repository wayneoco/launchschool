def a_method(prc)
  p prc.binding.local_variables
  p prc.binding.eval("d") # <<------- 3
  p prc.call(prc.binding.eval('c')) # <<------- 4
end

proc_obj = proc do |num|
  num + 7
end

p proc_obj.binding.local_variables # <<------- 1

c = 3 # <<------- 2
a_method(proc_obj)
d = 15
