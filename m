From: Rob Landley <rob@landley.net>
Subject: Re: [git pull] m68k updates for 3.8
Date: Fri, 14 Dec 2012 15:48:20 -0600
Message-ID: <1355521700.18402.7__26523.2614278377$1355528176$gmane$org@driftwood>
References: <50CB15E3.8010902@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <50CB15E3.8010902@westnet.com.au> (from
	gregungerer@westnet.com.au on Fri Dec 14 06:04:51 2012)
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On 12/14/2012 06:04:51 AM, Greg Ungerer wrote:
> Hi Rob,
...
>> Somebody got one of my images to boot under aranym but they had to  
>> patch
>> the kernel fairly extensively to add the emulated device support that
>> emulator provided. It doesn't emulate real devices the way qemu does,
>> but qemu doesn't fully emulate the processor (just coldfire in  
>> mainline)...
> 
> I use aranym for testing m68k. Though I don't really pound to heavily
> on the devices. I really only cross-compile small systems for testing
> on it.

What kernel config do you use for aranym? I don't see an an aranym  
entry in
arch/m68k/configs, and I stopped using it precisely because it required  
several large patches to add emulated device support for everything  
from serial console to block devices. (There was a kernel upgrade, it  
broke, I cut a release without it. Pretty much the same reason I  
stopped using squashfs for a year or so until it finally got merged.)

I can poke Laurent Vivier about possibly getting the qemu-system-m68k  
and the q800 board emulation to work better if there's interest from  
anyone other than me. (I just checked and it dies at the same place it  
did last year: setting up the page tables. The MMU emulation ain't  
there, and I haven't got documentation for it.)

My interest is that my aboriginal linux setup builds the same system  
for a dozen different targets and then natively builds packages inside  
the emulator. This allows me to regression test if their behavior  
diverges, even from a cron job if I want to. From my viewpoint, the  
more targets the merrier.

(I don't care hugely about which board emulation I'm using, the point  
is to run a native root filesystem including a native toolchain and  
build stuff locally on the board. This requires at least 256 megs of  
memory in the emulated board for gcc 4.2 (more for newer versions), and  
ideally I want a virtual network card so I can hook up distcc to the  
cross compiler and move the heavy lifting of compilation outside the  
emulator without reintroducing the whole "keep track of two  
simultaneous build contexts" complexity of cross compiling. So it's not  
"q800 vs aranym", it's "I already got qemu to emulate all the other  
targets I'm testing and it doesn't require an extensively patched  
kernel" vs "other emulator requiring patched kernel"...)

Thanks,

Rob
