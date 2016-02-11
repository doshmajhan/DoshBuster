#File for testing

filename='test.list'
output='out.file'
site='ctf.arch-cloud.com/'
agent="User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:44.0) Gecko/20100101 Firefox/44.0)"
echo Starting Doshbuster

getpage(){
    temp=$site$1
    wget --header="Accept: text/html" --user-agent=$agent "$temp" 2> temp.txt
}


while read p; do
    while [ `jobs | wc -l` -ge 50 ] 
    do
        sleep 5
    done
    echo $p
    getpage $p    
done < $filename
