From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Sun, 13 Mar 2011 20:34:33 +1300
Message-ID: <AANLkTi=RUod3zBnOpCX5pvg5CTVU2t5xAKh8qNo+Z14i@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
	<AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
	<Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
	<AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
	<4D44F92C.2050707@gmail.com>
	<AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com>
	<4D461512.8080609@gmail.com>
	<alpine.LNX.2.00.1101311424100.6256@nippy.intranet>
	<Pine.BSM.4.64L.1102052339100.22476@herc.mirbsd.org>
	<4D575F50.1020601@gmail.com>
	<4D5CCCA5.1000106@gmail.com>
	<Pine.BSM.4.64L.1102171817230.3948@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:39723 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753698Ab1CMHee convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Mar 2011 03:34:34 -0400
Received: by vws1 with SMTP id 1so1677410vws.19
        for <linux-m68k@vger.kernel.org>; Sat, 12 Mar 2011 23:34:33 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1102171817230.3948@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Hi Torsten,

the reversal seems to result from the way I ended the bisect. Applying
the posted patch to the Debian 2.6.27 source you had used initially
does indeed seem to fix the problem.  I still need to test that after
resetting my git tree, and I need to test on another ARAnyM
installation as well. Should not take another month though.

Cheers,

  Michael


On Fri, Feb 18, 2011 at 7:18 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Michael Schmitz dixit:
>
>> Diff in question - can anyone guess at what the problem may be?:
>
> Is it reversed? Looks like that to me, from the commit msg.
> Not a clue about the problem, though (but I didn=E2=80=99t read the
> surrounding code either, just had a quick look at the diff
> while waiting for the coffee machine).
>
> bye,
> //mirabilos
> --
> 13:47=E2=8E=9C<tobiasu> if i were omnipotent, i would divide by zero
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all day long ;=
)
> (thinking about http://lobacevski.tumblr.com/post/3260866481 by waga)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
