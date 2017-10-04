From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Kernel 4.13 is broken on m68k
Date: Thu, 05 Oct 2017 00:43:32 +0200
Message-ID: <874lre7cvf.fsf@linux-m68k.org>
References: <9f2342b1-af46-27e9-e38d-9485d1719c07@physik.fu-berlin.de>
        <a10e5dde-b3a6-a525-d403-154c16e60b35@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:52324 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751171AbdJDWnf (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 4 Oct 2017 18:43:35 -0400
In-Reply-To: <a10e5dde-b3a6-a525-d403-154c16e60b35@physik.fu-berlin.de> (John
        Paul Adrian Glaubitz's message of "Wed, 4 Oct 2017 23:56:38 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Okt 04 2017, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:

> Ok, switching just the initrd to the one from 4.13 while keeping the 4.12 kernel
> image results in the same crash. Maybe the glibc is broken?

It's busybox.  Try setting BUSYBOX=n in
/etc/initramfs-tools/initramfs.conf (or deinstall busybox).

$ busybox ash -c 'echo ${x}'
ash: syntax error: missing '}'

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
