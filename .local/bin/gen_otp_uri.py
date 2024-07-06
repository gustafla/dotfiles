import json
import urllib
from urllib.parse import urlencode, quote

with open("otp.json") as f:
    accounts = json.load(f)

for acc in accounts:
    urlkeys = {"secret", "issuer", "digits", "algorithm", "period"}
    urldict = {key: acc[key] for key in urlkeys}
    print("otpauth://" + acc["type"].lower() + "/" + quote(acc["label"]) + "?" + urlencode(urldict))
