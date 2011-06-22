From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the m68knommu tree with the m68k tree
Date: Wed, 22 Jun 2011 10:29:41 +0200
Message-ID: <BANLkTinswxRuM52vW7acZrsKgpMrSxMuWA@mail.gmail.com>
References: <20110622111256.3857df1e.sfr@canb.auug.org.au>
	<4E018CE3.7070101@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <4E018CE3.7070101@snapgear.com>
Sender: linux-next-owner@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Greg, Stephen,

On Wed, Jun 22, 2011 at 08:34, Greg Ungerer <gerg@snapgear.com> wrote:
> On 22/06/11 11:12, Stephen Rothwell wrote:
>> Today's linux-next merge of the m68knommu tree got a conflict in
>> arch/m68k/include/asm/bitops_mm.h between commit 17c74432b88e
>> ("m68k/bitops: Make bitmap data pointer of atomic ops volatile") fro=
m the
>> m68k tree and commit 2cb0d89e66b1 ("m68k: merge mmu and non-mmu
>> bitops.h") from the m68knommu tree.
>>
>> The latter effectively deletes in the file and in doing the merge,
>> removes the funtions that were modified by the former commit. =C2=A0=
So I just
>> removed the file.
>
> That would be right. The changes that Geert's patch makes are in
> my merge patch.

Sorry, I forgot that Greg was merging them, which also fixes the issue =
we
had on m68k.

[mental note to self: check for merge conflicts with m68knommu before u=
pdating
 for-next]

> Geert: do you want me to hold of on merging the bitops.h files?

No, it looks fine to me. Feel free to add my Acked-by.

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
