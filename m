From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari ROM port ISA
Date: Sun, 22 Apr 2012 03:44:10 +1200
Message-ID: <4F92D5CA.1000205@gmail.com>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg> <4F8BCF49.4060109@gmail.com> <20120417050500.GA14387@cynthia.pants.nu> <loom.20120419T165359-796@post.gmane.org> <CAOmrzkKRE2SsJM532itFRd5fG2Bx-wxfno=ftb0SjXC1vWkbgQ@mail.gmail.com> <Pine.BSM.4.64L.1204192041320.27380@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:39446 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938Ab2DUHtJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 21 Apr 2012 03:49:09 -0400
Received: by pbcun15 with SMTP id un15so1897619pbc.19
        for <linux-m68k@vger.kernel.org>; Sat, 21 Apr 2012 00:49:09 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1204192041320.27380@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, linux-m68k@vger.kernel.org

Hi Thorsten,
>> Thanks for explaining this to me - to be honest I've never cared too
>> much about ISA and friends.
> No problem. (I practically grew up with them, so while the knowledge
> isn=E2=80=99t fresh, some is there.)
I grew up without computers - the first I used was a TR440 mainframe :-=
)
>> I'll check the layout - my guess would be that there's no memory
>> read/write selects wired up on the adapter. The RTL8019 doesn't need
>> them, the ISP1160  on the NetUSBee doesn't need them either.
> I=E2=80=99d guess the same. You=E2=80=99d need them for things like a=
n ISA graphics
> card, but not (most) I/O devices.
Only /IOW and /IOR are wired up. Only A0 through A4 are wired up (from=20
A9-A13).
>> If someone ever comes up with a way to hook up a fully featured ISA
>> slot to the ROM port (mapping ports 0x00 to 0x7f to IO and above to
>> mem access should be possible) we might revisit the code. For now,
>> anything except for 8 bit IO can be turned into dummy functions or
>> compile warnings.
> Might be nice, if possible. But for now, that would indeed be
> the way to go (and clean up code).
I've had a look at the NetUSBee docs and see that the USB part of it=20
does require 8 bit writes but little endian 16 bit reads. So we will=20
need to retain the 16 bit reads for potential USB support there.

Cheers,

   Michael
