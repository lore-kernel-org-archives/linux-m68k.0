From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: coldfire_qspi compile fix
Date: Wed, 27 Apr 2011 09:52:41 +1000
Message-ID: <4DB75AC9.10907@snapgear.com>
References: <201104241048.08412.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:21979 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755081Ab1DZXyv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 26 Apr 2011 19:54:51 -0400
In-Reply-To: <201104241048.08412.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven King <sfking@fdwdc.com>
Cc: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Hi Steven,

On 25/04/11 03:48, Steven King wrote:
> The m68k/m68knommu merge broke the qspi build.
>
> Signed-off-by: Steven King<sfking@fdwdc.com>

Thanks, I have applied this to the m68knommu git tree.

Regards
Greg


>   drivers/spi/coldfire_qspi.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/spi/coldfire_qspi.c b/drivers/spi/coldfire_qspi.c
> index 8856bcc..ae2cd1c 100644
> --- a/drivers/spi/coldfire_qspi.c
> +++ b/drivers/spi/coldfire_qspi.c
> @@ -33,6 +33,7 @@
>   #include<linux/spi/spi.h>
>
>   #include<asm/coldfire.h>
> +#include<asm/mcfsim.h>
>   #include<asm/mcfqspi.h>
>
>   #define	DRIVER_NAME "mcfqspi"
>
>
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
