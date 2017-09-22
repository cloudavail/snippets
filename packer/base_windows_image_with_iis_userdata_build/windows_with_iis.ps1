<powershell>
# install IIS
Install-WindowsFeature -name "Web-Server"
# NOTE: it is suggested that EC2Launch be utilized for setting Windows 2016 Server passwords
net user Administrator # add password here and remove comments: ""
</powershell>
