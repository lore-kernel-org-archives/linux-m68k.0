From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: Use generic strncpy_from_user(), strlen_user(), and strnlen_user()
Date: Wed, 30 May 2012 16:42:59 +0200
Message-ID: <m262bdbuh8.fsf@igel.home>
References: <1338327216-15309-1-git-send-email-geert@linux-m68k.org>
	<20120530102226.GA28628@frolo.macqel>
	<CAMuHMdV5GVZR1BvGD3EncDFfPt=Bt9ndkKE8Mp7euE9KoSaGNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV5GVZR1BvGD3EncDFfPt=Bt9ndkKE8Mp7euE9KoSaGNQ@mail.gmail.com>
	(Geert Uytterhoeven's message of "Wed, 30 May 2012 13:20:02 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Philippe De Muyter <phdm@macqel.be>, linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, linux-kernel@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On Wed, May 30, 2012 at 12:22 PM, Philippe De Muyter <phdm@macqel.be>=
 wrote:
>> On Tue, May 29, 2012 at 11:33:36PM +0200, Geert Uytterhoeven wrote:
>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> ---
>>> Do we also want
>>>
>>> =C2=A0 =C2=A0 select HAVE_EFFICIENT_UNALIGNED_ACCESS if (!COLDFIRE =
&& !M68000)
>>
>> Sorry, I did not follow what happened to unaligned accesses, but
>> CPU32 family (at least 68340) crashes on unaligned accesses.
>
> We don't seem to have CONFIG_M68340 in arch/m68k/Kconfig.cpu?

But we have CONFIG_MCPU32.

Andreas.

--=20
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
