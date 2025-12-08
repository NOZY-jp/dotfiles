function acn
  if test (count $argv) -lt 1
    echo "Usage: acn <contest_id>"
    return 1
  end

  set contest $argv[1]

  acc new $contest
  and cd $contest
  and nv
end

