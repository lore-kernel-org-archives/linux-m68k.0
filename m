From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Kernel 4.13 is broken on m68k
Date: Thu, 5 Oct 2017 00:28:57 +0200
Message-ID: <e1a2d1de-162f-6f79-7884-2f246090e300@physik.fu-berlin.de>
References: <9f2342b1-af46-27e9-e38d-9485d1719c07@physik.fu-berlin.de>
 <a10e5dde-b3a6-a525-d403-154c16e60b35@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:32894 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750951AbdJDW27 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 4 Oct 2017 18:28:59 -0400
In-Reply-To: <a10e5dde-b3a6-a525-d403-154c16e60b35@physik.fu-berlin.de>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Debian m68k <debian-68k@lists.debian.org>

On 10/04/2017 11:56 PM, John Paul Adrian Glaubitz wrote:
> On 10/04/2017 11:49 PM, John Paul Adrian Glaubitz wrote:
>> I can trigger the problem by switching between 4.12 and 4.13, 4.12 is fin while 4.13 is broken.
> 
> Ok, switching just the initrd to the one from 4.13 while keeping the 4.12 kernel
> image results in the same crash. Maybe the glibc is broken?

I have tracked it down to busybox which was recently upgraded to 1.27.2 in Debian [1].

busybox_1:1.22.0-17:

root@pacman:~/rootskel/src/sbin# ls -l /root/sh
lrwxrwxrwx 1 root root 12 Oct  5 00:18 /root/sh -> /bin/busybox
root@pacman:~/rootskel/src/sbin# /root/sh ./reopen-console-linux
./reopen-console-linux: exec: line 74: /sbin/steal-ctty: not found
root@pacman:~/rootskel/src/sbin#

Despite the error messages, the above behavior is correct.

busybox_1:1.27.2-1:

root@pacman:~/rootskel/src/sbin# /root/sh ./reopen-console-linux
./reopen-console-linux: line 74: syntax error: unterminated quoted string
root@pacman:~/rootskel/src/sbin#

Now we need to find out whether busybox was either miscompiled or
whether the new upstream version is broken. I will recompile the
old version with gcc-7 next.

Adrian

> [1] https://packages.qa.debian.org/b/busybox/news/20170917T171907Z.html

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
