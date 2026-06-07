# Comprehensive Guide: Installing and Configuring Apache, MySQL, and PHP (LAMP Stack) on Ubuntu

## Table of Contents
1. [Introduction & Prerequisites](#1-introduction--prerequisites)
2. [Step 1: Installing and Configuring Apache Web Server](#2-step-1-installing-and-configuring-apache-web-server)
3. [Step 2: Installing and Configuring MySQL Server](#3-step-2-installing-and-configuring-mysql-server)
4. [Step 3: Installing PHP and Extensions (Any Version 5.6 - 8.4)](#4-step-3-installing-php-and-extensions-any-version-56---84)
5. [Step 4: Managing and Switching PHP Versions](#5-step-4-managing-and-switching-php-versions)
6. [Step 5: Installing Composer (PHP Dependency Manager)](#6-step-5-installing-composer-php-dependency-manager)
7. [Step 6: Installing Node.js and NPM](#7-step-6-installing-nodejs-and-npm)
8. [Step 7: Verifying the Installation](#8-step-7-verifying-the-installation)
9. [Step 8: File Permissions & Directory Structure](#9-step-8-file-permissions--directory-structure)
10. [Troubleshooting & Log Locations](#10-step-9-troubleshooting--log-locations)
    - [9.1 Log Locations](#91-log-locations)
    - [9.2 Common Issues](#92-common-issues)
      - [MySQL Access Denied for 'root'@'localhost'](#mysql-access-denied)

---

### 1. Introduction & Prerequisites
This guide provides a detailed walkthrough for setting up a full LAMP (Linux, Apache, MySQL, PHP) stack on an Ubuntu server. It covers multi-version PHP installation (PHP 7.4 and PHP 8.3) and instructions on how to switch between them for both command-line usage and the Apache web server.

**Requirements:**
- A system running Ubuntu (20.04 LTS, 22.04 LTS, or 24.04 LTS).
- A user account with `sudo` administrative privileges.
- An active internet connection.

---

### 2. Step 1: Installing and Configuring Apache Web Server
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

### 3. Step 2: Installing and Configuring MySQL Server
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

### 4. Step 3: Installing PHP and Extensions (Any Version 5.6 - 8.4)
To support multiple PHP versions, add the Ondřej Surý PPA repository. This repository provides pre-compiled packages for older and newer PHP versions on Ubuntu.

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

---

### 5. Step 4: Managing and Switching PHP Versions
If both PHP versions are installed, you must manage which version is active for CLI commands and which is active in Apache.

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

---

### 6. Step 5: Installing Composer (PHP Dependency Manager)
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

### 7. Step 6: Installing Node.js and NPM
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

### 8. Step 7: Verifying the Installation

#### 7.1 Verify Web Server and PHP Integration
1. Create a PHP file in Apache's default web directory (`/var/www/html/`):
   ```bash
   sudo echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
   ```
2. Open your web browser and navigate to `http://your_server_ip/info.php` or `http://localhost/info.php`.
3. You should see a detailed configuration page detailing the active PHP version.
4. **IMPORTANT SECURITY STEP**: Leaving `info.php` public poses a security risk because it displays details about your server's configuration to anyone. Delete it after testing:
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

### 9. Step 8: File Permissions & Directory Structure
For security and convenience, manage owner permissions inside the `/var/www/html` folder.

#### 8.1 Key Paths & Directories
* **Web Document Root**: `/var/www/html/`
* **Apache Configuration Root**: `/etc/apache2/`
* **Apache Virtual Hosts Configuration**: `/etc/apache2/sites-available/`
* **PHP Configuration (`php.ini`)**:
  - PHP 7.4 (Apache): `/etc/php/7.4/apache2/php.ini`
  - PHP 7.4 (CLI): `/etc/php/7.4/cli/php.ini`
  - PHP 8.3 (Apache): `/etc/php/8.3/apache2/php.ini`
  - PHP 8.3 (CLI): `/etc/php/8.3/cli/php.ini`

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

### 10. Step 9: Troubleshooting & Log Locations
If you encounter issues, logs are the first place to check.

#### 9.1 Log Locations
* **Apache Access Log**: `/var/log/apache2/access.log`
* **Apache Error Log**: `/var/log/apache2/error.log`
* **MySQL Error Log**: `/var/log/mysql/error.log`

#### 9.2 Common Issues
1. **Port 80/443 already in use**:
   - Check if another service (like Nginx) is running: `sudo systemctl status nginx` or `sudo lsof -i :80`.
2. **PHP code displays as plain text**:
   - The PHP Apache module might not be enabled. Run `sudo a2enmod php8.3` (or `php7.4`) and restart Apache: `sudo systemctl restart apache2`.
3. **Database connection refused**:
   - Verify that the MySQL service is running: `sudo systemctl status mysql`.
   - Double check database credentials and hostname in your application.
4. **Node.js global installation permission errors (EACCES)**:
   - When using the NodeSource installation, running `npm install -g <package>` can fail with permission errors. You can resolve this by using `sudo npm install -g <package>`, or by using NVM (Option 2) which handles environments in user space and avoids `sudo` entirely.
5. **Node.js Port already in use (EADDRINUSE)**:
   - If you see `Error: listen EADDRINUSE: address already in use :::3000`, check which process is holding the port: `sudo lsof -i :3000`. Stop the process, or select a different port for your server.
6. <a id="mysql-access-denied"></a>**Access denied for user 'root'@'localhost' (MySQL Error)**:
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

