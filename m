From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: strip is running out of memory on m68k (Haskell)
Date: Tue, 31 Jul 2018 14:42:23 +0200
Message-ID: <26510258-0207-9e43-0815-f6a56b8f38c3@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Content-Language: en-US
Resent-Message-ID: <NnWZMLMKR_B.A.qYF.ClFYbB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/26510258-0207-9e43-0815-f6a56b8f38c3@physik.fu-berlin.de
To: Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi!

We have recently made lots of progress fixing bugs on m68k both in various
as well as QEMU. This has lead to the list of successfully built packages
to over 11.500 - Debian/m68k never built so many packages before.

Now, there are a few things that still need to work and one of them is
binutils' strip command which is bailing out for a very low number of
Haskell packages [1]:

debian/hlibrary.setup copy --builddir=dist-ghc --destdir=debian/tmp-inst-ghc
Installing library in debian/tmp-inst-ghc/usr/lib/haskell-packages/ghc/lib/m68k-linux-ghc-8.2.2/criterion-1.3.0.0-CVIsDHnXrrBAzasYPdPd4j
Installing executable criterion-report in debian/tmp-inst-ghc/usr/bin
Warning: The directory debian/tmp-inst-ghc/usr/bin is not in the system search
path.
/usr/bin/strip:debian/tmp-inst-ghc/usr/bin/criterion-report: memory exhausted
make: *** [/usr/share/cdbs/1/class/hlibrary.mk:188: debian/tmp-inst-ghc] Error 1
dpkg-buildpackage: error: fakeroot debian/rules binary-arch subprocess returned exit status 2

Since I don't think that we have any actual memory limitations on qemu-user (as
compared to qemu-system), this issue might be a result of strip having a hardwired
maximum buffer size for stripping binaries.

Does anyone know more? If yes, could we patch strip to allow larger binaries?

Adrian

> [1] https://buildd.debian.org/status/fetch.php?pkg=haskell-criterion&arch=m68k&ver=1.3.0.0-1&stamp=1533028852&raw=0
