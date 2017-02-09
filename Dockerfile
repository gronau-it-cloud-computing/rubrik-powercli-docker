FROM vmware/powerclicore
MAINTAINER Ed Morgan <ed@edmorgan.info>

WORKDIR /powershell

# Cleanup leftover PowerNSX objects
RUN rm -rf /powershell/master.zip
RUN rm -rf /powershell/powernsx-master

# Install Rubrik PowerShell module and clean up
ADD https://github.com/mo6020/PowerShell-Module/archive/macOS.zip /powershell
RUN mkdir ~/.local/share/powershell/Modules/Rubrik
RUN unzip /powershell/macOS.zip -d /powershell/
RUN cp -Rf /powershell/PowerShell-Module-macOS/Rubrik ~/.local/share/powershell/Modules/
RUN rm -rf /powershell/PowerShell-Module-macOS

CMD ["powershell"]
