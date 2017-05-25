## Programming exercise - Routing of telephone calls

To run the exercise, you can use the following command:
		
		ruby telephone_exercise.rb [number] [csv_file_path]

This script is also marked as executable, so you can run it directly after giving it the propper permission. Ex.:

		./telephone_exercise.rb 4673212345 sample_data.csv

The input data for the operators price lists is read from a csv file. I provided a sample
one using the data from the exercise description.

The main code of the exercise can be found on the ```telephone.rb``` file.
I chose to keep it all classes in one file for simplicity, and because they 
are all very small and closely related.

I wrote some test cases to cover some of the requisitions on the exercise 
description while I was writing the classes, and to provide some example of 
how to use them.

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

In order to run the tests, you can run the test file from the exercise
directory with the following command:

    ruby telephone_test.rb

##### Thanks for your time!