# input: www.mydomain.com
# output: www\.mydomain\.com

$domain_name       = 'www.mydomain.com'
$domain_name_regex = inline_template("<%= @domain_name.gsub('.','\\.') %>")

notify { $domain_name_regex: }

# if you want to test this, use "irb"
# irb
# domain_name='www.mydomain.com'
# domain_name_regex=domain_name.gsub('.','\.')
# puts domain_name_regex
