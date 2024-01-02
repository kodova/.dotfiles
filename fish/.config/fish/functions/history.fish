function history --wraps=builtin\ history\ --show-time=\'\%F\ \%T\ \' --description alias\ history\ builtin\ history\ --show-time=\'\%F\ \%T\ \'
  builtin history --show-time='%F %T ' $argv
        
end
