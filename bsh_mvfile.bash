
function sep_model {

  for file in $1/*.txt # read all name of text file from a given directory
  do
      acc=$(grep Accuracy $file | sed 's/.* //')              # get accuracy value
      model_type=$(grep "model type" $file | sed 's/.* //')   # get type of model

      if [ $acc -ge 90 ]; then # a result of the model >= 90%
          if [[ $model_type = 'Regression' ]]; then  # regression model
                mv $file {enter_your_path}/passed_model/regress_model
          # classification model
          elif [[ $model_type = 'Classification' ]]; then 
                mv $file {enter_your_path}/passed_model/class_model
          fi   
      
      else # a result of the model < 90%
            mv $file {enter_your_path}/retry_model
      fi
  done
}

# call a function with a given argument
sep_model "files"
