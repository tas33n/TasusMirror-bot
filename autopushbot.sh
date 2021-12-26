#bin/bash
RANDOM=$RANDOM
appname=working$RANDOM
if ! command -v heroku
then
    echo "Heroku could not be found"
    exit
fi
echo "Are You Logged In On Heroku CLi? Y/N"
read login
if ! [ $login == "Y" ] || [ $login == "y" ]
then 
    echo "Login First"
    exit
fi
echo "Have You Filled Config.env? Y/N"
read config
if ! [ $config == "Y" ] || [ $config == "y" ]
then 
    echo "Fill Config First"
    exit
fi  
if ! [ -f config.env ]
then 
    echo "Config Not Found" 
    exit
fi
echo "Making a New App"
heroku create $appname
heroku git:remote -a $appname
heroku stack:set container -a $appname
echo "Done"
echo "Pushing"
if ! [ -d accounts/ ]
then
    git add .
    git add -f token.pickle config.env drive_folder
    git commit -m "changes"
    git push heroku
    echo "Done, Now Turn On Dyno Using Website To Use Your Bot."
    else
    echo "Pushing Accounts Folder Too"
    git add .
    git add -f token.pickle config.env drive_folder accounts accounts/*
    git commit -m "changes"
    git push heroku
    echo "Done, Now Turn On Dyno Using Website To Use Your Bot."
fi