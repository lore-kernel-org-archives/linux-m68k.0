From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 0/1] m68k: merge m68k and m68knommu arch directories
Date: Thu, 24 Mar 2011 09:00:15 +1000
Message-ID: <4D8A7B7F.2050405@snapgear.com>
References: <1300768985-902-1-git-send-email-gerg@snapgear.com> <AANLkTimHzPn2Xe1RVRQKjwdynDvc3iL2=8kJ1p8kRZQ4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:38646 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932755Ab1CWXDc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Mar 2011 19:03:32 -0400
In-Reply-To: <AANLkTimHzPn2Xe1RVRQKjwdynDvc3iL2=8kJ1p8kRZQ4@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>


Hi Geert,

On 24/03/11 08:07, Geert Uytterhoeven wrote:
> On Tue, Mar 22, 2011 at 05:43,<gerg@snapgear.com>  wrote:
>> The following patch merges the m68k and m68knommu arch directories.
>> This patch has been trimmed for review purposes - the automated file
>> moving and mergeing carried out by the script contained in this emai=
l
>> has been removed. Only the manually required changes after running t=
he
>> script are shown as the patch. (So to end up with the final required
>> change you need to run this script then apply the patch).
>>
>> This change is available as the only commit on the m68knommu git tre=
e,
>> for-linux branch:
>>
>> The following changes since commit a952baa034ae7c2e4a66932005cbc7ebb=
ccfe28d:
>> =C3=A1Linus Torvalds (1):
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1Merge branch 'for-linus' of git://git.ker=
nel.org/.../dtor/input
>>
>> are available in the git repository at:
>>
>> =C3=A1git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.g=
it for-linus
>>
>> Greg Ungerer (1):
>> =C3=A1 =C3=A1 =C3=A1m68k: merge m68k and m68knommu arch directories
>>
>>
>> It is also on the for-next branch in that tree, so will get some tes=
ting
>> in the next tree for the next few days.
>
> defconfig is now a nommu-config, and it fails?
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/4012794/

Yep, that looks wrong. I'll move the define for KBUILD_DEFCONFIG
into arch/m68k/Makefile (and remove the existing defines in Makefile_mm
and Makefile_no). That will make the DEFCONFIG as it was before,
multi_defconfig.

 > arch/m68k/kernel/entry_no.S:47: Error: Unknown operator -- statement
 > `save_all' ignored

This is due to compiling for the non-mmu targets and not using
a m68k-uclinux- toolchain. Unfortunately the compiler must define
__uClinux__ to compile for non-mmu targets. This isn't new, we
have had this problem ever since the merge of the header files.
(The exported headers need some switch to use to base some
conditionals on, and kernel config options cannot be used in
exported headers).

But with a fixed defconfig, you won't see this anymore :-)

I'll fix up the git commit on m68knommu git tree.

Thanks!
Greg


> arch/m68k/kernel/entry_no.S:56: Error: Unknown operator -- statement
> `save_all' ignored
> arch/m68k/kernel/entry_no.S:92: Error: operands mismatch -- statement
> `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
> arch/m68k/kernel/entry_no.S:96: Error: operands mismatch -- statement
> `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
> arch/m68k/kernel/entry_no.S:100: Error: operands mismatch -- statemen=
t
> `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
> arch/m68k/kernel/entry_no.S:104: Error: operands mismatch -- statemen=
t
> `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
> arch/m68k/kernel/entry_no.S:108: Error: operands mismatch -- statemen=
t
> `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
> arch/m68k/kernel/entry_no.S:112: Error: operands mismatch -- statemen=
t
> `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
> arch/m68k/kernel/entry_no.S:116: Error: operands mismatch -- statemen=
t
> `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
> arch/m68k/kernel/entry_no.S:118: Error: operands mismatch -- statemen=
t
> `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
> arch/m68k/kernel/entry_no.S:122: Error: operands mismatch -- statemen=
t
> `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
> arch/m68k/kernel/entry_no.S:124: Error: operands mismatch -- statemen=
t
> `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
> arch/m68k/platform/coldfire/entry.S:65: Error: Unknown operator --
> statement `save_all' ignored
> arch/m68k/platform/coldfire/entry.S:92: Error: operands mismatch --
> statement `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
> arch/m68k/platform/coldfire/entry.S:94: Error: operands mismatch --
> statement `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
> arch/m68k/platform/coldfire/entry.S:100: Error: operands mismatch --
> statement `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
> arch/m68k/platform/coldfire/entry.S:104: Error: operands mismatch --
> statement `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
> arch/m68k/platform/coldfire/entry.S:144: Error: Unknown operator --
> statement `restore_user' ignored
> arch/m68k/platform/coldfire/entry.S:156: Error: operands mismatch --
> statement `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
> arch/m68k/platform/coldfire/entry.S:160: Error: operands mismatch --
> statement `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
> arch/m68k/platform/coldfire/entry.S:169: Error: Unknown operator --
> statement `save_all' ignored
> arch/m68k/platform/coldfire/entry.S:193: Error: Unknown operator --
> statement `rdusp' ignored
> arch/m68k/platform/coldfire/entry.S:196: Error: operands mismatch --
> statement `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
> arch/m68k/platform/coldfire/entry.S:199: Error: operands mismatch --
> statement `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
> arch/m68k/platform/coldfire/entry.S:202: Error: Unknown operator --
> statement `wrusp' ignored
>
> Gr{oetje,eeting}s,
>
> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1=C3=A1 =C3=A1=C3=A1 -- Linus Torvalds
>
>
>


--=20
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
