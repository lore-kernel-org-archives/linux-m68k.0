From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: improve m68knommu MAINTAINERS entry
Date: Fri, 19 Jun 2015 08:58:25 +0200
Message-ID: <CAMuHMdWr8CDn0qO1_unnpthMePHQcbMa9Duxc0z40ZKk73sZ0g@mail.gmail.com>
References: <1434676392-12766-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:33863 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753116AbbFSG60 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 19 Jun 2015 02:58:26 -0400
In-Reply-To: <1434676392-12766-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Greg,

On Fri, Jun 19, 2015 at 3:13 AM,  <gerg@uclinux.org> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> Improve the information in the m68knommu maintainers entry. This
> should aid in making it clearer what parts of the m68k architecture
> code can go via the m68knommu git tree.
>
> Specifically the entry now lists the relevant git tree where m68knommu
> patches are promoted through. It also spells out that the coldfire
> sub-architecture, and with it the directory of arch/m68k/coldfire, as
> being supported via this tree.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
with minor nit below...

> ---
>  MAINTAINERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d8afd29..bd0090d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10155,11 +10155,14 @@ S:    Maintained
>  F:     Documentation/filesystems/ubifs.txt
>  F:     fs/ubifs/
>
> -UCLINUX (AND M68KNOMMU)
> +UCLINUX (M68KNOMMU AND COLDFIRE)
>  M:     Greg Ungerer <gerg@uclinux.org>
>  W:     http://www.uclinux.org/
> +L:     linux-m68k@lists.linux-m68k.org
>  L:     uclinux-dev@uclinux.org  (subscribers-only)
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
>  S:     Maintained
> +F:     arch/m68k/coldfire/

And "arch/m68k/68*/", to catch 68000 and 68030?

>  F:     arch/m68k/*/*_no.*
>  F:     arch/m68k/include/asm/*_no.*

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
