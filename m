From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: falconide not registering device nodes
Date: Sun, 3 Sep 2017 12:38:28 +0200
Message-ID: <cbac2923-ea1e-47f2-3ac7-88a697b786d9@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Content-Language: en-US
Resent-Message-ID: <aoXoS_VVtJN.A.y9D.6u9qZB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/cbac2923-ea1e-47f2-3ac7-88a697b786d9@physik.fu-berlin.de
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Debian m68k <debian-68k@lists.debian.org>
List-Id: linux-m68k@vger.kernel.org

Hi!

I'm currently polishing debian-installer on m68k [1]. For that, I'm
testing on various emulators like qemu-m68k and Aranym. Testing on the
latter revealed a problem with falconide, namely device nodes not
being created under /dev meaning the cdrom-detect module in debian-installer
won't be able to find the CD-ROM drive [2].

Can anyone give me a hint what might be missing here? Do we need to implement
modlias_show and _hotplug [3,4] for falconide [5] or are we missing something else?

If you want to test this yourself, please use the kernel and initrd from [6]
to boot debian-installer and you must "debian-installer/framebuffer=false"
pass on the kernel command line.

Adrian

> [1] https://people.debian.org/~glaubitz/debian-cd/2017-09-03/debian-9.0-m68k-NETINST-1.iso
> [2] https://people.debian.org/~glaubitz/falconide.png
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git/commit/?id=36128d204b81c099b5779771127a5546eac549c9
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git/commit/?id=5bde2c9be701c4583f0a9243bd46590ec401bfba
> [5] https://github.com/torvalds/linux/blob/master/drivers/ide/falconide.c
> [6] https://people.debian.org/~glaubitz/debian-cd/debian-installer-images_20170828_m68k.tar.gz
