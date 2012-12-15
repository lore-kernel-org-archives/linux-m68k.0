From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [git pull] m68k updates for 3.8
Date: Sat, 15 Dec 2012 00:01:15 +0000
Message-ID: <20121215000115.GT4939@ZenIV.linux.org.uk>
References: <50CB15E3.8010902@westnet.com.au>
 <1355521700.18402.7@driftwood>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1355521700.18402.7@driftwood>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: Greg Ungerer <gregungerer@westnet.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Fri, Dec 14, 2012 at 03:48:20PM -0600, Rob Landley wrote:
> On 12/14/2012 06:04:51 AM, Greg Ungerer wrote:
> >Hi Rob,
> ...
> >>Somebody got one of my images to boot under aranym but they had
> >>to patch
> >>the kernel fairly extensively to add the emulated device support that
> >>emulator provided. It doesn't emulate real devices the way qemu does,
> >>but qemu doesn't fully emulate the processor (just coldfire in
> >>mainline)...
> >
> >I use aranym for testing m68k. Though I don't really pound to heavily
> >on the devices. I really only cross-compile small systems for testing
> >on it.
> 
> What kernel config do you use for aranym? I don't see an an aranym
> entry in
> arch/m68k/configs, and I stopped using it precisely because it
> required several large patches to add emulated device support for
> everything from serial console to block devices. (There was a kernel
> upgrade, it broke, I cut a release without it. Pretty much the same
> reason I stopped using squashfs for a year or so until it finally
> got merged.)

config NATFEAT
        bool "ARAnyM emulator support"
        depends on ATARI
        help
          This option enables support for ARAnyM native features, such as
          access to a disk image as /dev/hda.

followed by rather obvious options that depend on it (block/console/NIC).
