# Apache VirtualHost Management & Automation Guide

A comprehensive guide for managing Apache VirtualHosts automatically on Linux (Ubuntu/Debian) with multi-version PHP-FPM support.

---

## 📋 Overview

This guide provides a shell script and step-by-step instructions to automate Apache VirtualHost configuration.

The automation script (`vhost.sh`) performs the following tasks:
1. Creates the Apache site configuration at `/etc/apache2/sites-available/<domain>.conf`.
2. Creates the `DocumentRoot` directory if it does not exist.
3. Sets appropriate file permissions (`755`) and directory ownership.
4. Generates a test `index.php` file for immediate verification.
5. Enables required Apache modules (`rewrite`, `proxy_fcgi`, `setenvif`).
6. Configures PHP-FPM integration for the specified PHP version.
7. Enables the VirtualHost site (`a2ensite`).
8. Verifies Apache syntax (`apachectl configtest`).
9. Gracefully reloads Apache (`systemctl reload apache2`).
10. Automatically maps the domain to `127.0.0.1` in `/etc/hosts`.

---

## ⚙️ System-Wide Setup Instructions

Follow these steps to install `vhost.sh` system-wide so it can be executed from any directory using `sudo vhost.sh` or `sudo vhost`.

### Step 1: Save the Script to a Workspace File
Create a file named `vhost.sh` in your project or home folder (e.g., `/var/www/vhost.sh`).

### Step 2: Make the Script Available System-Wide
Copy the script to `/usr/local/bin/` and grant execution permissions:

```bash
# Copy script to /usr/local/bin
sudo cp /var/www/vhost.sh /usr/local/bin/vhost.sh

# Make the script executable
sudo chmod +x /usr/local/bin/vhost.sh

# (Optional) Create a shortcut 'vhost' without the .sh extension
sudo ln -sf /usr/local/bin/vhost.sh /usr/local/bin/vhost
```

### Step 3: Verify Installation
Verify that the command is available system-wide:

```bash
sudo vhost.sh --help
# or
sudo vhost --help
```

---

## 📜 Full Script (`vhost.sh`)

Below is the complete, production-ready script with English log messages and parameter support:

```bash
#!/bin/bash

# =========================================================
# Apache VirtualHost Automation Script
# =========================================================
# Description: Automates Apache VirtualHost setup with PHP-FPM support
# Usage:
#   sudo vhost.sh [OPTIONS]
# =========================================================

set -e  # Exit immediately if a command exits with a non-zero status

# ---------- Default Values ----------
DOMAIN="example.test"
DOC_ROOT=""            # Auto-generated if empty: /var/www/<domain>/public
PHP_VERSION="8.3"
NO_HOSTS_ENTRY=false    # If true, skips adding entry to /etc/hosts

# ---------- Usage / Help Function ----------
usage() {
  cat <<EOF
Usage: sudo $0 [OPTIONS]

Options:
  -d, --domain DOMAIN       Domain name (default: example.test)
  -r, --docroot PATH        DocumentRoot path (default: /var/www/<domain>/public)
  -p, --php VERSION         PHP-FPM version (default: 8.3)
      --no-hosts            Do not add domain entry to /etc/hosts
  -h, --help                Display this help message

Examples:
  sudo $0 -d myapp.test -r /var/www/myapp.test/public -p 8.2
  sudo $0 -d shop.test --php 8.3
  sudo $0 -d example.test -r /var/www/example.test/public -p 8.3
EOF
  exit 0
}

# ---------- Argument Parsing ----------
while [[ $# -gt 0 ]]; do
  case "$1" in
    -d|--domain)
      DOMAIN="$2"
      shift 2
      ;;
    -r|--docroot)
      DOC_ROOT="$2"
      shift 2
      ;;
    -p|--php)
      PHP_VERSION="$2"
      shift 2
      ;;
    --no-hosts)
      NO_HOSTS_ENTRY=true
      shift
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "❌ Unknown option: $1"
      usage
      ;;
  esac
done

# Set default DocumentRoot if not provided
if [ -z "$DOC_ROOT" ]; then
  DOC_ROOT="/var/www/${DOMAIN}/public"
fi

CONF_FILE="/etc/apache2/sites-available/${DOMAIN}.conf"

# ---------- Root Check ----------
if [ "$EUID" -ne 0 ]; then
  echo "❌ This script must be run with root / sudo privileges."
  echo "   Example usage: sudo $0 -d ${DOMAIN}"
  exit 1
fi

echo "🚀 Starting Apache VirtualHost setup for: ${DOMAIN}"

# ---------- 1. DocumentRoot Setup ----------
if [ ! -d "$DOC_ROOT" ]; then
  echo "📁 Creating DocumentRoot directory: ${DOC_ROOT}"
  mkdir -p "$DOC_ROOT"
  chown -R "${SUDO_USER:-www-data}:www-data" "/var/www/${DOMAIN}"
  chmod -R 755 "/var/www/${DOMAIN}"

  # Create test index file for verification
  cat > "${DOC_ROOT}/index.php" <<EOF
<?php
echo "✅ Apache VirtualHost for ${DOMAIN} is working successfully!";
EOF
else
  echo "📁 DocumentRoot already exists, skipping creation: ${DOC_ROOT}"
fi

# ---------- 2. VirtualHost Configuration Creation ----------
echo "📝 Creating Apache configuration file: ${CONF_FILE}"

cat > "$CONF_FILE" <<EOF
<VirtualHost *:80>
    ServerName ${DOMAIN}
    ServerAlias *.${DOMAIN}
    DocumentRoot ${DOC_ROOT}

    <Directory ${DOC_ROOT}>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/${DOMAIN}-error.log
    CustomLog \${APACHE_LOG_DIR}/${DOMAIN}-access.log combined

    <FilesMatch \.php\$>
        SetHandler "proxy:unix:/run/php/php${PHP_VERSION}-fpm.sock|fcgi://localhost"
    </FilesMatch>
</VirtualHost>
EOF

echo "✅ Apache configuration file created successfully."

# ---------- 3. Enable Required Apache Modules ----------
echo "🔧 Enabling required Apache modules..."
a2enmod rewrite >/dev/null 2>&1 || true
a2enmod proxy_fcgi setenvif >/dev/null 2>&1 || true

# ---------- 4. Enable Site ----------
echo "🔗 Enabling VirtualHost site: ${DOMAIN}.conf"
a2ensite "${DOMAIN}.conf" >/dev/null

# ---------- 5. Test Apache Configuration Syntax ----------
echo "🧪 Testing Apache configuration syntax..."
if ! apachectl configtest; then
  echo "❌ Syntax error detected in Apache configuration! Reload aborted."
  exit 1
fi

# ---------- 6. Reload Apache Service ----------
echo "♻️  Reloading Apache web server..."
systemctl reload apache2

# ---------- 7. Update /etc/hosts ----------
if [ "$NO_HOSTS_ENTRY" = true ]; then
  echo "🌐 Option --no-hosts specified. Skipping /etc/hosts update."
elif ! grep -qE "^\s*127\.0\.0\.1\s+${DOMAIN}(\s|$)" /etc/hosts; then
  echo "🌐 Adding domain entry to /etc/hosts..."
  echo "127.0.0.1   ${DOMAIN}" >> /etc/hosts
else
  echo "🌐 Domain entry already exists in /etc/hosts."
fi

echo ""
echo "🎉 Setup complete! Access your site at: http://${DOMAIN}"
echo "   DocumentRoot: ${DOC_ROOT}"
echo "   Config file : ${CONF_FILE}"
```

---

## 🚀 Usage & Example Commands

### 1. Primary Example (Custom Domain, DocumentRoot, and PHP Version)
To setup `example.test` pointing to `/var/www/example.test/public` using PHP 8.3:

```bash
sudo vhost.sh -d example.test -r /var/www/example.test/public -p 8.3
```

If you created the `vhost` shortcut in `/usr/local/bin`:

```bash
sudo vhost -d example.test -r /var/www/example.test/public -p 8.3
```

### 2. Basic VirtualHost Setup (Default Options)
Creates a site for `example.test` using PHP 8.3 and default directory path `/var/www/example.test/public`:

```bash
sudo vhost.sh
```

### 3. Setup Framework Projects (Laravel / Symfony / WordPress)
```bash
# Laravel Project (PHP 8.3)
sudo vhost.sh -d myapp.test -r /var/www/myapp/public -p 8.3

# Laravel Project (PHP 8.2)
sudo vhost.sh -d shop.test -r /var/www/shop/public -p 8.2

# WordPress Project (Root directory without /public)
sudo vhost.sh -d blog.test -r /var/www/blog.test -p 8.1

# Legacy PHP 7.4 Project
sudo vhost.sh -d legacy-shop.test -r /var/www/legacy-shop/public -p 7.4
```

### 4. Skip Modifying `/etc/hosts`
If you manage local DNS externally or already modified `/etc/hosts`:

```bash
sudo vhost.sh -d myapp.test -r /var/www/myapp/public -p 8.3 --no-hosts
```

---

## 🛠️ Useful Management Commands

| Action | Command |
| :--- | :--- |
| **Disable a VirtualHost** | `sudo a2dissite domain.test.conf && sudo systemctl reload apache2` |
| **Enable a VirtualHost** | `sudo a2ensite domain.test.conf && sudo systemctl reload apache2` |
| **Check Apache Syntax** | `sudo apachectl configtest` |
| **View VirtualHost Error Logs** | `sudo tail -f /var/log/apache2/example.test-error.log` |
| **Check PHP-FPM Service Status** | `sudo systemctl status php8.3-fpm` |
