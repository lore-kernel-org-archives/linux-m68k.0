From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 0/5] tty: move stuff around
Date: Fri, 3 Sep 2010 14:01:39 +0200
Message-ID: <201009031401.39224.arnd@arndb.de>
References: <1283115995-4734-1-git-send-email-arnd@arndb.de> <201008311126.45190.arnd@arndb.de> <AANLkTinUjfWqEdOQoomR=TZnQEsiGj1wxvbv5c_MtZKp@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTinUjfWqEdOQoomR=TZnQEsiGj1wxvbv5c_MtZKp@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Greg KH <gregkh@suse.de>, Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>, Roger Wolff <R.E.Wolff@bitwizard.nl>, "Michael H. Warfield" <mhw@wittsend.com>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Thursday 02 September 2010, Geert Uytterhoeven wrote:
> On Tue, Aug 31, 2010 at 11:26, Arnd Bergmann <arnd@arndb.de> wrote:
>   - generic_serial-based:
> 
>       o MVME147_SCC
>       o MVME162_SCC
>       o BVME6000_SCC
>       o A2232
> 
>     All of these were marked BROKEN lately due to generic_serial,
> while there's even a
>     new ATARI_SCC under "active" development...

Ok, so I'll keep the plan of moving generic_serial to staging.
 
>   - plain drivers/char:
> 
>       o SERIAL167
>       o AMIGA_BUILTIN_SERIAL

Since these are the builtin ports for the Amiga and MVME16x
platforms, I suppose we should keep them around as long as the
platforms themselves are there and the code builds.

>   - drivers/serial:
> 
>       o SERIAL_PMACZILOG (Mac)
> 
>     Sun 3/3x support might be (re)added to SERIAL_SUNZILOG

Same category I guess.

Thanks for your feedback!

	Arnd
