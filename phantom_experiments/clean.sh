

function SafePurge
{
	if [ $# -ne 2 ]; 
	then 
	echo "Err calling func SafePurge, wrong num of args !!! Exiting..." ;
	exit 0 ;
	fi
	
	echo "The following files will be purged:" ;
	find $1 -name $2 -type f
	echo "Would you like to continue? [Enter/Return for YES]" ;
	read ans

	if [[ -z $ans ]];
	then
	find $1 -name $2 -type f -delete
	fi
}

SafePurge ./SimpleCoil/ "*.png"
SafePurge ./SimpleCoil/ "*.fld"
SafePurge ./SimpleCoil/ "*.mat"

