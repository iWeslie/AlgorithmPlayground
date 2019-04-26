# Read from the file words.txt and output the word frequency list to stdout.
cat words.txt | tr -s ' ' '\n' | sort | uniq -c | sort -r | awk '{ print $2, $1 }'

# tr -s: truncate the string with target string, but only remaining one instance (e.g. multiple whitespaces)
# sort: To make the same string successive so that uniq could count the same string fully and correctly.
# uniq -c: uniq is used to filter out the repeated lines which are successive, -c means counting
# sort -r: -r means sorting in descending order
# awk '{ print $2, $1 }': To format the output.