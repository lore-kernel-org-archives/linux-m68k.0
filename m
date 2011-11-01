From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH] m68k/atari: SCC - Move Atari serial driver to staging
Date: Wed, 2 Nov 2011 09:03:29 +1300
Message-ID: <CAOmrzkJGhoBfqeTGROWdDXeL4HVJq2XaPJEtn0CzuNTOyCab9A@mail.gmail.com>
References: <alpine.DEB.2.00.1103201010001.13805@ayla.of.borg>
	<CAMuHMdWVchre0g6dE1j_s-+Wc3n17uifQLH6kRfJ9Q2DKfqBLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWVchre0g6dE1j_s-+Wc3n17uifQLH6kRfJ9Q2DKfqBLQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,

On Tue, Nov 1, 2011 at 7:58 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Mar 20, 2011 at 10:11, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> Cfr. commit 4c37705877e74c02c968735c2eee0f84914cf557 ("tty: move obsolete and
>> broken generic_serial drivers to drivers/staging/generic_serial/")
>
> As generic serial is gone too, cfr. commit
> bb2a97e9ccd525dd9c3326988e8c676d15d3e12a ("Staging: delete generic_serial
> drivers"), I'll remove the atari_scc driver. It has to be resurrected as a new
> preferred-type-of-serial-driver-of-the-day driver anyway.

Guess I've seen that coming... I had looked at other existing SCC
drivers in the tree and Sun, SGI and Mac all had variants of it with
different quirks. Enough to base a clean restart on. What is today's
preferred-type-of-serial-driver-of-the-day driver framework, if I may
ask?

> You can still get its core logic from the eternal git history, though.

I've still kept a copy around somewhere, no worries. Go ahead.

Cheers,

  Michael
