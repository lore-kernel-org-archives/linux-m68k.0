From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 0/7] Generic RTC class driver
Date: Wed, 11 Mar 2009 11:36:02 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903111134270.1040@vixen.sonytel.be>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:54677 "EHLO
	vervifontaine.sonycom.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754147AbZCKKgF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 11 Mar 2009 06:36:05 -0400
In-Reply-To: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Cc: Alessandro Zummo <alessandro.zummo@towertech.it>, linux-m68k@vger.kernel.org, rtc-linux@googlegroups.com, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>

	Hi Kyle,

On Mon, 9 Mar 2009, Geert Uytterhoeven wrote:
> These patches are relative to the "rtc-parisc" branch of Kyle's PA-RI=
SC git
> repository, which already contains some cleanups for the rtc-parisc d=
river by
> Dann, which already have been ack'ed by Alessandro:
>=20
> http://git.kernel.org/?p=3Dlinux/kernel/git/kyle/parisc-2.6.git;a=3Ds=
hortlog;h=3Drtc-parisc
>=20
> Paul: Feel free to add your SuperH support.
>=20
> I suppose the easiest way for this to go in is through Kyle's PA-RISC=
 tree, as
> he already has the preceding patches? Can I have your acks, please?

Is it OK for you to take it through your PA-RISC tree?
If yes, I can resend the patch series with the collected acks.

Thanks!

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =C2=B7 Da Vincilaan 7-D1 =C2=B7 B-1935 Zaventem =C2=
=B7 Belgium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =C2=B7 RPR Brussels
=46ortis =C2=B7 BIC GEBABEBB =C2=B7 IBAN BE41293037680010
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
