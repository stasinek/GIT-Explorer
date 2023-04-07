# GIT-Explorer
TODO: Local directories Git reposistories scanner, recognizer, fetcher, tar.gz, zip unpacker/packer/removal, auto git init for certain subdirectories, finder of remote mirrors etc. So far made i made it in simple .bat, sh scripts, will have to create GUI tool to execute, schedule these

autofetch.bat "%1_subdirectory" -> It will scan it, if .git is found in subdirectory will auto fetch it from origin 
autotar.bat "%1" will unpack all tar.gz, 7z, tar.bz archives into subdirectories (if these do not exist) and then remove these, wont remove zip!
autozip.bat "%1" will create update zip archives as additional backup, these wont be ever unpacked by autotar if directory already exist
fetchall.sh "%1" is same as autofetch either on Linux or MSYS32, just fetching all git repositories in subdirectory
all files with "_name.bat" are just helpers, executed by main script, in witch you can define action
autodebug.bat will ask question whenever show additional data - be verbrose or quiet
autoconfig.bat can configure scripts, as for now give name for directory pattern you want to skip TODO: be able to read data from .conf file 

TODO: fixes specially autofetch cause it doesn work, simplify autozip cause it get too complicated too much parameters %1,%2,%3
TODO: add some pdcurses,ncurses or even Qt based GUI being able to execute scripts, show list of subdirectories with git status, size, existence of ZIP backup, being able to configure how often update zips, create list of potential directories to git init empty git, detect type of language used, create git init and/or try to find reposistory on github and fetch it
Tried to find such tool, cause i have ~50GB of sourcecode, to analyze, 4bilion useless files, store on VHD virtual disk, so its easier to make backup, goal is to keep them in zips, goal is maybe to use ZPAQ in addition to GIT
This is too dangerous to be used on mine projects directory downloaded tons of code never used, never checked, all is too complicated
By end of day reed it, and make mine own. But still have to do something with that pile of "garbage"
That is goal of this project
