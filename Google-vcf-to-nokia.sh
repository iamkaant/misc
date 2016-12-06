FILE=contacts.vcf
BEGINS=`grep -n BEGIN $FILE`
ENDS=`grep -n END $FILE`
i=1
j=1
for begin in $BEGINS
do
        beginnum[$i]=`echo $begin | awk '{match($0,":"); print(substr($0,1,RSTART-1))}'`
#       echo ${beginnum[$i]}
        (( i++ ))
done
for end in $ENDS
do
        endnum[$j]=`echo $end | awk '{match($0,":"); print(substr($0,1,RSTART-1))}'`
#       echo ${endnum[$j]}
        (( j++ ))
done
for ((a=1; a < j; a++ ))
do
        awk 'NR >= '${beginnum[$a]}' && NR <= '${endnum[$a]}' {print $0}' $FILE > $a.vcf
done



