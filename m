From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 09/17] [m68k] IRQ: add handle_polled_irq() for timer
 based soft interrupts
Date: Tue, 12 Nov 2013 20:08:34 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1311121956480.30673@ionos.tec.linutronix.de>
References: <20130131002344.1161E360095@xplor.waratah.dyndns.org> <CAMuHMdUFuNpiZzTr=86Yi2yx73xh_qv8S6PnT0hp9U8x86vskw@mail.gmail.com> <CAMuHMdXB1LNGXkz=_eCQ+i+tu18ffbCA9dP_LRrF1CUBv-q-uQ@mail.gmail.com> <alpine.DEB.2.02.1311061149250.23353@ionos.tec.linutronix.de>
 <753aef27d368410b1e5c5814b1e7c8a7@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <753aef27d368410b1e5c5814b1e7c8a7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

On Sun, 10 Nov 2013, Michael Schmitz wrote:
> Your patch works just fine, thanks.
> 
> I suppose setting the flag can be done in the corresponding irq startup
> function, instead of when setting up the irq controller?

irq_startup() is called with irq_desc->lock held and
irq_set_status_flags() wants desc->lock as well. Deadlock

And no, you don't want to fiddle manually in the irq descriptor data
fields. See commit a6967caf00eb :)

> Geert - I will send the patch to ataints.c implementing this as soon as
> Thomas' fix is merged.

I'll expedite it for 3.13.

Thanks,

	tglx
