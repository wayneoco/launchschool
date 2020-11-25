(1..99).each {|num| puts num if num.odd?}

1.step(by: 2, to: 99) {|num| puts num}

1.upto(99) {|num| puts num if num.odd?}

(1..99).to_a.select {|num| puts num if num.odd?}