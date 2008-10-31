From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Fri, 31 Oct 2008 09:50:06 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0810310949190.22521@anakin>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
 <20081023121145.GB27984@x200.localdomain> <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com>
 <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com>
 <49008D12.5090204@gmail.com> <Pine.LNX.4.64.0810231635440.18978@anakin>
 <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com>
 <Pine.LNX.4.64.0810231727430.18978@anakin> <4900B414.7090002@gmail.com>
 <20081023163433.GA3160@x200.localdomain> <20081030214910.GA14679@x200.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20081030214910.GA14679@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Fri, 31 Oct 2008, Alexey Dobriyan wrote:
> On Thu, Oct 23, 2008 at 08:34:33PM +0400, Alexey Dobriyan wrote:
> > On Thu, Oct 23, 2008 at 07:27:48PM +0200, Frederic Weisbecker wrote:
> > > When tracing is enabled, some arch have included <linux/irqflags.h>
> > > on their <asm/system.h> but others like alpha or m68k don't.
> > > 
> > > Build error on alpha:
> > > 
> > > kernel/trace/trace.c: In function 'tracing_generic_entry_update':
> > > kernel/trace/trace.c:658: error: implicit declaration of function 'irqs_disabled_flags'
> 
> FYI, this error still exists in mainline (7f82f000ed030d1108b4de47d9e2d556092980c6).

Now it hit mainline (I can't be bothered to develop _new_ code to fix things in
-next ;-), I'm implementing irqs_disabled_flags() for m68k. Stay tuned...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
