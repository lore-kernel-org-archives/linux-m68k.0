From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: CONFIG_DEVTMPFS_MOUNT
Date: Sun, 25 Jan 2015 11:54:32 +0100
Message-ID: <m2egqj9llj.fsf@linux-m68k.org>
References: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
	<Pine.BSM.4.64L.1501181206220.1142@herc.mirbsd.org>
	<CAMuHMdWHdr8-Wi2D6APt-uHVnNwojq-wgdTWbp1ZR7uErKgUcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:58203 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752656AbbAYKyk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Jan 2015 05:54:40 -0500
In-Reply-To: <CAMuHMdWHdr8-Wi2D6APt-uHVnNwojq-wgdTWbp1ZR7uErKgUcg@mail.gmail.com>
	(Geert Uytterhoeven's message of "Sun, 25 Jan 2015 11:34:34 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, Stefan Niestegge <beetle@atari.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On Sun, Jan 18, 2015 at 1:07 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
>> Geert Uytterhoeven dixit:
>>
>>>While init on Beetle's system complained about not being able to open
>>>tty* with CONFIG_DEVTMPFS_MOUNT disabled, enabling CONFIG_DEVTMPFS_MOUNT
>>>broke remote login using ssh on my ARAnyM:
>>
>> Hm, interesting.
>>
>> If you do not run udev, you may need the following lines in /etc/rc.local:
>>
>> (test -e /dev/fd || ln -s /proc/self/fd /dev/fd || :)
>> (test -e /dev/stdin || ln -s /proc/self/fd/0 /dev/stdin || :)
>> (test -e /dev/stdout || ln -s /proc/self/fd/1 /dev/stdout || :)
>> (test -e /dev/stderr || ln -s /proc/self/fd/2 /dev/stderr || :)
>
> I don't have these, but the system doesn't seem to miss them ;-)

Unless you are using process substitution in bash.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
