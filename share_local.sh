###############################################################################
## 
## Script to zip and share starterpack.sh
##     
## Copyright Tinker Academy 2014
###############################################################################
export PATH_TO_DROPBOX="/Users/ron/Dropbox"
export PATH_TO_COURSEUPDATE="/Users/ron/Documents/TinkerAcademy/CourseUpdate"
export PATH_TO_WEBSERVER="/Users/ron/Documents/mongoose"
export TARGET_FILE=CourseUpdate.zip
pushd `pwd`
rm -rf $PATH_TO_COURSEUPDATE/classes
cp -r $PATH_TO_DROPBOX/classes $PATH_TO_COURSEUPDATE/classes
cd $PATH_TO_COURSEUPDATE
rm -rf $TARGET_FILE
cd classes
ln -s scripts/update_course.py "Course Update"
chmod u+x "Course Update"
cd $PATH_TO_COURSEUPDATE
zip -r $TARGET_FILE classes 
echo $TARGET_FILE created
popd
pushd .
cd $PATH_TO_WEBSERVER
sudo ./mongoose -listening_ports 80 -document_root $PATH_TO_COURSEUPDATE
popd
echo "Web Server Started"

