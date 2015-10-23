cd /Users/Bode/Documents/MyBlog@Github/source
jekyll build
cd /Users/Bode/Documents/MyBlog@Github/blog
rm -r ./*
cp -r /Users/Bode/Documents/MyBlog@Github/source/_site/* ./
cp /Users/Bode/Documents/MyBlog@Github/source/.gitignore ./
git add -A
git commit -m "更新"
git push origin master
cd /Users/Bode/Documents/MyBlog@Github/source

echo "DONE!!!!"