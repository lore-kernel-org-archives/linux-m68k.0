From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/2] Add correct PLL settings for DragonBall VZ.
Date: Fri, 4 Apr 2014 19:16:36 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1404041746130.29768@nippy.intranet>
References: <1396449792-5121-1-git-send-email-danieruru@gmail.com> <533D570F.8080000@gmail.com> <CAMuHMdVECm8bWBZ_ZUhrQ34dgmf3aZ2c7aMnXORtPe9ufggsfQ@mail.gmail.com> <CAO64nm6L=p-hcH9NSFxhfQF9RNaid4fPLno9zKsAy4Jn2QnHjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAO64nm6L=p-hcH9NSFxhfQF9RNaid4fPLno9zKsAy4Jn2QnHjg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <danieruru@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gregungerer00@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>


On Fri, 4 Apr 2014, Daniel Palmer wrote:

> 
> I doubt there are many people that are attempting to run Linux on Palms 
> or extremely rare development boards but it does seem like it's possible 
> to detect what chip the kernel is booting on from the chip id register. 
> So the kernel could pick the right PLL settings based on the chip it's 
> booting on and then the same kernel image could be used for all 
> DragonBall based machines.

A look at the user manual for the VZ says that the CHIPID register takes 
the value of 0x5600 upon reset, but does anyone know what crystals are in 
use in the various VZ hardware that Linux runs on?

It's more difficult for EZ: a quick look at wikipedia shows that Palm 
shipped MC68EZ328 devices clocked at 16 MHz and 20 MHz. And the user 
manual for the chip doesn't say what the reset value for the silicon ID 
register is.

-- 
