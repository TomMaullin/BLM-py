# Work out BLM dir
BLMdir=$(realpath ../../)
cd $BLMdir

# Include the parse yaml function
. lib/parse_yaml.sh
cd $BLMdir/BLM/test

# Read the test directory
gtdir=$1

# Run each test case
i=1
for cfg in $(ls ./cfg/fsltest_cfg*.yml)
do
  
  cfgfilepath=$(realpath $cfg)

  echo " "
  echo " "
  echo "Now verifying: $(basename $cfgfilepath)".
  echo " "
  echo " "

  # read yaml file to get output directory
  eval $(parse_yaml $cfgfilepath "config_")
  fslpython -c "import verify_test_cases_against_fsl; verify_test_cases_against_fsl.main('$(basename $config_outdir)/fsl/', '$(basename $config_outdir)/blm/')"

  i=$(($i + 1))
done
