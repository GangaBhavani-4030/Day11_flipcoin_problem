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



echo "############################### TRIPLET-COMBINATION #####################################"
declare -A triple_combo=( 
                                    [HHH]=0
                                    [HHT]=0
                                    [HTH]=0
                                    [HTT]=0
                                    [THH]=0
                                    [THT]=0
                                    [TTH]=0
                                    [TTT]=0

                                )
for(( fl = 1; fl <= n; fl++ ))
do
    echo -n "Flip-$fl  "
    (( c1 = RANDOM % 2 ))
    (( c2 = RANDOM % 2 ))
    (( c3 = RANDOM % 2 ))
    case $c1$c2$c3 in 
        000)
            echo "Heads Heads Heads"
            (( triple_combo[HHH]++ )) 
            ;;
        001)
            echo "Heads Heads Tails"
            (( triple_combo[HHT]++ ))
            ;;
        010)
            echo "Heads Tails Heads"
            (( triple_combo[HTH]++ ))
            ;;
        011)
            echo "Heads Tails Tails"
            (( triple_combo[HTT]++ ))
            ;;
        100)
            echo "Tails Heads Heads"
            (( triple_combo[THH]++ )) 
            ;;
        101)
            echo "Tails Heads Tails"
            (( triple_combo[THT]++ ))
            ;;
        110)
            echo "Tails Tails Heads"
            (( triple_combo[TTH]++ ))
            ;;
        111)
           echo "Tails Tails Tails"
            (( triple_combo[TTT]++ ))
            ;;
    esac
done
for combination in ${!triple_combo[@]}
do
    percentage=$(( ${triple_combo[$combination]}  * 100 / n ))
    triple_combo[$combination]=$percentage
    echo "percentage of $combination is ${triple_combo[$combination]}%"
done
