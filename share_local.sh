###############################################################################
## 
## Script to zip and locally share 
##     
## Copyright Tinker Academy 2014
###############################################################################
export UPDATE_DATE=`date +%Y-%m-%d`
export DROPBOX_PATH="/Users/ron/Dropbox"
export COURSEUPDATE_PATH="/Users/ron/Documents/TinkerAcademy/CourseUpdate"
export COURSEUPDATE_FILENAME=courseupdate$UPDATE_DATE
export IP_ADDRESS=`ifconfig | grep -A 4 en1: | grep inet | grep -v inet6 | cut -d' ' -f2`
export TARGET_FILENAME=CourseUpdate$UPDATE_DATE.zip
export WEBSERVER_PATH="/Users/ron/Documents/mongoose"
pushd `pwd`
rm -rf $COURSEUPDATE_PATH/$COURSEUPDATE_FILENAME
cp -r $DROPBOX_PATH/classes $COURSEUPDATE_PATH/$COURSEUPDATE_FILENAME
cd $COURSEUPDATE_PATH
rm -rf $TARGET_FILENAME
cd $COURSEUPDATE_FILENAME
ln -s scripts/update_course.py "Course Update"
chmod u+x "Course Update"
cd $COURSEUPDATE_PATH
zip -y -r $TARGET_FILENAME $COURSEUPDATE_FILENAME 
echo $TARGET_FILENAME created
rm -rf $COURSEUPDATE_PATH/$COURSEUPDATE_FILENAME
popd
pushd .
cd $WEBSERVER_PATH
echo "IP_ADDRESS ["$IP_ADDRESS"]"
sudo ./mongoose -listening_ports 80 -document_root $COURSEUPDATE_PATH
popd
