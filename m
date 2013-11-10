From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [patch 1/6] hardirq: Make hardirq bits generic
Date: Sun, 10 Nov 2013 21:49:58 +1300
Message-ID: <ecf977d9ccbd241723a606423267bb2d@biophys.uni-duesseldorf.de>
References: <20130917082838.218329307@infradead.org> <20130917182350.449685712@linutronix.de> <20130917183628.534494408@linutronix.de> <CAMuHMdWgrQf+ULDrZyY5R+vT3GtiWEgpsWxmfk0b5pivN7wBmg@mail.gmail.com> <alpine.DEB.2.02.1309172315550.4089@ionos.tec.linutronix.de> <alpine.DEB.2.02.1309181159520.4089@ionos.tec.linutronix.de> <alpine.DEB.2.02.1309191652480.4089@ionos.tec.linutronix.de> <87txhg3ftx.fsf@igel.home> <CAMuHMdW-YBroi6GezUP-KQBVRAcmYtUQERvBC=ekmemopDhVow@mail.gmail.com> <alpine.DEB.2.02.1311041305540.28335@ionos.tec.linutronix.de> <alpine.DEB.2.02.1311042032130.16975@ayla.of.borg> <alpine.DEB.2.02.1311061237430.23353@ionos.tec.linutronix.de> <CAMuHMdXDA2MRbR3GmD3KWC-iE6jnWX4uvbf1qeMd7RYX3O8f_g@mail.gmail.com> <alpine.DEB.2.02.1311071655240.23353@ionos.tec.linutronix.de>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1311071655240.23353@ionos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Thomas,

> Is there an easy to setup/use emulator around on which I could try to
> dig into that myself?

I believe Geert uses ARAnyM for his tests of m68k kernels on emulators 
- it is reasonably easy to set up and use. I've used it to debug 
problems we had with the SLUB allocator two years ago.

Emulation is for Atari Falcon 040 hardware, things like interrupt 
priorities ought to be reproduced faithfully.

Not that it would hurt to try Geert's last non-booting kernel on true 
hardware - either send the kernel image or a patch to apply to your 
current tree please, Geert.

Regards,

	Michael
