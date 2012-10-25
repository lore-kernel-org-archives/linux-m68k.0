From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] Disable MC68000 cpu target when MMU is selected
Date: Fri, 26 Oct 2012 09:31:27 +1000
Message-ID: <5089CBCF.8050701@snapgear.com>
References: <1351195276-5937-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:24424 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751310Ab2JYX0c (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 25 Oct 2012 19:26:32 -0400
In-Reply-To: <1351195276-5937-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org

Hi Luis,

On 26/10/12 06:01, Luis Alves wrote:
> As pointed out by Geert, MC68000 target needs to be disabled when
>   MMU support is enabled.

Thanks, I have applied to m68knommu git tree.

Regards
Greg


>
> Signed-off-by: Luis Alves <ljalvs@gmail.com>
> ---
>   arch/m68k/Kconfig.cpu |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index aad3b0b..6708fa4 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -36,6 +36,7 @@ if M68KCLASSIC
>
>   config M68000
>   	bool "MC68000"
> +	depends on !MMU
>   	select CPU_HAS_NO_BITFIELDS
>   	select CPU_HAS_NO_MULDIV64
>   	select CPU_HAS_NO_UNALIGNED
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
