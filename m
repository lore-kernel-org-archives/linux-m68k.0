From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [patch 06/18] m68k: Disable Amiga serial console support if
	modular
Date: Mon, 13 Oct 2008 23:08:17 +0200
Message-ID: <1223932097.3619.51.camel@x41.thuisdomein>
References: <20081013195846.674654386@mail.of.borg>
	 <20081013195915.659336491@mail.of.borg>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759290AbYJMVI5@vger.kernel.org>
In-Reply-To: <20081013195915.659336491@mail.of.borg>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Mon, 2008-10-13 at 21:58 +0200, Geert Uytterhoeven wrote:
> Apparently console_initcall() is not defined in the modular case.

Yes, see include/linux/init.h:
#ifndef MODULE
[...]
#define console_initcall(fn) \
        static initcall_t __initcall_##fn \
        __used __section(.con_initcall.init) = fn
[...]

> Any better alternative fix?

Well, (a number of) other serial consoles cannot be selected if the
corresponding serial driver is modular. Try:
grep -B 2 -E "depends on .*=y" drivers/serial/Kconfig | \
    grep -A 2 -E "^config .*CONSOLE"

For instance:
config SERIAL_8250_CONSOLE
	bool "Console on 8250/16550 and compatible serial port"
	depends on SERIAL_8250=y

Maybe this config entry (in arch/m68k/Kconfig) could be cleaned up (or
split into multiple entries):
config SERIAL_CONSOLE
        bool "Support for serial port console"
        depends on (AMIGA || ATARI || MAC || SUN3 || SUN3X || VME ||
APOLLO) && (ATARI_MFPSER=y || ATARI_MIDI=y || MAC_SCC=y ||
AMIGA_BUILTIN_SERIAL=y || GVPIOEXT=y || MULTIFACE_III_TTY=y || SERIAL=y
|| MVME147_SCC || SERIAL167 || MVME162_SCC || BVME6000_SCC || DN_SERIAL)
[...]

That "depends on" line seems likely to lead to problems like the one you
ran into. But your patch (which I didn't test) is probably simpler.


Paul Bolle
