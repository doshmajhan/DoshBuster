filename='test.list'
site='ctf.arch-cloud.com/var/'
agent='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.82 Safari/537.36 OPR/35.0.2066.37'
#curl -A $agent $site | echo
wget --header="Accept: text/html" --user-agent=$agent $site | echo
