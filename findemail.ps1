# Script to search AD for duplicate email addresses
# Also looks at the 'display' email address from the first page of the AD user
# Office365 hybrid sync requires this field be unique too

$email = read-host -prompt 'Enter email to search for'
$smtpemail = "smtp:" + $email
$smtpemail2 = "SMTP:" + $email

write-output "-------- Searching for: ---------"
write-output $email
write-output $smtpemail
write-output $smtpemail2
write-output "---------------------------------"

$domains = (get-adforest).domains
write-output "----- Searching in domains: -----"
write-output $domains
write-output "---------------------------------"

foreach ($domain in $domains){

get-adobject -server $domain -properties mail, proxyaddresses -Filter {mail -eq $email -or proxyaddresses -eq $smtpemail -or proxyaddresses -eq $smtpemail2}
}