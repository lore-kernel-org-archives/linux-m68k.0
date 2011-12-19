From: Daniel Palmer <me@danielpalmer.co.uk>
Subject: Re: Porting m68k/nommu to a new board.
Date: Sun, 18 Dec 2011 18:24:56 -0800
Message-ID: <201112181824.56271.me@danielpalmer.co.uk>
References: <201112152137.29195.me@danielpalmer.co.uk> <CAMuHMdU+VCVxnawb8DHmZp1EfBGW6T5D0WyXRXpo8bj1bJZ+pg@mail.gmail.com> <4EEB23FD.9090904@snapgear.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4EEB23FD.9090904@snapgear.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

Hi Greg,

Sorry for not replying sooner. Too much work :(

> I run on ColdFire parts all the time. Right up to 3.2-rc5 :-)
> It works great. But I don't have or regularly use any original m68k
> core hardware. I occasionally compile for the 68328 target, so it
> will compile, can't be sure if it still runs though.

I did a bit of poking around, I couldn't get the 68328 target to build.. I was 
going to have a play with it in xcopilot. It complains about some linker 
section missing .. but I started hacking it up anyway.. at the moment m68328 
depends on m68000 which in turn causes the 68328 platform stuff to build.
So I worked that a little so that 68000 is its own target that builds with 
some minimal startup code (so I can dump the resulting image into my emulator 
and see how far it gets.. I have a gdbserver in my emulator so I can fully see 
whats happening). I haven't managed to get an image out of it yet.. but I will 
have another go at the weekend.

I'm going to get an old palm pilot off of ebay and see if I can get the 68328 
target running too.

Thanks,

Daniel
