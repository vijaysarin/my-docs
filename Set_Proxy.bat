@echo off
goto setproxy

:setproxy
echo.
echo "To set Proxy for CMD, NPM and GIT sessions"
echo.
echo "Please enter your TCS-Mobility Credentials. Your login data is not saved"
echo.
Set username=
set /p username=Username: 

@echo off
powershell -Command $pword = read-host "Enter password" -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword) ; ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR) > .tmp.txt 
set /p password=<.tmp.txt & del .tmp.txt

echo.

:: For Windows CMD, NPM and GIT sessions

@echo "Setting Proxy for Command Prompt"
set proxy="http://%username%:%password%@proxy.tcs.com:8080/"
set http_proxy="http://%username%:%password%@proxy.tcs.com:8080/"
set https_proxy="https://%username%:%password%@proxy.tcs.com:8080/"
set http-proxy="http://%username%:%password%@proxy.tcs.com:8080/"
set https-proxy="https://%username%:%password%@proxy.tcs.com:8080/"

echo.

@echo "Setting Proxy for NPM"
call npm config set strict-ssl false
call npm config set registry "http://registry.npmjs.org/"
call npm config set proxy="http://%username%:%password%@proxy.tcs.com:8080/"
call npm config set http-proxy="http://%username%:%password%@proxy.tcs.com:8080/"
call npm config set https-proxy="https://%username%:%password%@proxy.tcs.com:8080/"
call npm config set http_proxy="http://%username%:%password%@proxy.tcs.com:8080/"
call npm config set https_proxy="https://%username%:%password%@proxy.tcs.com:8080/"

echo.

@echo "Setting Proxy for GIT"
call git config --global http.proxy "http://%username%:%password%@proxy.tcs.com:8080/"

echo.

echo "Proxy is now set for CMD, NPM and GIT sessions"
echo.
@pause
exit /b 0