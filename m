From: "Stephen R. Marenka" <stephen@marenka.net>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Tue, 5 Oct 2010 19:57:33 -0500
Message-ID: <71f02cadfb4f668a7b31cfe779237f4b.squirrel@naiad.marenka.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from naiad.marenka.net ([69.164.199.107]:52200 "EHLO
	naiad.marenka.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754837Ab0JFA5f (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Oct 2010 20:57:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by naiad.marenka.net (Postfix) with ESMTP id 379CBC034
	for <linux-m68k@vger.kernel.org>; Tue,  5 Oct 2010 19:57:35 -0500 (CDT)
Received: from naiad.marenka.net ([127.0.0.1])
	by localhost (naiad.marenka.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5zG4jI-Ynxc for <linux-m68k@vger.kernel.org>;
	Tue,  5 Oct 2010 19:57:33 -0500 (CDT)
In-Reply-To: <3e567f8e50ae806e7dc2b734cc2785f9.squirrel@naiad.marenka.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


On Tue, October 5, 2010 7:56 am, Stephen R. Marenka wrote:
>
> On Mon, October 4, 2010 8:40 am, Thorsten Glaser wrote:
>> Geert Uytterhoeven dixit:
>>
>>>I don't think it makes sense to build staging drivers on Debian/m68k=
=2E
>>
>> Yes. Tell that to *them*, though.
>>
>>>So can't you default to CONFIG_STAGING=3Dn?
>>
>> No *I* can=E2=80=99t.
>
> But I can. Feel free to ask to join the debian-kernel team for m68k. =
After
> all, they let me have access. ;-)
>
>> Besides, this still looks like an obvious omission to me.
>> Look a few lines above, the macros are defined in the other
>> case (CONFIG_ISA defined).
>
> I'll apply the patch too.
>
> I'll try to get it done in the next day or two when I can get to a
> computer with appropriate access.

Done in -25.

Peace,

Stephen

--=20
Stephen R. Marenka     If life's not fun, you're not doing it right!
<stephen@marenka.net>
