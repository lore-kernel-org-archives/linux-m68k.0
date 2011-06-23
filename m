From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: linux-next: manual merge of the m68knommu tree with the m68k
 tree
Date: Thu, 23 Jun 2011 16:12:09 +1000
Message-ID: <4E02D939.7090206@snapgear.com>
References: <20110622111256.3857df1e.sfr@canb.auug.org.au>	<4E018CE3.7070101@snapgear.com> <BANLkTinswxRuM52vW7acZrsKgpMrSxMuWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <BANLkTinswxRuM52vW7acZrsKgpMrSxMuWA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On 22/06/11 18:29, Geert Uytterhoeven wrote:
> Hi Greg, Stephen,
>
> On Wed, Jun 22, 2011 at 08:34, Greg Ungerer<gerg@snapgear.com>  wrote=
:
>> On 22/06/11 11:12, Stephen Rothwell wrote:
>>> Today's linux-next merge of the m68knommu tree got a conflict in
>>> arch/m68k/include/asm/bitops_mm.h between commit 17c74432b88e
>>> ("m68k/bitops: Make bitmap data pointer of atomic ops volatile") fr=
om the
>>> m68k tree and commit 2cb0d89e66b1 ("m68k: merge mmu and non-mmu
>>> bitops.h") from the m68knommu tree.
>>>
>>> The latter effectively deletes in the file and in doing the merge,
>>> removes the funtions that were modified by the former commit. =C3=A1=
So I just
>>> removed the file.
>>
>> That would be right. The changes that Geert's patch makes are in
>> my merge patch.
>
> Sorry, I forgot that Greg was merging them, which also fixes the issu=
e we
> had on m68k.
>
> [mental note to self: check for merge conflicts with m68knommu before=
 updating
>   for-next]
>
>> Geert: do you want me to hold of on merging the bitops.h files?
>
> No, it looks fine to me. Feel free to add my Acked-by.

Thanks Geert. Will do.

Regards
Greg


-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
