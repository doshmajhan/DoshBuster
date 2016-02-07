#File for testing

filename='test.list'
output='out.file'
site='ctf.arch-cloud.com/'
agent='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko)
Chrome/48.0.2564.82 Safari/537.36 OPR/35.0.2066.37'
echo Starting Doshbuster

getpage(){
    temp=$site$1
    if [ "$(wget --header="Accept: text/html" --user-agent=$agent "$temp" 2>&1 | grep -c '200\|OK')" -gt 0 ]; then
        echo $1 >> $output
        echo found $1
    fi
    echo $1
}

while read p; do
    while [ `jobs | wc -l` -ge 50 ] 
    do
        sleep 5
    done
    getpage $p &    
done < $filename

cat $output
