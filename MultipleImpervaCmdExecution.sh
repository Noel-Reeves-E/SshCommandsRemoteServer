echo "Enter the list"
while read x
do
    echo $x >> list.txt
done

echo "Enter the command to execute"
read cmd

echo "Enter your username"
read name
echo "Enter your ssh key file with path"
read key

for y in `cat list.txt`
do
    echo $y
    echo "Executing the command now"
    echo "$cmd" | ssh -i $key $name@$y "admin"
done

rm -r list.txt
