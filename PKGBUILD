#Mantainer: sulfur.fff@gmail.com

_pkgbase=disable-hyperthreading
pkgname="$_pkgbase-git"
pkgver=1
pkgrel=1
pkgdesc="Service that disables the hyperthreading cores"
arch=('any')
url="https://github.com/sir-farfan/disable-hyperthreading"
license=('GPL2')
depends=('systemd')
makedepends=('git')
conflicts=("$_pkgbase")
source=('disable-hyperthreading::git+https://github.com/sir-farfan/disable-hyperthreading.git')
md5sums=('SKIP')

package() {
        cd disable-hyperthreading
        mkdir -p $pkgdir/{etc/systemd/system,usr/local/sbin}
        cp disable-ht.service $pkgdir/etc/systemd/system/
        cp disableht.sh $pkgdir/usr/local/sbin/
        chmod 555 $pkgdir/etc/systemd/system/disable-ht.service
        chmod 755 $pkgdir/usr/local/sbin/disableht.sh
        echo Enable with: systemctl enable disable-ht
}

pkgver() {
        cd disable-hyperthreading
        echo $(git rev-list --count master)
}
