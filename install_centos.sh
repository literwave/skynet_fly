#!/bin/bash

# 安装编译skynet依赖的一些库
install_dependencies() {
	yum install -y git gcc autoconf automake make libtool curl centos-release-scl devtoolset-9-gcc* perl* cpan
	# centos8以上 dnf -y group install "Development Tools"
}

# 安装Perl
install_perl() {
	cd "3rd/perl" || exit
	(
		source /opt/rh/devtoolset-9/enable

		./Configure -des -Dprefix=$HOME/localperl
		make
		make test
		make install
	)
	sudo mv /usr/bin/perl /usr/bin/perl.old && echo "Moved perl successfully" || {
		echo "Failed to move perl"
		exit 1
	}
	sudo cp -f $HOME/localperl/bin/perl /usr/local/bin/perl && echo "Copied perl successfully" || {
		echo "Failed to copy perl"
		exit 1
	}
	sudo ln -s /usr/local/bin/perl /usr/bin/perl && echo "Created symlink successfully" || {
		echo "Failed to create symlink"
		exit 1
	}

	echo "Perl $perl_version has been installed and linked successfully."
	cd ..
}

# 编译openssl-3.3.2
install_openssl() {
	# 获取脚本当前目录
	CURRENT_DIR="$(dirname "$BASH_SOURCE")"
	ABSOLUTE_PATH="$(realpath "$CURRENT_DIR/3rd/openssl")"
	cd "3rd/openssl" || exit
	(

		echo "ABSOLUTE_PATH:$ABSOLUTE_PATH"
		# 激活 devtoolset-9
		source /opt/rh/devtoolset-9/enable && echo "Enabled devtoolset-9 successfully" || {
			echo "Failed to enable devtoolset-9"
			exit 1
		}

		# 配置 OpenSSL
		./config --prefix="$ABSOLUTE_PATH" -fPIC no-shared && echo "OpenSSL configured successfully" || {
			echo "OpenSSL configuration failed"
			exit 1
		}

		# 编译
		make && echo "Make completed successfully" || {
			echo "Make failed"
			exit 1
		}

		# 安装
		make install && echo "OpenSSL installed successfully" || {
			echo "Make install failed"
			exit 1
		}

		echo "OpenSSL installed successfully!"

	)
	cd ..
}

# 编译zlib-1.3.1
install_zlib() {
	cd "3rd/zlib" || exit
	(
		source /opt/rh/devtoolset-9/enable
		gcc -c -fPIC -O2 ./*.c
		ar rcs libz.a
	)
	cd ..
}

# 编译
compile() {
	(
		source /opt/rh/devtoolset-9/enable
		make linux
	)
}

# 主程序
main() {
	install_dependencies
	install_perl
	install_openssl
	install_zlib
	compile
}

main
