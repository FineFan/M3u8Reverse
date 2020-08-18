end_number=200
for i in $(seq -w 3 1 $end_number);do
    # seq -w 3 means   the sequence will have 3 digital
    #  from 1 to $end_number
    echo $i
done
