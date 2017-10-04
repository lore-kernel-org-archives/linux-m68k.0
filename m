From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Kernel 4.13 is broken on m68k
Date: Wed, 4 Oct 2017 23:49:53 +0200
Message-ID: <9f2342b1-af46-27e9-e38d-9485d1719c07@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:44710 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750951AbdJDVt5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 4 Oct 2017 17:49:57 -0400
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Debian m68k <debian-68k@lists.debian.org>

Hi!

While working on updated installation images for m68k, I ran into a serious
problem with shell-scripts which makes booting Linux on m68k impossible.

With debian-installer, the problem manifests with the script /sbin/reopen-console
which fails with:

/sbin/reopen-console: line 74: syntax error: unterminated quoted string

with reopen-console coming from [1].

In order to rule out a problem with debian-installer, I dist-upgraded an
existing system which also upgraded the kernel from 4.12 to 4.13.

And, indeed, after upgrading the system, the boot fails with:

[    0.520000] ADB mouse at 3, handler 1
[    0.520000]
[    0.520000] input: ADB mouse as /devices/virtual/input/input1
[    0.520000] adb: finished probe task...
Loading, please wait...
/init: line 69: syntax error: missing '}'
[    0.610000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000200
[    0.610000]
[    0.610000] CPU: 0 PID: 1 Comm: init Not tainted 4.13.0-1-m68k #1 Debian 4.13.4-1
[    0.610000] Stack from 3dc35f48:
[    0.610000]         3dc35f48 00355ab1 0002c9bc 000002ff 0004bea0 0028ede6 00000000 3dc33390
[    0.610000]         0038643c 00000000 3dc35fb0 0002e63c 00322d0f 00000200 00000200 000000f7
[    0.610000]         00000000 00000000 00000000 00000000 d00b0140 d00b1404 c0154000 00000001
[    0.610000]         3dc35fa8 3dc35fa8 efe128c8 0002e9d4 00000200 00000002 0002e9e8 00000200
[    0.610000]         00002934 00000002 00000002 000000f7 00000000 00000000 d00b1008 efe128e0
[    0.610000]         d00b1408 000000f7 000000f7 00000000 0000c00b c04e0080
[    0.610000] Call Trace: [<0002c9bc>] panic+0xa6/0x22e
[    0.610000]  [<0004bea0>] up_read+0x0/0x6
[    0.610000]  [<0028ede6>] down_read+0x0/0x6
[    0.610000]  [<0002e63c>] do_exit+0x490/0x75c
[    0.610000]  [<0002e9d4>] SyS_exit_group+0x0/0x14
[    0.610000]  [<0002e9e8>] __wake_up_parent+0x0/0x24
[    0.610000]  [<00002934>] syscall+0x8/0xc
[    0.610000]  [<0000c00b>] mac_hwclk+0x501/0x62c
[    0.610000] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000200
[    0.610000]

I can trigger the problem by switching between 4.12 and 4.13, 4.12 is fin while 4.13 is broken.

Adrian

> [1] https://anonscm.debian.org/cgit/d-i/rootskel.git/tree/src/sbin/reopen-console-linux

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
