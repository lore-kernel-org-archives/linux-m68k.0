From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] m68k: Remove references to obsolete CONFIG_SERIAL167
Date: Thu, 17 Nov 2011 22:34:47 +0100
Message-ID: <1321565687.20271.309.camel@x61.thuisdomein>
References: <1321180296-22543-1-git-send-email-geert@linux-m68k.org>
	 <1321182176.20271.43.camel@x61.thuisdomein>
	 <CAMuHMdXsHgUd_oggpKoS2t6Tm8MnEjLnWmi4Hswz_nQjSWsozA@mail.gmail.com>
	 <1321559636.20271.287.camel@x61.thuisdomein>
	 <CAMuHMdW73Nf+bP2u6NRZFMW5c0-PnqYCDtEbZ+weGLs_mzZ1_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdW73Nf+bP2u6NRZFMW5c0-PnqYCDtEbZ+weGLs_mzZ1_g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, Jiri Kosina <trivial@kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Thu, 2011-11-17 at 22:05 +0100, Geert Uytterhoeven wrote:
> > Why do you care about SERIAL_CONSOLE? If it's only really used by
> > AMIGA_BUILTIN_SERIAL why shouldn't we rename it to
> > AMIGA_BUILTIN_SERIAL_CONSOLE?
> 
> Because SERIAL_CONSOLE is a universal platform-independent symbol.
> Other arches have it as well (but less than in the past).
> 
> As soon as m68k gets a new serial driver, it will be used by 2 drivers again.

If one does
    $ git grep -n  "\<\(CONFIG_\)\?SERIAL_CONSOLE\>" | grep -v defconfig

one gets a few hits (summarized):
- arch/m68k/Kconfig.devices: discussed here;
- arch/sparc/Kconfig: apparently unused, and can be dropped;
- arch/xtensa/Kconfig and arch/xtensa/platforms/iss/console.c: the only
  other current usage (note that the "S6105" platform, mentioned in the
  Kconfig file, seems not to use it);
- drivers/staging/serial/68360serial.c: uses CONFIG_SERIAL_CONSOLE, but
  I don't see how it can actually be set for that driver;
- drivers/tty/amiserial.c: discussed here.

I see nothing universal about it: two independent usages, one in
*/iss/console.c and one in */amiserial.c. So I'd say these can be
renamed to (say) ISS_SERIAL_CONSOLE and AMIGA_BUILTIN_SERIAL_CONSOLE.


Paul Bolle
