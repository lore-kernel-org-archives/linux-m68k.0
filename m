From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [git pull] m68k updates for 3.8
Date: Fri, 14 Dec 2012 22:04:51 +1000
Message-ID: <50CB15E3.8010902@westnet.com.au>
References: <1355476134.18402.5@driftwood>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1355476134.18402.5@driftwood>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Hi Rob,

On 12/14/2012 07:08 PM, Rob Landley wrote:
> On 12/13/2012 01:44:14 PM, Geert Uytterhoeven wrote:
>>     Hi Linus,
>>
>> The following changes since commit
>> 29594404d7fe73cd80eaa4ee8c43dcc53970c60e:
>>   Linus Torvalds (1):
>>         Linux 3.7
>
> Query: what's your test environment?
>
> I've been trying to get m68k linux to boot in qemu on and off for years
> (http://landley.net/aboriginal/bin/system-image-m68k.tar.bz2), but qemu
> seems to be missing bits (mmu stuff mostly, some work's being done at
> git://gitorious.org/qemu-m68k/qemu-m68k especially in the q800 branch,
> but it throws a double MMU fault during kernel boot).
>
> Somebody got one of my images to boot under aranym but they had to patch
> the kernel fairly extensively to add the emulated device support that
> emulator provided. It doesn't emulate real devices the way qemu does,
> but qemu doesn't fully emulate the processor (just coldfire in mainline)...

I use aranym for testing m68k. Though I don't really pound to heavily
on the devices. I really only cross-compile small systems for testing
on it.

Regards
Greg
