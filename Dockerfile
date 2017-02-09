FROM vmware/powerclicore
MAINTAINER Ed Morgan <ed@edmorgan.info>

WORKDIR /powershell

# Install Rubrik PowerShell module and clean up
ADD https://github.com/mo6020/PowerShell-Module/archive/macOS.zip /powershell
RUN mkdir ~/.local/share/powershell/Modules/Rubrik
RUN unzip /powershell/master.zip -d /powershell/
RUN cp -R /powershell/PowerShell-Module-master/Rubrik ~/.local/share/powershell/Modules/
RUN rm -rf /powershell/PowerShell-Module-master

CMD ["powershell"]
