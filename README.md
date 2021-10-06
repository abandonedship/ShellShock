# ShellShock

shellshocker.sh local and remote scan for shellshock vulnerability for Bash versions lower than 4.3.* [CVE-2014-6271]  
-rz option to spawn shell

# one liner
* Change bash_program variable value for /usr/bin/bash or ./bash or your bash program path location  
<pre>
bash_program="bash";printf "\n$bash_program binary set, change in source code if necesary\n";$bash_program --version | grep version | grep -v Licen;printf "[\e[0;33m*\e[0m] Checking shellshock vulnerability for Bash versions lower than 4.3.*\n";env x='() { :;}; printf "[\e[0;32m+\e[0m] \e[1mShellshock Vulnerability found [ CVE-2014-6271 ]\e[0m\n"' $bash_program -c "printf \"[\e[0;33m\!\e[0m] End, ignore empty\"";
</pre>

# Screenshots

![alt text](https://github.com/0bfxGH0ST/ShellShock/blob/main/screenshots/screenshot01.png)  
![alt text](https://github.com/0bfxGH0ST/ShellShock/blob/main/screenshots/screenshot02.png)  
![alt text](https://github.com/0bfxGH0ST/ShellShock/blob/main/screenshots/screenshot03.png)  
One liner  
![alt text](https://github.com/0bfxGH0ST/ShellShock/blob/main/screenshots/oneliner.png)  


