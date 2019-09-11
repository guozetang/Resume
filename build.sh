rm -rf .git
git init
git config --global push.default matching
git config --global user.email "guozetang@gmail.com" #填入GitHub的邮箱地址
git config --global user.name "guozetang" #填入GitHub的用户名
# git branch -mv origin master
git add --all .
git commit -m "Travis CI Auto Builder" #自动构建后的内容将全部以此信息提交
git push --quiet --force https://${REPO_TAKEN}@github.com/guozetang/Resume.git master  #自动构建后的内容将全部以此信息提交
#curl --connect-timeout 20 --max-time 30 -s http://远端服务器URL/webhook.php?_=${NOTIFY_TOKEN} #服务器Webhook 将在下文介绍
