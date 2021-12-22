import requests,sys,json
from requests.auth import HTTPBasicAuth
url = "http://127.0.0.1:5000/"
def create_user(endpoint:str,username:str,password:str) -> int:
    object = {"username":username,'password':password}
    req = requests.post(endpoint,json=object)
    return(req.status_code)
def create_token(endpoint:str,username:str,password:str)->str:
    req = requests.get(endpoint,auth=HTTPBasicAuth(username,password))
    return(req.text)
def authorized_action(endpoint:str,token="")->int:
    req = requests.get(endpoint,auth=HTTPBasicAuth(token,""))
    return(req.status_code,req.text)

print(create_user(url+"api/users","nabeel","password"))
token = json.loads(create_token(url+"api/token","nabeel","password"))
print(authorized_action(url+"api/resource",token['token']))