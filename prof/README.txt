on fish shell
on commit 06e18242b4c676d5a61a20549757f9ef4a8e1412
by successively uncommenting top-level statements from the slow part of testfile.alc
run:
  # replace ### with part number
  # edit testfile after each part
  set part ###; for v in A B C D E; set run "$part""$v"; luvit runtest.lua p prof/"$run".txt | ts -m '%F %.T' >prof/"$run"-out.txt; end
  # after all that, generate flamegraphs
  for part in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17; for v in A B C D E; set run "$part""$v"; set samp (wc -l prof/"$run".txt | cut -d\  -f1); perl flamegraph.pl --title="$run" --minwidth="$(math "800/$samp")%" prof/"$run".txt > prof/"$run"-fg.svg; end; end
