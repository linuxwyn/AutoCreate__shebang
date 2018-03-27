platform=`uname`
[ -f users_table ] && : || echo 'Please create text file named "users_table" include you want to create'


user_add() {
id $1 >/dev/null 2>&1
if [ "$?" -eq 0 ]
then
	echo OS:$platform
	echo $1 exist
	case $platform in
		AIX)
		mkuser -s $2 $1 || sudo mkuser -s $2 $1 >/dev/null 2>&1;[ "$?" -eq 0 ] && echo create $username successfully || echo create $username failure
		;;
		Linux)
		useradd -s $2 $1 || sudo useradd -s $2 $1 >/dev/null 2>&1;[ "$?" -eq 0 ] && echo create $username successfully || echo create $username failure
		;;
		*)
		echo neither AIX nor Linux
		;;
	esac
fi}

cat users_table | while read username
do
	cat -n /etc/shells 
	read -p "which shell you want to use: " num
	shell=`cat /etc/shells | awk -v a=$num 'NR==a{print $0}'`
	user_add $username $shell
done
