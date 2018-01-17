#!/bin/bash
echo " Script for generating work report"
read c
if (("$c"=="y")); then
echo "Enter the date"
read date 
touch /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo -e "#######\nDate : "$date"" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo -e "Shift time :"
read shtime
echo -e "Shift Time : "$shtime"" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo -e "Members in Shift :"
read member
echo -e "Members in Shift : "$member"\n#######\n" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo "No of ticket attempted :"
read n
if (("$n"=="0")); then
break
else
echo -e "\n-----------\nTickets:\n-----------" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
if (("$n">="5")); then
fi
for ((i=1 ; i<="$n" ; i++)) 
do
echo -e "-----------\n"$i"#" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo -e "-----------"
echo  "Ticket ID  : "
read tid
echo -e "Ticket ID   : "$tid"" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo  "Subject    : "
read sub
echo -e "Subject     : "$sub"" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo  "Customer   : "
read cust
echo -e "Customer    :"$cust"" >>  /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo  "Description : "
read descri
echo -e "Description :"$descri"" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo -e "-----------"
done
fi
echo -e " Lets being with chat "
echo "No of chat attempted :"
read c
if (("$c"=="0")); then
echo -e "Aarum chatan vanilla"
break
else
echo -e "\n-----------\nChats:\n-----------" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
for ((j=1 ; j<="$c" ; j++)) 
do
echo -e "-----------\n"$j"#" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo -e "-----------"
echo  "Customer Name :"
read cname
echo -e "Customer Name : "$cname"" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo  "Email    : "
read mail
echo -e "Email         : "$mail"" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo  "Description   : "
read des
echo -e "Description   :"$des"" >>  /hdin/techies/hdinamalso/testsh/sh/"$date".txt
echo -e "-----------"
echo -e "-----------" >> /hdin/techies/hdinamalso/testsh/sh/"$date".txt
done
fi

echo " Completed"
echo -e "Did you wish to open the report"
read open
if (("$open"=="y")); then
vim /hdin/techies/hdinamalso/testsh/sh/"$date".txt
else
exit
fi
else
echo "Quiting....."
fi

