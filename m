From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/1] m68k: merge m68k and m68knommu arch directories
Date: Wed, 23 Mar 2011 23:07:48 +0100
Message-ID: <AANLkTimHzPn2Xe1RVRQKjwdynDvc3iL2=8kJ1p8kRZQ4@mail.gmail.com>
References: <1300768985-902-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:61965 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753945Ab1CWWHt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Mar 2011 18:07:49 -0400
In-Reply-To: <1300768985-902-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>

On Tue, Mar 22, 2011 at 05:43,  <gerg@snapgear.com> wrote:
> The following patch merges the m68k and m68knommu arch directories.
> This patch has been trimmed for review purposes - the automated file
> moving and mergeing carried out by the script contained in this email
> has been removed. Only the manually required changes after running th=
e
> script are shown as the patch. (So to end up with the final required
> change you need to run this script then apply the patch).
>
> This change is available as the only commit on the m68knommu git tree=
,
> for-linux branch:
>
> The following changes since commit a952baa034ae7c2e4a66932005cbc7ebbc=
cfe28d:
> =C2=A0Linus Torvalds (1):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Merge branch 'for-linus' of git://git.kern=
el.org/.../dtor/input
>
> are available in the git repository at:
>
> =C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.gi=
t for-linus
>
> Greg Ungerer (1):
> =C2=A0 =C2=A0 =C2=A0m68k: merge m68k and m68knommu arch directories
>
>
> It is also on the for-next branch in that tree, so will get some test=
ing
> in the next tree for the next few days.

defconfig is now a nommu-config, and it fails?

http://kisskb.ellerman.id.au/kisskb/buildresult/4012794/

arch/m68k/kernel/entry_no.S:47: Error: Unknown operator -- statement
`save_all' ignored
arch/m68k/kernel/entry_no.S:56: Error: Unknown operator -- statement
`save_all' ignored
arch/m68k/kernel/entry_no.S:92: Error: operands mismatch -- statement
`moveml %a3-%a6/%d6-%d7,%sp@-' ignored
arch/m68k/kernel/entry_no.S:96: Error: operands mismatch -- statement
`moveml %sp@+,%a3-%a6/%d6-%d7' ignored
arch/m68k/kernel/entry_no.S:100: Error: operands mismatch -- statement
`moveml %a3-%a6/%d6-%d7,%sp@-' ignored
arch/m68k/kernel/entry_no.S:104: Error: operands mismatch -- statement
`moveml %sp@+,%a3-%a6/%d6-%d7' ignored
arch/m68k/kernel/entry_no.S:108: Error: operands mismatch -- statement
`moveml %a3-%a6/%d6-%d7,%sp@-' ignored
arch/m68k/kernel/entry_no.S:112: Error: operands mismatch -- statement
`moveml %sp@+,%a3-%a6/%d6-%d7' ignored
arch/m68k/kernel/entry_no.S:116: Error: operands mismatch -- statement
`moveml %a3-%a6/%d6-%d7,%sp@-' ignored
arch/m68k/kernel/entry_no.S:118: Error: operands mismatch -- statement
`moveml %sp@+,%a3-%a6/%d6-%d7' ignored
arch/m68k/kernel/entry_no.S:122: Error: operands mismatch -- statement
`moveml %a3-%a6/%d6-%d7,%sp@-' ignored
arch/m68k/kernel/entry_no.S:124: Error: operands mismatch -- statement
`moveml %sp@+,%a3-%a6/%d6-%d7' ignored
arch/m68k/platform/coldfire/entry.S:65: Error: Unknown operator --
statement `save_all' ignored
arch/m68k/platform/coldfire/entry.S:92: Error: operands mismatch --
statement `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
arch/m68k/platform/coldfire/entry.S:94: Error: operands mismatch --
statement `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
arch/m68k/platform/coldfire/entry.S:100: Error: operands mismatch --
statement `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
arch/m68k/platform/coldfire/entry.S:104: Error: operands mismatch --
statement `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
arch/m68k/platform/coldfire/entry.S:144: Error: Unknown operator --
statement `restore_user' ignored
arch/m68k/platform/coldfire/entry.S:156: Error: operands mismatch --
statement `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
arch/m68k/platform/coldfire/entry.S:160: Error: operands mismatch --
statement `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
arch/m68k/platform/coldfire/entry.S:169: Error: Unknown operator --
statement `save_all' ignored
arch/m68k/platform/coldfire/entry.S:193: Error: Unknown operator --
statement `rdusp' ignored
arch/m68k/platform/coldfire/entry.S:196: Error: operands mismatch --
statement `moveml %a3-%a6/%d6-%d7,%sp@-' ignored
arch/m68k/platform/coldfire/entry.S:199: Error: operands mismatch --
statement `moveml %sp@+,%a3-%a6/%d6-%d7' ignored
arch/m68k/platform/coldfire/entry.S:202: Error: Unknown operator --
statement `wrusp' ignored

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
