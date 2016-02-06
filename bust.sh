filename='test.list'
site='ctf.arch-cloud.com'
agent='Mozilla/5.0 (Macintosh; Intel Mac OS x 10_6_8) AppleWebKit/534.30 (KHTML, like Gecko)
Chrome/12.0.742.112 Safari/534.30'
echo Starting DoshBuster
while read p; do
    echo $p
done < $filename

wget $site | echo
