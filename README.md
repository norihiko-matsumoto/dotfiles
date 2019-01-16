# dotfiles

# インストール手順

## chocolatyでパッケージ管理  


### chocolateyのセットアップ
https://chocolatey.org/

### 自動インストールするソフト
choco install clcl.portable -y  
choco install winmerge-jp -y  
choco install 7zip.install -y  
choco install cmder -y  
choco install git -y  
choco install github -y  
choco install tortoisegit -y  
choco install vscode -y  
choco install mpc-hc -y  
choco install googlechrome -y  
choco install anaconda3 -y  
choco install autohotkey.install -y  
choco install itunes -y  
choco install rlogin -y  
choco install putty.portable -y  
choco install adobereader -y  
choco install winscp -y  
choco install irfanview -y  
choco install graphviz -y  
choco install plantuml -y  
choco install ripgrep -y  
choco install jdk8 -y  
choco install tomcat -y    
choco install wsl -y  
choco install wsl-ubuntu-1804 -y  
choco install sakuraeditor -y  
choco install sourcetree -y  
choco install monosnap -y
 
### 自動インストールをやめたソフト(いつか復活するかも）
choco install cloc -y  あまり使わなそう。  
choco install keepass.install -y  
choco install phraseexpress.portable -y 個人用のみ無償。会社用は有償  

### ポータブル版は以下のディレクトリに情報が記録されるのか？
C:\ProgramData\chocolatey\lib\  


##  手動インストール



### Cmder の設定
https://qiita.com/thrzn41/items/7dd3b1ec5e50bae9f03b  
passを通す
setting - startup Environment に以下を設定
set LANG=ja_JP.UTF-8
設定ファイルが以下のパスにある。
C:\cmder\vendor\conemu-maximus5\ConEmu.xml


### fenrir  
コマンドプロンプト（管理者権限で実行）  
mklink fenrir.ini c:\git\dotfiles\fenrir\data\fenrir.ini  
mklink instant.ini c:\git\dotfiles\fenrir\data\instant.ini  
これは共有しなくて良いので手動でファイルをコピーする。→ScanRule.ini  
clip.exeをコピーする。  

### Kindle  
日科技連やIPAのPDFを登録する。  


### relaxtools  

### zoom   
### chat tool   

### vim 右のコマンドは失敗した。choco install vim-tux.install -y
https://www.kaoriya.net/software/vim/
香りやさんから取得する。  
64bit版をインストールするが、c:直下にしたほうが良いか。  
dotfilesをgithubから取得、シンボリックリンクの設定  

### Asr  


### Windows subsystem for linux  
https://qiita.com/Aruneko/items/c79810b0b015bebf30bb  
#### 日本語化  
http://www.atmarkit.co.jp/ait/articles/1806/28/news043.html  
#### cmderからの接続  
https://laboradian.com/installation-and-setting-of-wsl/  
#### vimの設定  
dotfilesを取得してhomeの下に.vimとvimfilesのシンボリックリンクを作成したらうまく行った。 
#### fzf  
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf  

#### linux brew  
https://qiita.com/aktsh/items/18f0cfdabfce3b750ff5  
→失敗  

#### ripgrep 
https://qiita.com/kikuchi_kentaro/items/9dc441f64c17a38aad96  
この手順でうまく行った。  
#### Cmder  
WSL bashを起動できるように設定  

---------

### java_home catarina_home pass setting  

### VSCの設定を共有する記事をどこかで見た気がするが  

### bookmark  
これもdotfiles化できるか。google chromeの共有で良いか。  

### GoogleIME  


### スタートアップへの設定
Win+R　→　shell:startup  
clcl  
autohotkey  
fenrir  


### Windows10 update 1809  
ダークモードの設定  

