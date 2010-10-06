From: "Stephen R. Marenka" <stephen@marenka.net>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Wed, 6 Oct 2010 08:09:44 -0500
Message-ID: <cab86a767605dd69513f9c24207fdada.squirrel@naiad.marenka.org>
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
    <Pine.BSM.4.64L.1010060924250.21623@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from naiad.marenka.net ([69.164.199.107]:33004 "EHLO
	naiad.marenka.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755867Ab0JFNJq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Oct 2010 09:09:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by naiad.marenka.net (Postfix) with ESMTP id 4DC23C034
	for <linux-m68k@vger.kernel.org>; Wed,  6 Oct 2010 08:09:46 -0500 (CDT)
Received: from naiad.marenka.net ([127.0.0.1])
	by localhost (naiad.marenka.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-gYEDbH8LH5 for <linux-m68k@vger.kernel.org>;
	Wed,  6 Oct 2010 08:09:44 -0500 (CDT)
In-Reply-To: <Pine.BSM.4.64L.1010060924250.21623@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


On Wed, October 6, 2010 4:26 am, Thorsten Glaser wrote:
> Stephen R. Marenka dixit:
>
>>>>So can't you default to CONFIG_STAGING=3Dn?
>>>
>>> No *I* can=E2=80=99t.
>>
>>But I can. Feel free to ask to join the debian-kernel team for m68k.
>> After
>>all, they let me have access. ;-)
>
> Mh. But this is a for-fun weekend =E2=80=9Cjob=E2=80=9D for me, and I=
 don=E2=80=99t know
> enough about Linux. It=E2=80=99s too fast-paced, too. So thanks but n=
ope.

Hey now worries, it's not my day-job either. I don't blame you, but it
would be nice to have a backup person.

> (Besides, building a kernel is only secondary to what I do.)

I only needed the kernels to get d-i working and to support my buildd h=
abit.

>>I'll apply the patch too.
>
> Thanks, but #599121 also needs love=E2=80=A6 waldi said that m68k has
> been ignored during even not-so-recent cleanup actions; the
> ARAnyM RTC driver added after my last =E2=80=9Creport=E2=80=9D probab=
ly vanished
> too (hwclock still says it can=E2=80=99t access it).

Did those patches ever go upstream of linux-m68k? I recall that some of
the aranym patches were sitting there. They were certainly on the list =
of
patches I was adding to the debian kernel at some point in the past.

Peace,

Stephen

--=20
Stephen R. Marenka     If life's not fun, you're not doing it right!
<stephen@marenka.net>
