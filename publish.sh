cd /Users/Bode/Documents/MyBlog@Github/source
echo "更新代码"
git add .
git commit -m "更新source"
git push origin source
echo "准备发布"
jekyll build
cd /Users/Bode/Documents/MyBlog@Github/blog
rm -r ./*
cp -r /Users/Bode/Documents/MyBlog@Github/source/_site/* ./
cp /Users/Bode/Documents/MyBlog@Github/source/.gitignore ./
git add .
git commit -m "更新"
echo "正在上传"
git push origin master
cd /Users/Bode/Documents/MyBlog@Github/source

echo "DONE!!!!"