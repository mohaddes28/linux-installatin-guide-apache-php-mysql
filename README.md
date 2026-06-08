# Comprehensive Guide: Installing and Configuring Apache, Nginx, MySQL, and PHP (LAMP & LEMP Stack) on Ubuntu

## Table of Contents
1. [Introduction & Prerequisites](#1-introduction--prerequisites)
2. [Step 1A: Installing and Configuring Apache Web Server](#2-step-1a-installing-and-configuring-apache-web-server)
3. [Step 1B: Installing and Configuring Nginx Web Server](#3-step-1b-installing-and-configuring-nginx-web-server)
4. [Step 2: Installing and Configuring MySQL Server](#4-step-2-installing-and-configuring-mysql-server)
5. [Step 3: Installing PHP and Extensions (Any Version 5.6 - 8.4)](#5-step-3-installing-php-and-extensions-any-version-56---84)
6. [Step 4: Managing and Switching PHP Versions](#6-step-4-managing-and-switching-php-versions)
7. [Step 5: Installing Composer (PHP Dependency Manager)](#7-step-5-installing-composer-php-dependency-manager)
8. [Step 6: Installing Node.js and NPM](#8-step-6-installing-nodejs-and-npm)
9. [Step 7: Verifying the Installation](#9-step-7-verifying-the-installation)
10. [Step 8: File Permissions & Directory Structure](#10-step-8-file-permissions--directory-structure)
11. [Step 9: Troubleshooting & Log Locations](#11-step-9-troubleshooting--log-locations)
    - [11.1 Log Locations](#111-log-locations)
    - [11.2 Common Issues](#112-common-issues)
      - [MySQL Access Denied for 'root'@'localhost'](#mysql-access-denied)
      - [Nginx Common Issues (502 Bad Gateway, 403 Forbidden, 404 Routing, Port Conflicts)](#nginx-common-issues)

---

### 1. Introduction & Prerequisites
This guide provides a detailed walkthrough for setting up a full LAMP (Linux, Apache, MySQL, PHP) or LEMP (Linux, Nginx, MySQL, PHP) stack on an Ubuntu server. It covers multi-version PHP installation (PHP 7.4 and PHP 8.3) and instructions on how to switch between them for command-line usage, Apache, and Nginx (via PHP-FPM).

**Requirements:**
- A system running Ubuntu (20.04 LTS, 22.04 LTS, or 24.04 LTS).
- A user account with `sudo` administrative privileges.
- An active internet connection.

---

### 2. Step 1A: Installing and Configuring Apache Web Server
Apache 2 is a robust, production-grade web server. 

#### 1.1 Update Package Lists
Before installing any package, ensure your system's package database is up-to-date:
```bash
sudo apt update
```

#### 1.2 Install Apache 2
Install the Apache web server packages:
```bash
sudo apt install apache2 -y
```

#### 1.3 Configure Firewall (UFW)
Ensure that your firewall allows traffic to your web server. UFW (Uncomplicated Firewall) provides application profiles for Apache:
- **`Apache`**: Opens port 80 (normal unencrypted web traffic).
- **`Apache Secure`**: Opens port 443 (HTTPS encrypted traffic).
- **`Apache Full`**: Opens both port 80 and 443.

Allow standard Apache traffic:
```bash
sudo ufw allow 'Apache'
```

Verify the firewall status:
```bash
sudo ufw status
```

#### 1.4 Managing the Apache Service
Use the following commands to check, start, stop, restart, or enable Apache to run on system boot:
* **Check status**:
  ```bash
  sudo systemctl status apache2
  ```
  *(Alternative service command: `sudo service apache2 status`)*
* **Start Apache**:
  ```bash
  sudo systemctl start apache2
  ```
* **Stop Apache**:
  ```bash
  sudo systemctl stop apache2
  ```
* **Restart Apache** (gracefully reloads configuration and restarts service):
  ```bash
  sudo systemctl restart apache2
  ```
* **Reload Apache** (reloads configuration without dropping existing connections):
  ```bash
  sudo systemctl reload apache2
  ```
* **Enable Apache to start at boot**:
  ```bash
  sudo systemctl enable apache2
  ```

---

### 3. Step 1B: Installing and Configuring Nginx Web Server
Nginx is a high-performance web server known for its low resource utilization, speed, and concurrency handling. It is widely preferred for modern PHP applications (like Laravel).

#### 1.1 Install Nginx
Install the Nginx web server:
```bash
sudo apt update
sudo apt install nginx -y
```

#### 1.2 Configure Firewall (UFW)
Like Apache, Nginx has pre-configured profiles for UFW:
- **`Nginx HTTP`**: Opens port 80 (normal unencrypted web traffic).
- **`Nginx HTTPS`**: Opens port 443 (HTTPS encrypted traffic).
- **`Nginx Full`**: Opens both port 80 and port 443.

Allow standard Nginx traffic:
```bash
sudo ufw allow 'Nginx Full'
```

Verify the firewall status:
```bash
sudo ufw status
```

#### 1.3 Managing the Nginx Service
Use `systemctl` to check, start, stop, restart, or enable Nginx:
* **Check status**:
  ```bash
  sudo systemctl status nginx
  ```
* **Start Nginx**:
  ```bash
  sudo systemctl start nginx
  ```
* **Stop Nginx**:
  ```bash
  sudo systemctl stop nginx
  ```
* **Restart Nginx** (hard restart, drops active connections):
  ```bash
  sudo systemctl restart nginx
  ```
* **Reload Nginx** (gracefully reloads configuration files without losing connections):
  ```bash
  sudo systemctl reload nginx
  ```
* **Enable Nginx to start at boot**:
  ```bash
  sudo systemctl enable nginx
  ```

#### 1.4 Virtual Host Configuration (Server Blocks)
Nginx uses server blocks (comparable to Apache Virtual Hosts) to host multiple sites. By default, Nginx is configured to serve content from `/var/www/html` via the default server block `/etc/nginx/sites-available/default`.

For a modern PHP application (e.g., Laravel), create a customized server block configuration file. Here is a highly optimized configuration template:

1. Create a configuration file (replace `example.com` with your project domain or name):
   ```bash
   sudo nano /etc/nginx/sites-available/example.com
   ```

2. Add the following optimized configuration:
   ```nginx
   server {
       listen 80;
       listen [::]:80;
       server_name example.com www.example.com;
       
       # Set the document root to your PHP application directory 
       # (For Laravel, point to /var/www/html/example-project/public)
       root /var/www/html;
       
       index index.php index.html index.htm;
       
       charset utf-8;
       
       # Modern framework routing: try to serve the request as a file/directory,
       # if not found, pass to index.php with the query arguments
       location / {
           try_files $uri $uri/ /index.php?$query_string;
       }
       
       # Turn off logging for common files to save disk I/O and clean up logs
       location = /favicon.ico { access_log off; log_not_found off; }
       location = /robots.txt  { access_log off; log_not_found off; }
       
       # Route 404 pages through index.php
       error_page 404 /index.php;
       
       # Pass PHP scripts to FastCGI server (PHP-FPM)
       location ~ \.php$ {
           # Ensure the PHP-FPM socket path matches your installed PHP version:
           fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;
           fastcgi_index index.php;
           fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
           include fastcgi_params;
       }
       
       # Deny access to hidden files (e.g., .env, .git)
       location ~ /\.(?!well-known).* {
           deny all;
       }
   }
   ```

3. Enable the configuration by creating a symbolic link (symlink) to the `sites-enabled` directory:
   ```bash
   sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
   ```

4. Test Nginx for syntax errors:
   ```bash
   sudo nginx -t
   ```

5. If the syntax test is successful, reload Nginx to apply changes:
   ```bash
   sudo systemctl reload nginx
   ```

---

### 4. Step 2: Installing and Configuring MySQL Server
MySQL is a relational database management system. 

#### 2.1 Install MySQL
Install the default MySQL server package:
```bash
sudo apt install mysql-server -y
```

#### 2.2 Secure MySQL Installation
MySQL comes with a security script to restrict access and remove insecure default settings. Run the security wizard:
```bash
sudo mysql_secure_installation
```
During this process, you will be prompted to:
1. **Enable the Validate Password Plugin**: Select `Y` if you want MySQL to enforce strong passwords, then choose the strength level (Low, Medium, or Strong).
2. **Set a Root Password**: Define a strong administrative password for the MySQL `root` user.
3. **Remove Anonymous Users**: Select `Y` to ensure only registered accounts can log in.
4. **Disallow Root Login Remotely**: Select `Y` to prevent remote administrative access.
5. **Remove Test Database**: Select `Y` to drop the default test database.
6. **Reload Privilege Tables**: Select `Y` to apply changes immediately.

#### 2.3 Creating a Dedicated Application Database & User
Avoid using the root account for daily application databases. Instead, create a dedicated database and user.

1. Log into the MySQL terminal:
   ```bash
   sudo mysql
   ```
2. Create a new database:
   ```sql
   CREATE DATABASE my_app_db;
   ```
3. Create a dedicated user with a secure password (replace `secure_password` with your password):
   ```sql
   CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'secure_password';
   ```
4. Grant privileges to the user on the database:
   ```sql
   GRANT ALL PRIVILEGES ON my_app_db.* TO 'app_user'@'localhost';
   ```
5. Flush privileges and exit:
   ```sql
   FLUSH PRIVILEGES;
   EXIT;
   ```

---

### 5. Step 3: Installing PHP and Extensions (Any Version 5.6 - 8.4)
To support multiple PHP versions, add the Ondřej Surý PPA repository. This repository provides pre-compiled packages for older and newer PHP versions on Ubuntu.

> [!IMPORTANT]
> **Web Server Integrations:**
> - **Apache** can use the built-in PHP module (`libapache2-mod-php<version>`), which runs PHP within the Apache process.
> - **Nginx** cannot use Apache modules. It **must** forward requests to **PHP-FPM** (FastCGI Process Manager) using Unix/TCP sockets. 
> - The installation commands below install *both* options (`libapache2-mod-php<version>` and `php<version>-fpm`) to support both servers out-of-the-box.

#### 4.1 Install Prerequisites & Add Repository
```bash
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
```

#### 4.2 Comprehensive Extension Guide
Here is the list of common extensions that can be installed for each PHP version. Replacing `<version>` with your target version (e.g., `8.3`):

* **`php<version>-cli`**: Command Line Interface for running PHP scripts in the terminal.
* **`php<version>-common`**: Common files used by all PHP packages.
* **`php<version>-fpm`**: FastCGI Process Manager (used with Nginx or advanced Apache event configurations).
* **`php<version>-mysql`**: MySQL/MariaDB database driver (PDO and MySQLi).
* **`php<version>-sqlite3`**: SQLite 3 database driver.
* **`php<version>-pgsql`**: PostgreSQL database driver.
* **`php<version>-mbstring`**: Multibyte string support (required for non-ASCII text processing, UTF-8, etc.).
* **`php<version>-xml`**: XML and DOM parser engine.
* **`php<version>-curl`**: Client URL Library for sending HTTP requests and interacting with APIs.
* **`php<version>-zip`**: Read and write standard zip archives.
* **`php<version>-gd`**: Graphic Draw library for image resizing and manipulation.
* **`php<version>-gmp`**: GNU Multiple Precision library for working with large numbers.
* **`php<version>-bcmath`**: Binary Calculator library for high-precision mathematics.
* **`php<version>-soap`**: Simple Object Access Protocol library for web services.
* **`php<version>-intl`**: Internationalization support (ICU formatting).
* **`php<version>-readline`**: Terminal prompt history and line editing support.
* **`php<version>-opcache`**: Bytecode caching to significantly improve PHP execution speed.
* **`php<version>-redis`**: Redis database cache client.
* **`php<version>-imagick`**: ImageMagick support for advanced graphic processing.
* **`php<version>-xdebug`**: Rich debugger and profiler tools for local development.
* **`libapache2-mod-php<version>`**: Integration module connecting the PHP interpreter to the Apache web server.

---

#### 4.3 Copy-Paste Installations for Every PHP Version

Choose the specific version(s) you wish to install:

##### Option 1: PHP 8.4 (Latest Stable)
```bash
sudo apt install -y php8.4 php8.4-cli php8.4-common php8.4-fpm php8.4-mysql php8.4-sqlite3 php8.4-pgsql php8.4-mbstring php8.4-xml php8.4-curl php8.4-zip php8.4-gd php8.4-gmp php8.4-bcmath php8.4-soap php8.4-intl php8.4-readline php8.4-opcache php8.4-redis php8.4-imagick php8.4-xdebug libapache2-mod-php8.4
```

##### Option 2: PHP 8.3 (Highly Recommended)
```bash
sudo apt install -y php8.3 php8.3-cli php8.3-common php8.3-fpm php8.3-mysql php8.3-sqlite3 php8.3-pgsql php8.3-mbstring php8.3-xml php8.3-curl php8.3-zip php8.3-gd php8.3-gmp php8.3-bcmath php8.3-soap php8.3-intl php8.3-readline php8.3-opcache php8.3-redis php8.3-imagick php8.3-xdebug libapache2-mod-php8.3
```

##### Option 3: PHP 8.2
```bash
sudo apt install -y php8.2 php8.2-cli php8.2-common php8.2-fpm php8.2-mysql php8.2-sqlite3 php8.2-pgsql php8.2-mbstring php8.2-xml php8.2-curl php8.2-zip php8.2-gd php8.2-gmp php8.2-bcmath php8.2-soap php8.2-intl php8.2-readline php8.2-opcache php8.2-redis php8.2-imagick php8.2-xdebug libapache2-mod-php8.2
```

##### Option 4: PHP 8.1
```bash
sudo apt install -y php8.1 php8.1-cli php8.1-common php8.1-fpm php8.1-mysql php8.1-sqlite3 php8.1-pgsql php8.1-mbstring php8.1-xml php8.1-curl php8.1-zip php8.1-gd php8.1-gmp php8.1-bcmath php8.1-soap php8.1-intl php8.1-readline php8.1-opcache php8.1-redis php8.1-imagick php8.1-xdebug libapache2-mod-php8.1
```

##### Option 5: PHP 8.0
```bash
sudo apt install -y php8.0 php8.0-cli php8.0-common php8.0-fpm php8.0-mysql php8.0-sqlite3 php8.0-pgsql php8.0-mbstring php8.0-xml php8.0-curl php8.0-zip php8.0-gd php8.0-gmp php8.0-bcmath php8.0-soap php8.0-intl php8.0-readline php8.0-opcache php8.0-redis php8.0-imagick php8.0-xdebug libapache2-mod-php8.0
```

##### Option 6: PHP 7.4 (Legacy Standard)
```bash
sudo apt install -y php7.4 php7.4-cli php7.4-common php7.4-fpm php7.4-mysql php7.4-sqlite3 php7.4-pgsql php7.4-mbstring php7.4-xml php7.4-curl php7.4-zip php7.4-gd php7.4-gmp php7.4-bcmath php7.4-soap php7.4-intl php7.4-readline php7.4-opcache php7.4-redis php7.4-imagick php7.4-xdebug libapache2-mod-php7.4
```

##### Option 7: PHP 7.3
```bash
sudo apt install -y php7.3 php7.3-cli php7.3-common php7.3-fpm php7.3-mysql php7.3-sqlite3 php7.3-pgsql php7.3-mbstring php7.3-xml php7.3-curl php7.3-zip php7.3-gd php7.3-gmp php7.3-bcmath php7.3-soap php7.3-intl php7.3-readline php7.3-opcache php7.3-redis php7.3-imagick php7.3-xdebug libapache2-mod-php7.3
```

##### Option 8: PHP 7.2
```bash
sudo apt install -y php7.2 php7.2-cli php7.2-common php7.2-fpm php7.2-mysql php7.2-sqlite3 php7.2-pgsql php7.2-mbstring php7.2-xml php7.2-curl php7.2-zip php7.2-gd php7.2-gmp php7.2-bcmath php7.2-soap php7.2-intl php7.2-readline php7.2-opcache php7.2-redis php7.2-imagick php7.2-xdebug libapache2-mod-php7.2
```

##### Option 9: PHP 7.1
```bash
sudo apt install -y php7.1 php7.1-cli php7.1-common php7.1-fpm php7.1-mysql php7.1-sqlite3 php7.1-pgsql php7.1-mbstring php7.1-xml php7.1-curl php7.1-zip php7.1-gd php7.1-gmp php7.1-bcmath php7.1-soap php7.1-intl php7.1-readline php7.1-opcache php7.1-redis php7.1-imagick php7.1-xdebug libapache2-mod-php7.1
```

##### Option 10: PHP 7.0
```bash
sudo apt install -y php7.0 php7.0-cli php7.0-common php7.0-fpm php7.0-mysql php7.0-sqlite3 php7.0-pgsql php7.0-mbstring php7.0-xml php7.0-curl php7.0-zip php7.0-gd php7.0-gmp php7.0-bcmath php7.0-soap php7.0-intl php7.0-readline php7.0-opcache php7.0-redis php7.0-imagick php7.0-xdebug libapache2-mod-php7.0
```

##### Option 11: PHP 5.6 (Highly Legacy)
```bash
sudo apt install -y php5.6 php5.6-cli php5.6-common php5.6-fpm php5.6-mysql php5.6-sqlite3 php5.6-pgsql php5.6-mbstring php5.6-xml php5.6-curl php5.6-zip php5.6-gd php5.6-gmp php5.6-bcmath php5.6-soap php5.6-intl php5.6-readline php5.6-opcache php5.6-redis php5.6-imagick php5.6-xdebug libapache2-mod-php5.6
```

---

#### 4.4 Dynamic Terminal Installation Script
If you want to quickly install a custom version programmatically:
```bash
# Set your version (change 8.3 to any of the versions above)
export PHP_VERSION="8.3"

# Install core, modules, and all standard extensions
sudo apt install -y php${PHP_VERSION} php${PHP_VERSION}-cli php${PHP_VERSION}-common php${PHP_VERSION}-fpm php${PHP_VERSION}-mysql php${PHP_VERSION}-sqlite3 php${PHP_VERSION}-pgsql php${PHP_VERSION}-mbstring php${PHP_VERSION}-xml php${PHP_VERSION}-curl php${PHP_VERSION}-zip php${PHP_VERSION}-gd php${PHP_VERSION}-gmp php${PHP_VERSION}-bcmath php${PHP_VERSION}-soap php${PHP_VERSION}-intl php${PHP_VERSION}-readline php${PHP_VERSION}-opcache php${PHP_VERSION}-redis php${PHP_VERSION}-imagick php${PHP_VERSION}-xdebug libapache2-mod-php${PHP_VERSION}
```

#### 4.5 Managing PHP-FPM Service (Required for Nginx)
When using Nginx with PHP-FPM, you must manage the PHP-FPM daemon directly. Replace `<version>` with your active PHP version (e.g., `8.3`):
* **Check FPM status**:
  ```bash
  sudo systemctl status php<version>-fpm
  ```
* **Start FPM**:
  ```bash
  sudo systemctl start php<version>-fpm
  ```
* **Stop FPM**:
  ```bash
  sudo systemctl stop php<version>-fpm
  ```
* **Restart FPM** (reloads configurations and processes):
  ```bash
  sudo systemctl restart php<version>-fpm
  ```
* **Enable FPM to start on system boot**:
  ```bash
  sudo systemctl enable php<version>-fpm
  ```

---

### 6. Step 4: Managing and Switching PHP Versions
If multiple PHP versions are installed, you must manage which version is active for CLI commands, Apache, and Nginx.

#### 5.1 Switch PHP CLI (Command Line Interface)
Set the default CLI version using `update-alternatives`:
```bash
sudo update-alternatives --config php
```
You will be prompted to enter the selection number representing the PHP version you wish to make the default CLI interpreter.

Verify the change:
```bash
php -v
```

#### 5.2 Switch PHP for Apache Web Server
To change the version Apache uses, you must disable the active module and enable the desired one.

##### Switch to PHP 8.3:
1. Disable PHP 7.4 module:
   ```bash
   sudo a2dismod php7.4
   ```
2. Enable PHP 8.3 module:
   ```bash
   sudo a2enmod php8.3
   ```
3. Restart Apache:
   ```bash
   sudo systemctl restart apache2
   ```

##### Switch to PHP 7.4:
1. Disable PHP 8.3 module:
   ```bash
   sudo a2dismod php8.3
   ```
2. Enable PHP 7.4 module:
   ```bash
   sudo a2enmod php7.4
   ```
3. Restart Apache:
   ```bash
   sudo systemctl restart apache2
   ```

#### 5.3 Switch PHP for Nginx Web Server (via PHP-FPM)
Because Nginx proxies requests to PHP-FPM via socket configuration files, you switch versions by updating the `fastcgi_pass` socket path inside your active Nginx server blocks.

##### Switch from PHP 7.4 to PHP 8.3:
1. Open your Nginx server block configuration (e.g., the default config):
   ```bash
   sudo nano /etc/nginx/sites-available/default
   ```
2. Find the PHP location block and locate the `fastcgi_pass` directive:
   ```nginx
   fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
   ```
   Modify it to point to the `php8.3-fpm` socket:
   ```nginx
   fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;
   ```
3. Save the file and exit.
4. Verify the Nginx syntax:
   ```bash
   sudo nginx -t
   ```
5. Ensure the PHP 8.3-FPM service is running:
   ```bash
   sudo systemctl start php8.3-fpm
   ```
6. Reload Nginx to apply the change:
   ```bash
   sudo systemctl reload nginx
   ```

##### Switch from PHP 8.3 to PHP 7.4:
1. Edit the active server block:
   ```bash
   sudo nano /etc/nginx/sites-available/default
   ```
2. Change the socket path in `fastcgi_pass`:
   ```nginx
   # Change from php8.3-fpm.sock to php7.4-fpm.sock
   fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
   ```
3. Verify syntax:
   ```bash
   sudo nginx -t
   ```
4. Ensure the PHP 7.4-FPM service is running:
   ```bash
   sudo systemctl start php7.4-fpm
   ```
5. Reload Nginx:
   ```bash
   sudo systemctl reload nginx
   ```

---

### 7. Step 5: Installing Composer (PHP Dependency Manager)
Composer is the standard dependency manager for PHP, used to install and manage external libraries in your projects. Here is how to download, verify, install, and configure Composer globally.

#### 5.1 Prerequisites for Composer
Ensure you have the required CLI interpreter and unzip utility installed:
```bash
sudo apt install -y php-cli unzip curl
```

#### 5.2 Step-by-Step Installation
1. Navigate to your home directory or temporary directory:
   ```bash
   cd ~
   ```
2. Download the Composer installer script:
   ```bash
   php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
   ```
3. Verify the installer's integrity (recommended):
   This step compares the installer signature with the official latest signature to ensure the installer has not been tampered with.
   ```bash
   # Retrieve the latest signature hash dynamically
   CORRUPT_HASH="$(wget -q -O - https://composer.github.io/installer.sig)"

   # Run validation
   php -r "if (hash_file('sha384', 'composer-setup.php') === '$CORRUPT_HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
   ```
   *Note: If the output prints `Installer verified`, proceed. Otherwise, download it again.*
4. Run the installer:
   ```bash
   php composer-setup.php
   ```
   This compiles Composer and outputs a single executable archive named `composer.phar`.
5. Safely clean up the installer script:
   ```bash
   php -r "unlink('composer-setup.php');"
   ```

#### 5.3 Making Composer Globally Accessible
To run Composer by simply typing `composer` from any directory instead of referencing `php composer.phar`, move the executable to a global binary directory in your system `$PATH`:
```bash
sudo mv composer.phar /usr/local/bin/composer
```
Assign execution permissions to the binary:
```bash
sudo chmod +x /usr/local/bin/composer
```

#### 5.4 Verify the Global Installation
Run the version check to confirm Composer is globally installed:
```bash
composer --version
```

---

### 8. Step 6: Installing Node.js and NPM
To install Node.js and its package manager (NPM) on Ubuntu, you can choose between two primary methods: using the **NodeSource PPA** (ideal for production environments requiring a specific stable version) or using **NVM (Node Version Manager)** (ideal for development environments where you need to switch between multiple versions).

#### 6.1 Option 1: Install Node.js via NodeSource PPA (Recommended for Servers)
NodeSource provides production-ready binary distributions of Node.js.

1. Update package lists and install curl and gpg prerequisites:
   ```bash
   sudo apt update
   sudo apt install -y curl gpg
   ```
2. Import the NodeSource repository GPG key and add the repository. You can change `22` in the command to target a different major version (e.g., `20` for Node.js 20 LTS):
   ```bash
   curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
   ```
3. Install Node.js (this also automatically installs the appropriate version of npm):
   ```bash
   sudo apt install -y nodejs
   ```
4. Verify that Node.js and npm have been successfully installed:
   ```bash
   node -v
   npm -v
   ```

#### 6.2 Option 2: Install Node.js via NVM (Node Version Manager)
NVM allows you to install, manage, and switch between multiple Node.js versions on a per-user basis.

1. Download and run the NVM installation script:
   ```bash
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
   ```
2. Reload your shell configuration (or restart your terminal) to load NVM into your environment:
   ```bash
   export NVM_DIR="$HOME/.nvm"
   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
   ```
3. Install your desired Node.js version:
   * **Install the latest LTS (Long Term Support) version**:
     ```bash
     nvm install --lts
     ```
   * **Install a specific version (e.g., Node.js 20)**:
     ```bash
     nvm install 20
     ```
4. Manage and switch versions:
   * **List all installed versions**:
     ```bash
     nvm ls
     ```
   * **Switch to a specific version**:
     ```bash
     nvm use 20
     ```
   * **Set the default Node.js version for new terminals**:
     ```bash
     nvm alias default 20
     ```

#### 6.3 Optional: Install Alternative Package Managers (Yarn & pnpm)
Once Node.js is installed, you can globally install other popular package managers if needed:

* **pnpm** (Fast, disk space efficient package manager):
  ```bash
  sudo npm install -g pnpm
  ```
* **Yarn**:
  ```bash
  sudo npm install -g yarn
  ```

---

### 9. Step 7: Verifying the Installation

#### 7.1 Verify Web Server and PHP Integration (Apache or Nginx)
Both web servers typically use `/var/www/html` as the default document root.

> [!WARNING]
> **Port Conflicts:** Apache and Nginx default to port `80`. You cannot run both simultaneously on the same port.
> - To check Nginx while disabling Apache:
>   ```bash
>   sudo systemctl stop apache2
>   sudo systemctl start nginx
>   ```
> - To check Apache while disabling Nginx:
>   ```bash
>   sudo systemctl stop nginx
>   sudo systemctl start apache2
>   ```

1. Create a PHP file in the default web directory (`/var/www/html/`):
   ```bash
   echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
   ```
2. Open your web browser and navigate to `http://your_server_ip/info.php` or `http://localhost/info.php`.
3. You should see the standard detailed PHP configuration page showing the active PHP version.
   - For Apache, check that **Server API** shows `Apache 2.0 Handler` (or similar).
   - For Nginx, check that **Server API** shows `FPM/FastCGI`.
4. **IMPORTANT SECURITY STEP**: Delete `info.php` after testing, as exposing server details is a high security risk:
   ```bash
   sudo rm /var/www/html/info.php
   ```

#### 7.2 Verify PHP-MySQL Connection
To ensure PHP can successfully connect to the MySQL database, create a test script:
1. Create a script named `db_test.php` in `/var/www/html/`:
   ```bash
   sudo tee /var/www/html/db_test.php > /dev/null << 'EOF'
   <?php
   $servername = "localhost";
   $username = "app_user";
   $password = "secure_password"; // Replace with your user's password
   $database = "my_app_db";

   // Create connection
   $conn = new mysqli($servername, $username, $password, $database);

   // Check connection
   if ($conn->connect_error) {
       die("Database Connection failed: " . $conn->connect_error);
   }
   echo "Successfully connected to MySQL database: " . $database;
   $conn->close();
   ?>
   EOF
   ```
2. Open your web browser and navigate to `http://localhost/db_test.php`.
3. Verify that you see `Successfully connected to MySQL database: my_app_db`.
4. Delete the test file for security:
   ```bash
   sudo rm /var/www/html/db_test.php
   ```

#### 7.3 Verify Node.js and NPM
Verify that Node.js can execute Javascript and fetch packages:
1. Create a simple test server script `node_test.js` in your home or current directory:
   ```javascript
   const http = require('http');
   const server = http.createServer((req, res) => {
     res.writeHead(200, { 'Content-Type': 'text/plain' });
     res.end('Node.js is working correctly!\n');
   });
   server.listen(3000, () => {
     console.log('Server running at http://localhost:3000/');
   });
   ```
2. Run the script:
   ```bash
   node node_test.js
   ```
3. Open another terminal or use your web browser to visit `http://localhost:3000` to confirm you see the message.
4. Terminate the process by pressing `Ctrl + C`, then delete the test file:
   ```bash
   rm node_test.js
   ```

---

### 10. Step 8: File Permissions & Directory Structure
For security and convenience, manage owner permissions inside the `/var/www/html` folder.

#### 8.1 Key Paths & Directories
* **Web Document Root**: `/var/www/html/`
* **Apache Configuration Root**: `/etc/apache2/`
* **Apache Virtual Hosts Configuration**: `/etc/apache2/sites-available/`
* **Nginx Configuration Root**: `/etc/nginx/`
* **Nginx Virtual Hosts Configuration**: `/etc/nginx/sites-available/`
* **PHP Configuration (`php.ini`)**:
  - PHP 7.4 (Apache Module): `/etc/php/7.4/apache2/php.ini`
  - PHP 7.4 (PHP-FPM for Nginx): `/etc/php/7.4/fpm/php.ini`
  - PHP 7.4 (CLI): `/etc/php/7.4/cli/php.ini`
  - PHP 8.3 (Apache Module): `/etc/php/8.3/apache2/php.ini`
  - PHP 8.3 (PHP-FPM for Nginx): `/etc/php/8.3/fpm/php.ini`
  - PHP 8.3 (CLI): `/etc/php/8.3/cli/php.ini`
* **PHP-FPM Pool Configurations** (defines listening socket, user, group):
  - PHP 7.4 FPM Pool: `/etc/php/7.4/fpm/pool.d/www.conf`
  - PHP 8.3 FPM Pool: `/etc/php/8.3/fpm/pool.d/www.conf`

#### 8.2 Directory Permissions
By default, files inside `/var/www/html` are owned by `root`. Give your current user ownership of this folder so you can edit files without using `sudo`:
```bash
sudo chown -R $USER:$USER /var/www/html/
```
Ensure that the web server group (`www-data`) retains reading and execution permissions:
```bash
sudo chmod -R 755 /var/www/html/
```

#### 8.3 Using ACL (Access Control List) for Shared Permissions (Highly Recommended)
This is the most modern and secure method. If you are developing a web application (like Laravel) where both your system user (`$USER` / `mohaddes`) and the web server user (`www-data`) need to write to the same files, using ACL ensures that newly created files/folders automatically inherit correct read-write permissions:

1. Install the ACL tool if it is not already installed:
   ```bash
   sudo apt install acl -y
   ```

2. Give full folder access for `/var/www/html/` recursively to both the web server (`www-data`) and current user (`$USER`):
   ```bash
   # Set current permissions recursively
   sudo setfacl -R -m u:www-data:rwx -m u:$USER:rwx /var/www/html/
   # Set default permissions for future files/folders recursively
   sudo setfacl -dR -m u:www-data:rwx -m u:$USER:rwx /var/www/html/
   ```

3. For Laravel projects specifically, ensure that the `storage` and `bootstrap/cache` directories are writable:
   ```bash
   # Set current permissions recursively
   sudo setfacl -R -m u:www-data:rwx -m u:$USER:rwx storage bootstrap/cache
   # Set default permissions for future files/folders recursively
   sudo setfacl -dR -m u:www-data:rwx -m u:$USER:rwx storage bootstrap/cache
   ```

---

### 11. Step 9: Troubleshooting & Log Locations
If you encounter issues, logs are the first place to check.

#### 11.1 Log Locations
* **Apache Access Log**: `/var/log/apache2/access.log`
* **Apache Error Log**: `/var/log/apache2/error.log`
* **Nginx Access Log**: `/var/log/nginx/access.log`
* **Nginx Error Log**: `/var/log/nginx/error.log`
* **MySQL Error Log**: `/var/log/mysql/error.log`
* **PHP-FPM Log**: `/var/log/php8.3-fpm.log` (or `php7.4-fpm.log` depending on active version)

#### 11.2 Common Issues
1. **Port 80/443 already in use / `bind() to 0.0.0.0:80 failed (98: Address already in use)`**:
   - **Cause**: Apache and Nginx are both attempting to listen on port 80.
   - **Solution**: Stop the competing web server. To stop Apache: `sudo systemctl stop apache2` (and disable it: `sudo systemctl disable apache2`). To stop Nginx: `sudo systemctl stop nginx` (and disable it: `sudo systemctl disable nginx`). Check active usage with `sudo lsof -i :80`.
2. **PHP code displays as plain text**:
   - **For Apache**: The PHP Apache module might not be enabled. Run `sudo a2enmod php8.3` (or the corresponding version) and restart Apache: `sudo systemctl restart apache2`.
   - **For Nginx**: Ensure your server block includes a handler for PHP files redirecting to the PHP-FPM socket, and that the PHP-FPM socket path is correct.
3. **502 Bad Gateway (Nginx)**:
   - **Cause**: Nginx is running, but it cannot communicate with the PHP-FPM process. This happens if PHP-FPM is not running, or if the socket configuration path in Nginx is incorrect.
   - **Solution**:
     1. Verify the PHP-FPM status: `sudo systemctl status php8.3-fpm` (replace with your PHP version). Start it if stopped: `sudo systemctl start php8.3-fpm`.
     2. Verify the socket exists at `/var/run/php/php8.3-fpm.sock`.
     3. Ensure the `fastcgi_pass` path in `/etc/nginx/sites-available/default` matches this socket path exactly.
4. **403 Forbidden (Nginx)**:
   - **Cause**: Nginx does not have read permissions for the requested files, or the index file (e.g. `index.php`) is missing, or not specified in your server block's `index` directive.
   - **Solution**:
     1. Ensure index.php is added: `index index.php index.html index.htm;`.
     2. Fix directory ownership: `sudo chown -R $USER:www-data /var/www/html`.
     3. Fix permissions: `sudo chmod -R 755 /var/www/html`.
5. **404 Not Found on Framework URLs / Routing issues (Nginx)**:
   - **Cause**: Framework routing (like Laravel, Symfony, or Single Page Apps) is virtual, but Nginx is attempting to look up the directory on disk.
   - **Solution**: Ensure your server block's `location /` directive utilizes `try_files`:
     ```nginx
     location / {
         try_files $uri $uri/ /index.php?$query_string;
     }
     ```
6. **"No input file specified" / "Primary script unknown" (Nginx + PHP-FPM)**:
   - **Cause**: Nginx successfully talked to PHP-FPM, but PHP-FPM could not find or read the specified PHP file. This is usually caused by an incorrect `SCRIPT_FILENAME` parameter or a root directory permission issue.
   - **Solution**:
     1. In your Nginx config PHP block, ensure you have:
        ```nginx
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        ```
        *(Or `$document_root$fastcgi_script_name`)*
     2. Double-check that your server block `root` path is correct.
     3. Ensure the `www-data` group has read access to the directory: `sudo chown -R $USER:www-data /var/www/html`.
7. **Database connection refused**:
   - Verify that the MySQL service is running: `sudo systemctl status mysql`.
   - Double check database credentials and hostname in your application.
8. **Node.js global installation permission errors (EACCES)**:
   - When using the NodeSource installation, running `npm install -g <package>` can fail with permission errors. You can resolve this by using `sudo npm install -g <package>`, or by using NVM (Option 2) which handles environments in user space and avoids `sudo` entirely.
9. **Node.js Port already in use (EADDRINUSE)**:
   - If you see `Error: listen EADDRINUSE: address already in use :::3000`, check which process is holding the port: `sudo lsof -i :3000`. Stop the process, or select a different port for your server.
10. <a id="mysql-access-denied"></a>**Access denied for user 'root'@'localhost' (MySQL Error)**:
   - **Cause**: By default on Ubuntu, the MySQL `root` user is configured to authenticate using the `auth_socket` plugin. This means that you can only log in if you run the command with administrator privileges (`sudo`). Connecting as `root` from an application (e.g., PHP, Node.js) or running `mysql -u root -p` without `sudo` will fail with this error.
   - **Solution 1 (Recommended)**: Create and use a dedicated non-root application user. Refer back to [Section 2.3: Creating a Dedicated Application Database & User](#23-creating-a-dedicated-application-database--user).
   - **Solution 2 (Run MySQL CLI as Root)**: If you just need to access the MySQL shell, execute it using `sudo`:
     ```bash
     sudo mysql
     ```
   - **Solution 3 (Switch Root to Password or Passwordless Authentication)**: If your application *must* connect as `root` (not recommended for production), change the authentication method:
     1. Log into the MySQL terminal:
        ```bash
        sudo mysql
        ```
     2. Choose one of the following methods to alter the `root` user:
        * **Option A: Root with NO password (Passwordless)**:
          If you encounter `ERROR 1819 (HY000): Your password does not satisfy the current policy requirements` (due to the password validation plugin being active), you must temporarily disable it to allow an empty password:
          1. In the MySQL prompt, run the uninstall command for the validation tool:
             * *For MySQL 8.0+ (Default component)*:
               ```sql
               UNINSTALL COMPONENT 'file://component_validate_password';
               ```
             * *For MySQL 5.7 / older versions (Plugin)*:
               ```sql
               UNINSTALL PLUGIN validate_password;
               ```
          2. Now, set the empty password successfully:
             ```sql
             ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
             FLUSH PRIVILEGES;
             ```
          3. *(Optional)* Re-enable the password validation tool if you plan on creating other users:
             * *For MySQL 8.0+*:
               ```sql
               INSTALL COMPONENT 'file://component_validate_password';
               ```
             * *For MySQL 5.7*:
               ```sql
               INSTALL PLUGIN validate_password SONAME 'validate_password.so';
               ```
          4. Exit the MySQL prompt:
             ```sql
             EXIT;
             ```
          *You can now connect without a password:* `mysql -u root`

        * **Option B: Root WITH a password**:
          ```sql
          ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_secure_password';
          FLUSH PRIVILEGES;
          EXIT;
          ```
          *You can now connect with the password:* `mysql -u root -p`
        * **Option C: Passwordless CLI using client configuration (`~/.my.cnf`)**:
          If you want to connect to MySQL as `root` without typing credentials or using `sudo` every time, you can create a user-specific configuration file:
          1. Create the configuration file in your home directory:
             ```bash
             nano ~/.my.cnf
             ```
          2. Add the following content:
             ```ini
             [client]
             user=root
             password=""
             ```
          3. Set secure permissions on the file (required by MySQL, otherwise it will be ignored):
             ```bash
             chmod 600 ~/.my.cnf
             ```
          *You can now connect by simply typing:* `mysql`

