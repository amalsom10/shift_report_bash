#!/bin/bash
echo " Script for generating work report"
read c
if (("$c"=="y")); then
echo "Enter the date"
read date
touch /home/amal/Desktop/latest"$date".txt
echo -e "#######\nDate : "$date"" >> /home/amal/Desktop/latest/"$date".txt
echo -e "Shift time :"
read shtime
echo -e "Shift Time : "$shtime"" >> /home/amal/Desktop/latest/"$date".txt
echo -e "Members in Shift :"
read member
echo -e "Members in Shift : "$member"\n#######\n" >> /home/amal/Desktop/latest/"$date".txt
echo "No of ticket attempted :"
read num
num=$((num-1))
if (("$num"=="0")); then
break
else
echo -e "\n-----------\nTickets:\n-----------" >> /home/amal/Desktop/latest/"$date".txt
touch /home/amal/Desktop/latest/tmp
cat /home/amal/Desktop/latest/Metrics\ DimeNOC\ Administrator.csv | cut -d '"' -f6 | tail -n +2 | cat >> /home/amal/Desktop/latest/tmp
j=1
for ((i=0 ; i<="$num" ; i++)) 
do
echo -e "-----------\n"$i"#" >> /home/amal/Desktop/latest/"$date".txt
echo -e "-----------"
id=($(cat /home/amal/Desktop/latest/Metrics\ DimeNOC\ Administrator.csv  | cut -d '"' -f4| tail -n +2))
echo -e "Ticket ID   : "${id[i]}"" >> /home/amal/Desktop/latest/"$date".txt
line=($(sed -n ${j}p /home/amal/Desktop/latest/tmp))
echo -e "Subject   : "${line[*]}"" >> /home/amal/Desktop/latest/"$date".txt
unset line 
j=$((j+1))
echo  "Customer name of "${id[i]}"  : "
read cust
echo -e "Customer    :"$cust"" >>  /home/amal/Desktop/latest/"$date".txt
echo  "Description name of "${id[i]}" : "
read descri
echo -e "Description :"$descri"" >> /home/amal/Desktop/latest/"$date".txt
echo -e "-----------"
done 
rm /home/amal/Desktop/latest/tmp
fi
echo -e " Lets being with chat "
echo "No of chat attempted :"
read chat
if (("$chat"=="0")); then
break
else
cat Metrics\ DimeNOC\ Administrator_chat.csv | cut -d '"' -f6 | tail -n +2 | cat >> /home/amal/Desktop/latest/tmp1
#cat Metrics\ DimeNOC\ Administrator_chat.csv | cut -d '"' -f18 | tail -n +2 | cat >> /home/amal/Desktop/latest/tmp2
echo -e "\n-----------\nChats:\n-----------" >> /home/amal/Desktop/latest/"$date".txt
for ((k=1 ; k<="$chat" ; k++)) 
do
echo -e "-----------\n"$k"#" >> /home/amal/Desktop/latest/"$date".txt
echo -e "-----------"
name=($(sed -n ${k}p /home/amal/Desktop/latest/tmp1))
echo -e "Customer Name : "${name[*]}"" >> /home/amal/Desktop/latest/"$date".txt
echo  "Email of "${name[*]}"   : "
read mail
echo -e "Email         : "$mail"" >> /home/amal/Desktop/latest/"$date".txt
echo  "Description of "${name[*]}"   : "
read des
echo -e "Description   :"$des"" >>  /home/amal/Desktop/latest/"$date".txt
echo -e "-----------"
echo -e "-----------" >> /home/amal/Desktop/latest/"$date".txt
done 
rm /home/amal/Desktop/latest/tmp1
fi

echo " Completed Bro......"
echo -e "Did you wish to open the report"
read open
if (("$open"=="y")); then
vim /home/amal/Desktop/latest/"$date".txt
else
exit
fi
else
echo "Quiting........Good bye"
fi




