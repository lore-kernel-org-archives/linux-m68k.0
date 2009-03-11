From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 0/7] Generic RTC class driver
Date: Wed, 11 Mar 2009 18:26:12 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903111825040.1040@vixen.sonytel.be>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com> <alpine.LRH.2.00.0903111134270.1040@vixen.sonytel.be> <20090311154505.GB5448@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753430AbZCKR01@vger.kernel.org>
In-Reply-To: <20090311154505.GB5448@bombadil.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Cc: Kyle McMartin <kyle@mcmartin.ca>, Alessandro Zummo <alessandro.zummo@towertech.it>, linux-m68k@vger.kernel.org, rtc-linux@googlegroups.com, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>
List-Id: linux-m68k@vger.kernel.org

	Hi Kyle,

On Wed, 11 Mar 2009, Kyle McMartin wrote:
> On Wed, Mar 11, 2009 at 11:36:02AM +0100, Geert Uytterhoeven wrote:
> > Is it OK for you to take it through your PA-RISC tree?
> > If yes, I can resend the patch series with the collected acks.
>=20
> That's fine with me, just hit me up with a git tree address and I'll
> suck it all into the rtc-parisc tree?

I put it up at:

master.kernel.org:/pub/scm/linux/kernel/git/geert/linux-rtc-generic.git

The master branch should be a descendant of your rtc-parisc branch.

Thanks!

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =B7 Da Vincilaan 7-D1 =B7 B-1935 Zaventem =B7 Bel=
gium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =B7 RPR Brussels
=46ortis =B7 BIC GEBABEBB =B7 IBAN BE41293037680010
