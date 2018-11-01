git init
git commit --allow-empty -m "Initial commit"
git flow init -d
for f in ~/.git_template/hooks/*
do
  ln -snfv ~/.git_template/hooks/"$f" ./.git/hooks
done
