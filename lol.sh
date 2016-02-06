filename='test.list'
output='out.file'
site='ctf.arch-cloud.com/'
agent='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.82 Safari/537.36 OPR/35.0.2066.37'

echo Starting Doshbuster
while read p; do
    temp=$site$p
    if [ "$(wget --header="Accept: text/html" --user-agent=$agent "$temp" 2>&1 | grep -c '200\|OK')" -gt 0 ]; then
        echo found $p >> $output
    fi

    echo $p
done < $filename

cat $output
