NOTE=$1

cd /Users/Bode/Documents/MyBlog@Github/source
echo "更新代码"
git add .
git commit -m ${NOTE}
git push origin source
echo "准备发布"
jekyll build
cd /Users/Bode/Documents/MyBlog@Github/blog
rm -r ./*
cp -r /Users/Bode/Documents/MyBlog@Github/source/_site/* ./
cp /Users/Bode/Documents/MyBlog@Github/source/.gitignore ./
git add .
git commit -m ${NOTE}
echo "正在上传"
git push origin master
cd /Users/Bode/Documents/MyBlog@Github/source

echo "更新并上传"
echo ${NOTE}
echo "已完成"