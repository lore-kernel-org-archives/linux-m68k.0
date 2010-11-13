From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: compile error on latest git m68k kernel
Date: Sat, 13 Nov 2010 21:38:02 +1300
Message-ID: <AANLkTi=XtFwK-ronAtU+HXCEyB4ai5QS33SQQjaQEcs-@mail.gmail.com>
References: <AANLkTimA0ZOhNo=RO5ZhrQFNA6wWORekgj42dMNhnpGY@mail.gmail.com>
	<AANLkTi=pzN+7-wQMsVeV4AgVBYA-mGt42MwazaLPmVhg@mail.gmail.com>
	<Pine.BSM.4.64L.1011121323050.23080@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:41169 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753969Ab0KMIiE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Nov 2010 03:38:04 -0500
Received: by wyb28 with SMTP id 28so2731142wyb.19
        for <linux-m68k@vger.kernel.org>; Sat, 13 Nov 2010 00:38:02 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1011121323050.23080@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Hi,

On Sat, Nov 13, 2010 at 2:24 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>
>>Genrtc (which is obsolete) or rtc-generic (to be obsoleted by rtc-cmo=
s
>>on Atari ;-)?
>
> Hah, just as soon as I got rtc-generic working in the Debian kernels=85

Won't be done in a jiffy (still scratching my head whether the STE RTC
is a  mc146818 RTC or not). Let's use rtc-generic for a while.

Cheers,

  Michael
