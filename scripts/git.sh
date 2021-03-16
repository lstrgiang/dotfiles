# Git: Revert changes & Remove all untracked 
function grr() 
{
	git reset --hard;
	git clean -fd;
}
# Git: Revert changes in specific file 
function gr() 
{
	git checkout HEAD $@;
}
# Git: add all, commit and push. [-m "comment"] 
function gacp() 
{
	git add .;
	git commit $@
	git push
}
