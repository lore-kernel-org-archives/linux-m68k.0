From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Tue, 13 Aug 2013 20:31:08 +1200
Message-ID: <8612ec946622122a048ec3805a30fef5@biophys.uni-duesseldorf.de>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org> <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org> <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de> <Pine.BSM.4.64L.1308130810460.20692@herc.mirbsd.org>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: multipart/alternative; boundary=Apple-Mail-1-790993917
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <Pine.BSM.4.64L.1308130810460.20692@herc.mirbsd.org>
Resent-Message-ID: <xf98hsWQHIF.A.lXH.NLfCSB@bendel>
List-URL: <http://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org
List-Id: linux-m68k@vger.kernel.org


--Apple-Mail-1-790993917
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=UTF-8;
	format=flowed

Hi Thorsten,

> (Can you please use UTF-8 for eMails, not Windows-1252?)

I'll try - no idea why Mac Mail would have used that. This one ought to=20=

be UTF-8.

>>
>> It really was Geert's work, I did not meaningfully contribute to =
that.
>
> Hm okay. Let=E2=80=99s just hope Geert hurries up and accepts them =
into
> his tree and pushes them to Linus, because that=E2=80=99s normally the
> requirement to get anything into the Debian kernel=E2=80=A6 not doing =
so
> seriously hinders my position.

He's orders of magnitude faster than me. Not very difficult really :-)

>
>> Having revived my Falcon, I should be in a position to test these.
>
> OK cool. The latter is only available now, having replaced the
> former (but it WFM even on the buildd that uses btrfs).

I can only test the interrupt patch part of it for now.

Cheers,

	Michael


>
> bye,
> //mirabilos
> --=20
> <ch> you introduced a merge commit        =E2=94=82<mika> % g rebase =
-i HEAD^^
> <mika> sorry, no idea and rebasing just fscked =E2=94=82<mika> =
Segmentation
> <ch> should have cloned into a clean repo      =E2=94=82  fault (core =
dumped)
> <ch> if I rebase that now, it's really ugh     =E2=94=82<mika:#grml> =
wuahhhhhh
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=20=

> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--Apple-Mail-1-790993917
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=UTF-8

Hi Thorsten,


<excerpt>(Can you please use UTF-8 for eMails, not Windows-1252?)

</excerpt>

I'll try - no idea why Mac Mail would have used that. This one ought
to be UTF-8.


<excerpt><excerpt>

It really was Geert's work, I did not meaningfully contribute to that.

</excerpt>

Hm okay. Let=E2=80=99s just hope Geert hurries up and accepts them into

his tree and pushes them to Linus, because that=E2=80=99s normally the

requirement to get anything into the Debian kernel=E2=80=A6 not doing so

seriously hinders my position.

</excerpt>

He's orders of magnitude faster than me. Not very difficult really :-)=20=



<excerpt>

<excerpt>Having revived my Falcon, I should be in a position to test
these.

</excerpt>

OK cool. The latter is only available now, having replaced the

former (but it WFM even on the buildd that uses btrfs).

</excerpt>

I can only test the interrupt patch part of it for now.=20


Cheers,


	Michael



<excerpt>

bye,

//mirabilos

--=20

<<ch> you introduced a merge commit      =20
<fontfamily><param>Hiragino Kaku Gothic =
Pro</param>=E2=94=82</fontfamily><<mika>
% g rebase -i HEAD^^

<<mika> sorry, no idea and rebasing just fscked
<fontfamily><param>Hiragino Kaku Gothic =
Pro</param>=E2=94=82</fontfamily><<mika>
Segmentation

<<ch> should have cloned into a clean repo    =20
<fontfamily><param>Hiragino Kaku Gothic Pro</param>=E2=94=82</fontfamily>=20=

fault (core dumped)

<<ch> if I rebase that now, it's really ugh   =20
<fontfamily><param>Hiragino Kaku Gothic =
Pro</param>=E2=94=82</fontfamily><<mika:#grml>
wuahhhhhh

--

To unsubscribe from this list: send the line "unsubscribe linux-m68k"
in

the body of a message to majordomo@vger.kernel.org

More majordomo info at  http://vger.kernel.org/majordomo-info.html

</excerpt>=

--Apple-Mail-1-790993917--
