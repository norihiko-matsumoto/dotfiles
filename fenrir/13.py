import webbrowser
import time

#13環境のテスト画面を全部開く

webbrowser.open_new('http://10.34.49.34/Monex/knowledge/index.php?%E6%9D%B1%E4%BA%AC%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%EF%BC%83%EF%BC%91%EF%BC%93')
time.sleep(1)
webbrowser.open_new_tab('http://10.34.49.183:8134/pc/ITS/login/MemberLogin.jsp?dispCtrl=in')

time.sleep(1)
webbrowser.open_new_tab('http://10.34.49.183:8132/Cfi/ULM/ULM0100_login.jsp')
time.sleep(1)
webbrowser.open_new_tab('http://10.34.49.183:8133/admintools-front/front/pubs/login/cm00001/login')
time.sleep(1)
webbrowser.open_new_tab('http://10.34.49.189:7131/tradeone/application/common/ZZ0000V.jsp')
