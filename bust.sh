# Dirbuster written in bash
# Doshmajhan

filename='test.list'
output='out.file'
site='ctf.arch-cloud.com/'
agent="User-Agent: Mozilla/5.0 (X11; Ubuntu; Linx x86_64; rv:44.0) Gecko/20100101 Firefox/44.0"

echo Starting Doshbuster

getpage(){
    temp=$site$1
    if [ "$(wget --header="Accept: text/html" --user-agent=$agent "$temp" 2>&1 | egrep -c "200
        OK|403 Forbidden")" -gt 0 ]; then
        echo $1 >> $output
        echo found $1
    fi
}

while read p; do
    while [ `jobs | wc -l` -ge 50 ] 
    do
        sleep 5
    done
    getpage $p &    
done < $filename
