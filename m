From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k 2.6.26-1 vs 2.4.30 comparison
Date: Fri, 15 May 2009 11:57:07 +0200
Message-ID: <10f740e80905150257p3a1f4c23t5f7a35bad70d5fbe@mail.gmail.com>
References: <20090503072811.GB3179@luminet.net>
	 <10f740e80905030408p38f87e09ueabc45ef98d4a88f@mail.gmail.com>
	 <20090515023743.GA1647@luminet.net> <m2octulnkv.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f176.google.com ([209.85.219.176]:61913 "EHLO
	mail-ew0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756236AbZEOJ5H convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 15 May 2009 05:57:07 -0400
Received: by ewy24 with SMTP id 24so2317912ewy.37
        for <linux-m68k@vger.kernel.org>; Fri, 15 May 2009 02:57:07 -0700 (PDT)
In-Reply-To: <m2octulnkv.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

On Fri, May 15, 2009 at 11:31, Andreas Schwab <schwab@linux-m68k.org> w=
rote:
> Lance Tagliapietra <lancetag@Luminet.net> writes:
>
>> Now, there is a /dev/rtc device of type 10 135. =C2=A0Interestingly,=
 though is that the
>> kernel is looking for an "rtc0" device based on the kernel config. =C2=
=A0So I'll make
>> that change to the kernel config and re-build and see what I get -- =
or would it
>> be a better approach to add a /dev/rtc0 c 10 135?
>
> I think you need a c 254 0 device if you use rtc-generic.

Note that the actual number may change, as it's a dynamic major.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
