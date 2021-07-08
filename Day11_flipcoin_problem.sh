#day 11 programm
echo "enter upto which number we have to flip the coin:"
read n
declare -A single_combo=( 
		[h]=0  
		[t]=0
 )
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

echo "######################### Double combination #######################"
declare -A double_combo=(
	[hh]=0
	[ht]=0
	[th]=0
	[tt]=0
)
for(( fl = 1; fl <= n; fl++ ))
do
	echo-n "flip -$fl "
	(( c1 = RANDOM % 2 ))
	(( c2 = RANDOM % 2 ))
	case $c1$c2 
		00)echo "heads heads"
		(( double_combo[hh]++ )) ;;
		01)echo "heads tails"
		(( double_combo[ht]++ )) ;;
		10)echo "tails heads"	
		(( double_combo[th]++ )) ;;
		11)echo "tails tails"
		(( double_combo[tt]++ )) ;;
	esac
done
for combination in ${!double_combo[@]}
do
	percentage=$(( ${double_combo[$combination]} * 100/n ))
	double_combo[$combination]=$percentage
	echo "percentage of $combination is ${double_combo[$combination]}%"
done
