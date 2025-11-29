function act
  if test (count $argv) -lt 1
    echo "Usage: act <problem_id>"
    return 1
  end

  set problem $argv[1]
  set orig_dir (pwd)

  cd $problem
  or begin
     echo "Directory '$problem' not found"
    return 1
  end

  oj t -c "python main.py" -d tests

  cd $orig_dir
end
