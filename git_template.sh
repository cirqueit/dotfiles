git config --global init.templatedir '~/.git_template'
mkdir -p ~/.git_template/hooks

cp $(pwd)/ctags ~/.git_template/hooks/ctags
chmod +x ~/.git_template/hooks/ctags

cp $(pwd)/post-commit ~/.git_template/hooks/post-commit
chmod +x ~/.git_template/hooks/post-commit

cp $(pwd)/post-commit ~/.git_template/hooks/post-merge
chmod +x ~/.git_template/hooks/post-merge

cp $(pwd)/post-commit ~/.git_template/hooks/post-checkout
chmod +x ~/.git_template/hooks/post-checkout

cp $(pwd)/post-rewrite ~/.git_template/hooks/post-rewrite
chmod +x ~/.git_template/hooks/post-rewrite
