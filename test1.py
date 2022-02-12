import urllib.request 
def download(url):
  print("Downloading:",url)
  try:
    html=urllib.request.urlopen(url).read()
  except Exception as e:
    raise e
  else:
    return html
download("http://tjj.zj.gov.cn/")
