From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] [TRIVIAL] 8250_hp300: Fix warning typo 'CONFIG_8250'
Date: Thu, 10 Nov 2011 11:22:13 +0100
Message-ID: <1320920533.27598.67.camel__12866.4949247197$1320920568$gmane$org@x61.thuisdomein>
References: <1320673476.14409.367.camel@x61.thuisdomein>
	 <alpine.LNX.2.00.1111081025470.1964@pobox.suse.cz>
	 <1320744887.14409.379.camel@x61.thuisdomein>
	 <CAMuHMdVMkLgqjwb7yvFR-tLR2pHcckxkTLDkjNSNjAat9NZ1Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVMkLgqjwb7yvFR-tLR2pHcckxkTLDkjNSNjAat9NZ1Mg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Alan Cox <alan@linux.intel.com>, Greg Kroah-Hartman <gregkh@suse.de>, Philip Blundell <philb@gnu.org>

On Wed, 2011-11-09 at 20:52 +0100, Geert Uytterhoeven wrote:
> I have this reminder in my local tree:
> 
> diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
> index 6033f5d..354ce91 100644
> --- a/arch/m68k/Kconfig.devices
> +++ b/arch/m68k/Kconfig.devices
> @@ -109,6 +109,7 @@ config MULTIFACE_III_TTY
>           To compile this driver as a module, choose M here.
> 
>  config HPDCA
> +       # FIXME Should be bool and select SERIAL_8250_HP300?
>         tristate "HP DCA serial support"
>         depends on DIO && SERIAL_8250
>         help
> @@ -116,6 +117,7 @@ config HPDCA
>           machine, say Y here.
> 
>  config HPAPCI
> +       # FIXME Should be bool and select SERIAL_8250_HP300?
>         tristate "HP APCI serial support"
>         depends on HP300 && SERIAL_8250 && EXPERIMENTAL
>         help
> 
> However, if these two options are bool, SERIAL_8250_HP300 can never
> be m anymore.

0) This might turn out not to be relevant, but are HPDCA and HPAPCI
exclusive?

> Ah, if we just kill SERIAL_8250_HP300, we can put in the Makefile:
> 
> obj-$(CONFIG_HPDCA) += 8250_hp300.o
> obj-$(CONFIG_HPAPCI) += 8250_hp300.o
> 
> Does that make sense?

1) Makefiles always make me nervous. What happens if both CONFIG_HPDCA
and CONFIG_HPAPCI are set?

2) This means upgrading both symbols to tristate, doesn't it? It seems
that someone could then end up with this driver builtin instead of as a
module on upgrade (eg, SERIAL_8250_HP300=m and HPDCA=y becomes just
HPDCA=y on upgrade). But I'm not sure whether that is how the config
tools handle symbol upgrades.

3) Does changing the SERIAL_8250_HP300 entry to
    config SERIAL_8250_HP300
            tristate
            depends on HP300 && (HPDCA || HPAPCI)
            default SERIAL_8250

work for you? That only changes the "depends on" line.

(If you make HPDCA depend on HP300, which it seems to do in practice,
the dependency on HP300 could also be dropped here.)


Paul Bolle
