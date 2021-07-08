#day 11 programm
echo "enter upto which number we have to flip the coin:"
read n
declare -A single_combo=( [h]=0  [t]=0 )
echo 
for(( fl = 1; lf <= n; fl++ ))
do
	echo -n "flip -$fl "
	((coin = RANDOM % 2 ))
	case $coin
		0) echo "heads"
	  	    (( single_combo[h]++ )) ;;
		1) echo "tails"
	   	     (( single_combo[t]++ )) ;;
	esac
done
for combination in ${!single_combo[@]}
do
	per=$(( ${single_combo[$combination]} * 100/n ))
	single_combo[$combination]=$per
	echo "percentage of $combination is{single_combo[$combination]}%"
done

