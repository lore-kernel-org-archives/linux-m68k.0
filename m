From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari TT
Date: Thu, 24 Jan 2013 21:41:46 +0100
Message-ID: <CAMuHMdUj_OhGOzZ=RHbdTnB8ej4538HZUKVuDuLB_MA7p4LHAQ@mail.gmail.com>
References: <20130120205231.GC32291@mail.biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1301202117270.27441@herc.mirbsd.org>
	<20130120225718.GA1459@mail.biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1301232011550.14843@herc.mirbsd.org>
	<20130123212251.GA14282@mail.biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1301232213380.14843@herc.mirbsd.org>
	<20130124000856.GA15759@mail.biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1301241759530.6423@herc.mirbsd.org>
	<20130124185341.GA27701@mail.biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1301241946080.6423@herc.mirbsd.org>
	<20130124202050.GA28593@mail.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20130124202050.GA28593@mail.biophys.uni-duesseldorf.de>
Resent-Message-ID: <lQOc0rR2PkI.A.TDC.cyZARB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Cc: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Thu, Jan 24, 2013 at 9:20 PM, Michael Schmitz
<schmitz@mail.biophys.uni-duesseldorf.de> wrote:
> The ne.c network driver does not appear to tolerate interrupts arriving before
> the device has been configured, at least in the early boot phases. I'm uncertain
> whether it would work even with my latest patches applied - maybe I can find
> some time on the weekend to test that.

Stupid ISA-only driver without IRQ sharing support...

The hydra and zorro8390 driver should handle that case fine, as interrupts are
shared on Amiga.

> Geert: is there some way for kernel network drivers to figure out whether the
> network subsystem has been initialized, and hold off interrupt processing
> before that time? I'm using 'if (netif_running(dev))' in atari_ethernec but
> that does not appear to prevent the lockup.

Doesn't the driver know when it's configured?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
