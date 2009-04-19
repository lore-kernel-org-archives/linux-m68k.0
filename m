From: Alessandro Zummo <alessandro.zummo@towertech.it>
Subject: Re: [rtc-linux] Re: [PATCH/RFC 15/16] rtc: Add an RTC driver for
 the  Ricoh RP5C01
Date: Sun, 19 Apr 2009 20:56:52 +0200
Message-ID: <20090419205652.44b0b7e9@i1501.lan.towertech.it>
References: <1240080744-14995-1-git-send-email-geert@linux-m68k.org>
	<1240080744-14995-9-git-send-email-geert@linux-m68k.org>
	<1240080744-14995-10-git-send-email-geert@linux-m68k.org>
	<1240080744-14995-11-git-send-email-geert@linux-m68k.org>
	<1240080744-14995-12-git-send-email-geert@linux-m68k.org>
	<1240080744-14995-13-git-send-email-geert@linux-m68k.org>
	<1240080744-14995-14-git-send-email-geert@linux-m68k.org>
	<1240080744-14995-15-git-send-email-geert@linux-m68k.org>
	<1240080744-14995-16-git-send-email-geert@linux-m68k.org>
	<20090418235529.47e481e9@i1501.lan.towertech.it>
	<10f740e80904191141i599af898wd47535cabd8c9184@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx0.towertech.it ([213.215.222.73]:40957 "HELO mx0.towertech.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1755939AbZDSS44 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Apr 2009 14:56:56 -0400
In-Reply-To: <10f740e80904191141i599af898wd47535cabd8c9184@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 19 Apr 2009 20:41:21 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > =A0please implement either set_time or set_mmss, not both.
> > =A0I don't know the chip but I suspect set_time is the one you need=
=2E
>=20
> OK, I will remove .set_mmss. Got to confused by looking into how
> everything is used...
> BTW, the only remaining users of rtc_set_mmss() seem to be
> arch/sparc/kernel/time_{32,64}.c?

 Yes. The facility is there for drives, not users. For some chips it's =
easier
 to implement a set_mmss like interface so it's better to have the rtc =
framewrk
 to convert between the twos than to have repeated code in drivers.

> OK, if I take the result (for both rtc-rp5c01 and rtc-msm6242) throug=
h
> the m68k tree?

 that's ok, you can add my acked by.
--=20

 Best regards,

 Alessandro Zummo,
  Tower Technologies - Torino, Italy

  http://www.towertech.it

--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
