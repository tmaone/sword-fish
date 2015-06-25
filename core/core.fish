if not set -q sword_core_modules
  set -xg sword_core_modules arg array call var string find wd dir file in out color log info warn debug error profile disk cpu download fish fn ask linux osx host path hash net ps plugin theme setting src sudo uuid time date reload git update prompt
end

function core --description "sword-fish core"

end

function core.init

  if not set -q sword_core_init
    for core_module in $sword_core_modules
      if set -q sword_load_progress
        import "$core_module" | progress
      else
        import $core_module
      end
    end
    set sword_core_init "done"
  end

end
