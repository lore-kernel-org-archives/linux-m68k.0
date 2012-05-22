From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: What ISA hardware is integrated into m68k bridges
Date: Tue, 22 May 2012 09:52:18 -0400
Message-ID: <4FBB9A12.8000101@windriver.com>
References: <20120520163105.GC21177@windriver.com> <CAOmrzk+hWvu8L51JXogwj6A=KFsj_nu_UX2qS_HABxyks-8srw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:55730 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752960Ab2EVNwh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 22 May 2012 09:52:37 -0400
In-Reply-To: <CAOmrzk+hWvu8L51JXogwj6A=KFsj_nu_UX2qS_HABxyks-8srw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, Alan Cox <alan@linux.intel.com>

On 12-05-20 05:10 PM, Michael Schmitz wrote:
> Paul,
> 
> On Mon, May 21, 2012 at 4:31 AM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> Hi Geert,
>>
>> A discussion is underway with respect to the future of the various ISA
>> drivers[1], and Alan suggested checking with the m68k folks:
>>
>>  Check with the M68K people however. 3c501 won't matter to them but I'm
>>  not sure which of the other chips ended up on Amiga ISA bridges. I know
>>  NE2000 clones did.
>>
>> I know you've currently got that "almost ne2k" driver that runs IRQ-less.  Are
>> there other "ISA-like" onboard devices in the M68k harware scope that rely on
>> existing (x86) ISA drivers?
> 
> Not sure it's still considered ISA based in its current state, but the
> smc91x is another one used on Atari. That one's got an interrupt
> though, and I had confirmation that it works fine from a user just a
> few days ago.
> 
> You mentioned the IRQ-less ne2k already - making that one run on
> netpoll has stalled for now because I'm too busy at work. Neither
> driver has been merged mainstream yet.
> 
> Most of the Amiga cards are 8390 or Lance based IIRC (there's a Lance
> based Atari driver as well!) but these do not share code with the ISA
> Lance drivers as far as I can see. Geert may know more details.

Thanks Michael for the level headed on-topic reply, I appreciate
it.  That smc is used by 20-odd arm defconfigs, so it really isn't
valid to consider it as a stand alone ISA card used just by older
x86 hardware with ISA bus.  In fact I'm not sure it ever shipped as
a standalone ISA card...

Paul.

> 
> Cheers,
> 
>   Michael
