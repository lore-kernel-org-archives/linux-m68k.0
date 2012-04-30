From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: fix compiler warning by properly inlining flat_set_persistent()
Date: Mon, 30 Apr 2012 13:42:56 +1000
Message-ID: <4F9E0A40.40602@snapgear.com>
References: <1335622384-4806-1-git-send-email-elezegarcia@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:10037 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755082Ab2D3DoP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 29 Apr 2012 23:44:15 -0400
In-Reply-To: <1335622384-4806-1-git-send-email-elezegarcia@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ezequiel Garcia <elezegarcia@gmail.com>
Cc: geert@linux-m68k.org, gerg@uclinux.org, linux-m68k@vger.kernel.org

Hi Ezequiel,

On 29/04/12 00:13, Ezequiel Garcia wrote:
> This patch removes the following warning:
> fs/binfmt_flat.c:752: warning: unused variable 'persistent'.
> There is neither functionality change, nor extra code generated.
>
> Signed-off-by: Ezequiel Garcia<elezegarcia@gmail.com>

Looks good, thanks.  I'll push that into the for-next branch
of the m68knommu git tree.

Regards
Greg


>   arch/m68k/include/asm/flat.h |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/flat.h b/arch/m68k/include/asm/flat.h
> index a0e2907..f9454b8 100644
> --- a/arch/m68k/include/asm/flat.h
> +++ b/arch/m68k/include/asm/flat.h
> @@ -11,6 +11,11 @@
>   #define	flat_get_addr_from_rp(rp, relval, flags, p)	get_unaligned(rp)
>   #define	flat_put_addr_at_rp(rp, val, relval)	put_unaligned(val,rp)
>   #define	flat_get_relocate_addr(rel)		(rel)
> -#define	flat_set_persistent(relval, p)		0
> +
> +static inline int flat_set_persistent(unsigned long relval,
> +				      unsigned long *persistent)
> +{
> +	return 0;
> +}
>
>   #endif /* __M68KNOMMU_FLAT_H__ */


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
