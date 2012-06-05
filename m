From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: any affs image
Date: Tue, 5 Jun 2012 09:50:54 +0200
Message-ID: <CAMuHMdWB2xaNdugrmgQDnJpqc7-TVrLL9fPBXGav0SgMVwAxdA@mail.gmail.com>
References: <1338815624.2507.15.camel@sauron.fi.intel.com>
	<CAMuHMdVi7qxd+=XSEMz7=nKEng-2v1q479h4_nzG8faJVKqozQ@mail.gmail.com>
	<1338880477.2507.19.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1338880477.2507.19.camel@sauron.fi.intel.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: dedekind1@gmail.com
Cc: linux-m68k@lists.linux-m68k.org

Hi Artem,

On Tue, Jun 5, 2012 at 9:14 AM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
> On Mon, 2012-06-04 at 21:21 +0200, Geert Uytterhoeven wrote:
>> > do you happen to have an affs disk image, by any chance? I need to=
 make
>> > few changes in the affs file-system in the linux kernel but and I =
would
>> > like to test them. But unfortunately, I was not able to find any w=
orking
>> > way of formatting my dist to affs.
>>
>> http://www.xs4all.nl/~zippel/affstools-0.1a.tar.gz contains an mkaff=
s tool.
>>
>> Hope this helps...
>
> Hi, thanks, I tried it and it worked neither for files nor for block
> device nodes, I do not know why. But I've found a different mkfs.affs

Strange. I did try it yesterday (without mounting the result, though).

Did you pass a volume name as second parameter?

> which actually works. Thanks!

OK.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
