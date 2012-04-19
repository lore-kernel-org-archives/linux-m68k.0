From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari ROM port ISA
Date: Fri, 20 Apr 2012 08:38:15 +1200
Message-ID: <CAOmrzkKRE2SsJM532itFRd5fG2Bx-wxfno=ftb0SjXC1vWkbgQ@mail.gmail.com>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>
	<4F8BCF49.4060109@gmail.com>
	<20120417050500.GA14387@cynthia.pants.nu>
	<loom.20120419T165359-796@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:52695 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751396Ab2DSUod convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 19 Apr 2012 16:44:33 -0400
Received: by pbcun15 with SMTP id un15so220943pbc.19
        for <linux-m68k@vger.kernel.org>; Thu, 19 Apr 2012 13:44:33 -0700 (PDT)
In-Reply-To: <loom.20120419T165359-796@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Hi Thorsten,

On Fri, Apr 20, 2012 at 3:00 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Brad Boyer <flar <at> allandria.com> writes:
>
>> On Mon, Apr 16, 2012 at 07:50:33PM +1200, Michael Schmitz wrote:
>
>> > >So ISA memory space accesses (isa_readX()) are implemented the sa=
me as ISA
> I/O
>> > >space accesses? That can't work. Or are they not supported?
>> >
>> > There's no distinct 'IO' or 'memory' space on the ROM port adapter=
,
>> > it's all memory mapped on ROM port addresses. How does access to I=
SA
>> > card mem regions work on ix86? Different address range, or differe=
nt
>> > instructions?
>>
>> The real x86 instruction set has separate instructions to access any
>> ports in the IO space (in and out). The instruction also has an acce=
ss
>
> This maps to different lines being driven on the ISA side, see:
> https://upload.wikimedia.org/wikipedia/commons/3/3d/XT_Bus_pins.png
>
> There are I/O read/write and MEM read/write lines (B11=E2=80=A5B14).
> So you need these that are actually wired up in the adapter.

Thanks for explaining this to me - to be honest I've never cared too
much about ISA and friends.

I'll check the layout - my guess would be that there's no memory
read/write selects wired up on the adapter. The RTL8019 doesn't need
them, the ISP1160  on the NetUSBee doesn't need them either.

If someone ever comes up with a way to hook up a fully featured ISA
slot to the ROM port (mapping ports 0x00 to 0x7f to IO and above to
mem access should be possible) we might revisit the code. For now,
anything except for 8 bit IO can be turned into dummy functions or
compile warnings.

Cheers,

  Michael
