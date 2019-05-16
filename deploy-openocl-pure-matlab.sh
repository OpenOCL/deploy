OCL_VERSION=4.25

mkdir $HOME/openocl-deploy-pure-$OCL_VERSION

cp README_PURE $HOME/openocl-deploy-pure-$OCL_VERSION

cd $HOME/openocl-deploy-pure-$OCL_VERSION

git clone https://github.com/OpenOCL/OpenOCL.git openocl_repo
cd openocl_repo
git checkout-index -a -f --prefix=$HOME/openocl-deploy-pure-$datestr/openocl/
cd ..
rm -rf openocl_repo
rm openocl/.gitignore
rm openocl/README.md
mv README_PURE ./openocl/README

cd openocl
zip -r -q ../OpenOCL-${OCL_VERSION}.zip .
cd ..
