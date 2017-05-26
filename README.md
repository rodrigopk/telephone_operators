## Programming exercise - Routing of telephone calls

The main code of the exercise can be found on the ```telephone.rb``` file.
I chose to keep it all classes in one file for simplicity, and because they 
are all very small and closely related.

To run the exercise CLI, you can use the following command:
		
		ruby telephone_cli.rb [number] [csv_file_path]

This script is also marked as executable, so you can run it directly after giving it the 
proper permission. Ex.:

		./telephone_cli.rb 4673212345 sample_data.csv

The input data for the operators price lists is read from a csv file, so it´s easy to add 
new operators if needed. I provided a sample file using the data from the exercise description.


The unit tests for the exercise are in the ```telephone_tests.rb``` file.
For running the tests, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

In order to run the tests, you can use the following command:

    ruby telephone_test.rb

#### Thanks for your time!