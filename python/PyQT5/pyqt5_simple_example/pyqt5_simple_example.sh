#!/bin/bash -

# objective:
# render an HTML page as a PDF using PyQT5

apt -y install apache2

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<body>

<h1>My First Heading</h1>
<p>My first paragraph.</p>

</body>
</html>
EOF

service apache2 restart

apt -y install python3-pyqt5
apt -y install python3-pyqt5.qtwebkit

export QT_QPA_PLATFORM=offscreen
ln -s /usr/share/fonts /usr/lib/x86_64-linux-gnu/fonts


cd /vagrant

./render_page.py
