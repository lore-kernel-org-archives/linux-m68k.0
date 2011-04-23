From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Fix for SLUB?
Date: Sat, 23 Apr 2011 15:39:15 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1104231534340.3979@herc.mirbsd.org>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>
 <BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com>
 <BANLkTikSRStQO6cyE+L2vHHe0TnkoBe8=A@mail.gmail.com>
 <BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com>
 <BANLkTin4=QFyQUT95d7eoXXrdkNJc=T9Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:12540 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754145Ab1DWPta convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 23 Apr 2011 11:49:30 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p3NFdIKb009355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Sat, 23 Apr 2011 15:39:21 GMT
In-Reply-To: <BANLkTin4=QFyQUT95d7eoXXrdkNJc=T9Tw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

>On Sat, Apr 23, 2011 at 05:47, Michael Schmitz
><schmitzmic@googlemail.com> wrote:

>> i.e. ignoring the node_present_pages return value does result in a
>> booting kernel even with the problematic commit included.

I=E2=80=99m trying now (using a cross compiler, to speed up testing).
Sorry for not doing anything for a while, the =E2=80=9Cair has left
me=E2=80=9D (generally and due to lack of progress with m68k as one
can only be the only fighter for ever so long).

But I was just told by a member of the Debian Kernel Team on
IRC that the patches from m68k-v2.6.38 will (probably) not be
accepted, unless they go in via Linus=E2=80=99 tree. How are chances
of that happening? (He says they had told that years ago al-
ready.) I=E2=80=99ll need at least the ARAnyM/NatFeat support and some
of the bugfixes. Otherwise I fear this keeps getting obsolete
very fast. =E2=98=B9

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
