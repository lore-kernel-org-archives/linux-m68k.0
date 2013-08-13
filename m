From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Tue, 13 Aug 2013 08:12:49 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1308130810460.20692@herc.mirbsd.org>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org>
 <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
 <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
Resent-Message-ID: <kdegImiu59O.A.PBC.sueCSB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org
List-Id: linux-m68k@vger.kernel.org

(Can you please use UTF-8 for eMails, not Windows-1252?)

Michael Schmitz dixit:

>>> Source:
>>> http://thread.gmane.org/gmane.linux.debian.devel.kernel/91476/focus=3D5=
003
>>
>> I felt I could not name a single author (=E2=80=9CFrom=E2=80=9D) which
>> is why I submitted this as-is.
>
> It really was Geert's work, I did not meaningfully contribute to that.

Hm okay. Let=E2=80=99s just hope Geert hurries up and accepts them into
his tree and pushes them to Linus, because that=E2=80=99s normally the
requirement to get anything into the Debian kernel=E2=80=A6 not doing so
seriously hinders my position.

> Having revived my Falcon, I should be in a position to test these.

OK cool. The latter is only available now, having replaced the
former (but it WFM even on the buildd that uses btrfs).

bye,
//mirabilos
--=20
<ch> you introduced a merge commit        =E2=94=82<mika> % g rebase -i HEA=
D^^
<mika> sorry, no idea and rebasing just fscked =E2=94=82<mika> Segmentation
<ch> should have cloned into a clean repo      =E2=94=82  fault (core dumpe=
d)
<ch> if I rebase that now, it's really ugh     =E2=94=82<mika:#grml> wuahhh=
hhh
