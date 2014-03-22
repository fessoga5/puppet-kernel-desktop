# vim: sts=4 ts=4 sw=4 expandtab autoindent
#
#INSTALL SKYPE ON DESKTOP
#
class puppet-kernel-desktop {
    wget::fetch { 'linux-header':
        source      => 'http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.10.28-saucy/linux-headers-3.10.28-031028-generic_3.10.28-031028.201401251235_amd64.deb',
        destination => '/root/linux-header-3.10.deb',
        timeout     => 0,
        verbose     => false,
        redownload  => false,
    }

    package {"linux-headers-3.10.28-031028-generic":
        provider => dpkg,
        ensure   => installed,
        source   => "/root/linux-header-3.10.deb",
        require  => Wget::Fetch['linux-header']
    }

    wget::fetch { 'linux-header-all':
        source      => 'http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.10.28-saucy/linux-headers-3.10.28-031028_3.10.28-031028.201401251235_all.deb',
        destination => '/root/linux-header-3.10.all.deb',
        timeout     => 0,
        verbose     => false,
    }

    package {"linux-headers-3.10.28-031028":
        provider => dpkg,
        ensure   => installed,
        source   => "/root/linux-header-3.10.all.deb",
        require  => Wget::Fetch['linux-header-all']
    }

    wget::fetch { 'linux-image':
        source      => 'http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.10.28-saucy/linux-image-3.10.28-031028-generic_3.10.28-031028.201401251235_amd64.deb',
        destination => '/root/linux-image-3.10.28.deb',
        timeout     => 0,
        verbose     => false,
    }

    package {"linux-image-3.10.28-031028-generic":
        provider => dpkg,
        ensure   => installed,
        source   => "/root/linux-image-3.10.28.deb",
        require  => Wget::Fetch['linux-image']
    }
}
