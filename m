From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: aufs vs. m68k conflict, please advice
Date: Fri, 16 Dec 2011 17:15:34 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1112161714000.856@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
 <1324054093.2825.282.camel@deadeye>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:35620 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751955Ab1LPRYc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 12:24:32 -0500
In-Reply-To: <1324054093.2825.282.camel@deadeye>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian Kernel Team <debian-kernel@lists.debian.org>
Cc: linux-m68k@vger.kernel.org

Ben Hutchings dixit:

>Maybe, but it should work just as long as AUFS_NAME is also defined in

Right, looks like it.

>advance.  Not sure why that's not also provided on the command line, o=
r

Hrm. Can you forward this to the aufs people then, and maybe get
us some fix?

>why other architectures get away with it.  Maybe they just don't use
>pr_*() in headers.

*shrug* Like I said, no idea. I=E2=80=99m =E2=80=9Cjust=E2=80=9D the bu=
ild =E2=80=9Cd=C3=A6mon=E2=80=9D =E2=98=BA
(ok, with a bit of knowledge but nothing really learned)

bye,
//mirabilos
--=20
<ch> you introduced a merge commit        =E2=94=82<mika> % g rebase -i=
 HEAD^^
<mika> sorry, no idea and rebasing just fscked =E2=94=82<mika> Segmenta=
tion
<ch> should have cloned into a clean repo      =E2=94=82  fault (core d=
umped)
<ch> if I rebase that now, it's really ugh     =E2=94=82<mika:#grml> wu=
ahhhhhh
