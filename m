From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 0/7] Generic RTC class driver
Date: Thu, 2 Apr 2009 11:42:02 +0200 (CEST)
Message-ID: <alpine.LRH.2.00.0904021141080.30882@vixen.sonytel.be>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com> <alpine.LRH.2.00.0903111134270.1040@vixen.sonytel.be> <20090311154505.GB5448@bombadil.infradead.org> <alpine.LRH.2.00.0903111825040.1040@vixen.sonytel.be>
 <20090313042543.GA3907@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:54192 "EHLO
	pophost.sonytel.be" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1764682AbZDBJmI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Apr 2009 05:42:08 -0400
In-Reply-To: <20090313042543.GA3907@bombadil.infradead.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Kyle McMartin <kyle@mcmartin.ca>, Alessandro Zummo <alessandro.zummo@towertech.it>, linux-m68k@vger.kernel.org, rtc-linux@googlegroups.com, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>

On Fri, 13 Mar 2009, Kyle McMartin wrote:
> On Wed, Mar 11, 2009 at 06:26:12PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 11 Mar 2009, Kyle McMartin wrote:
> > > On Wed, Mar 11, 2009 at 11:36:02AM +0100, Geert Uytterhoeven wrot=
e:
> > > > Is it OK for you to take it through your PA-RISC tree?
> > > > If yes, I can resend the patch series with the collected acks.
> > >=20
> I've pulled it and pushed it back out, I'll submit it when the merge
> window opens.

Apparently the first half went it through akpm. Will you take care of t=
he
remaining commits?

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
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
