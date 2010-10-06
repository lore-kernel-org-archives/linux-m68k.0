From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Wed, 6 Oct 2010 09:26:50 +0000
Message-ID: <Pine.BSM.4.64L.1010060924250.21623@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>   
 <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>   
 <alpine.OSX.2.00.1010041149030.285@localhost>   
 <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>   
 <alpine.OSX.2.00.1010041943530.285@localhost>   
 <Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org>   
 <alpine.OSX.2.00.1010042115260.285@localhost>   
 <AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com>   
 <Pine.BSM.4.64L.1010041338370.24518@herc.mirbsd.org>
 <3e567f8e50ae806e7dc2b734cc2785f9.squirrel@naiad.marenka.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:35653 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932341Ab0JFJaH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Oct 2010 05:30:07 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P3QK5-0007h5-4l
	for linux-m68k@vger.kernel.org; Wed, 06 Oct 2010 11:30:05 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 06 Oct 2010 11:30:05 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 06 Oct 2010 11:30:05 +0200
In-Reply-To: <3e567f8e50ae806e7dc2b734cc2785f9.squirrel@naiad.marenka.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Stephen R. Marenka dixit:

>>>So can't you default to CONFIG_STAGING=3Dn?
>>
>> No *I* can=E2=80=99t.
>
>But I can. Feel free to ask to join the debian-kernel team for m68k. A=
fter
>all, they let me have access. ;-)

Mh. But this is a for-fun weekend =E2=80=9Cjob=E2=80=9D for me, and I d=
on=E2=80=99t know
enough about Linux. It=E2=80=99s too fast-paced, too. So thanks but nop=
e.
(Besides, building a kernel is only secondary to what I do.)

>I'll apply the patch too.

Thanks, but #599121 also needs love=E2=80=A6 waldi said that m68k has
been ignored during even not-so-recent cleanup actions; the
ARAnyM RTC driver added after my last =E2=80=9Creport=E2=80=9D probably=
 vanished
too (hwclock still says it can=E2=80=99t access it).

bye,
//mirabilos
--=20
I believe no one can invent an algorithm. One just happens to hit upon =
it
when God enlightens him. Or only God invents algorithms, we merely copy=
 them.
If you don't believe in God, just consider God as Nature if you won't d=
eny
existence.		-- Coywolf Qi Hunt
