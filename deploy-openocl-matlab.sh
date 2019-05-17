OCL_VERSION=4.29
DATESTR=$(date +"%Y\/%m\/%d")
DATEVERSION="$OCL_VERSION, $DATESTR"

mkdir $HOME/openocl-deploy-pure-$OCL_VERSION

# set date and version in readme marked by $dateversion$
sed "s/#dateversion#/$DATEVERSION/g" README > $HOME/openocl-deploy-pure-$OCL_VERSION/README
sed "s/#version#/$OCL_VERSION/g" version.m > $HOME/openocl-deploy-pure-$OCL_VERSION/version.m

cd $HOME/openocl-deploy-pure-$OCL_VERSION

git clone https://github.com/OpenOCL/OpenOCL.git openocl_repo
cd openocl_repo
git checkout-index -a -f --prefix=$HOME/openocl-deploy-pure-$OCL_VERSION/openocl/
cd ..
rm -rf openocl_repo
rm openocl/.gitignore
rm openocl/README.md
mv README ./openocl/README
mv version.m ./openocl/+ocl/

cd openocl
zip -r -q ../OpenOCL-${OCL_VERSION}.zip .
cd ..
