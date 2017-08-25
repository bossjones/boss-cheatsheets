# basic loop
for i in 1 2 3 4 5 6 7 8 9 10
do
  echo $i
done

# loop ls command results
for var in `ls -alF`
do
  echo $var
done

# loop specified number of times
for i in `seq 1 10`
do
  echo $i
done
