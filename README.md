Included:
Ruby script solution: fr_formatter.rb
Two source data sets that were provided: cl3.csv & cl4.csv
Two new data sets in desired format: fr_formatted_cl3.csv & fr_formatted_cl4.csv

Usage:
The script is written in Ruby and can be run from the command line. It will accept two arguments. The first argument is the file name (in CSV). The second argument is the name of the output/formatted file and is optional. If the second argument is not included the output file will be named the same as the input file, but with the prefix of "fr_formatted_".

Strategy:
The strategy was pretty straight forward. There are four steps;
1. Assess the arguments given. If there is no second argument, create a file name for the output based on the input file name.
2. Clean up the data and identify family groups. Because there was considerable overlap with last names, I chose to group families by email. This was based on the assumption that if a parent was bringing their kids they would likely only include one email for themselves and the kids. In this second step, I also eliminated any nil/blank values from the entries.
3. Put the matching emails into family groups and sort by age (descending). This gave me family groups with the parent as the first element.
4. Based on the given target format, pull the necessary elements from the family arrays and push them into a CSV file.

Comments:
The code could be a bit more concise, but it is simple and readable.

* I did slightly manipulate the source data. I renamed them both as I was working with them, just to clean it up. Also, on the data set originally titled "Customer+List+12.8.2016+#4.csv" there were several lines of empty cells at the bottom as well as a message about when it was printed. I thought about trying to code a solution that would delete or ignore this, but I decided that it would be cleaner to not add solutions to unique problems that could be easily over come outside of the code.
