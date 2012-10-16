From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/4 V2] Add linux/io.h to make m54xx_wdt.c compile with
 MMU enabled.
Date: Tue, 16 Oct 2012 15:04:00 +1000
Message-ID: <507CEAC0.2010107@snapgear.com>
References: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com> <1350310101-17784-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:48806 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755652Ab2JPFBF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 16 Oct 2012 01:01:05 -0400
In-Reply-To: <1350310101-17784-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

Hi Stany,

On 16/10/12 00:08, Stany MARCEL wrote:
> Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>

I am fine with it. Though I think you should also include the
actual compile error you get in the commit message.

Acked-by: Greg Ungerer <gerg@uclinux.org>

Being a watchdog driver fix though it needs to also be sent to
the appropriate list and maintainer. get_mainatiner lists:

  Wim Van Sebroeck <wim@iguana.be> (maintainer:WATCHDOG DEVICE D...)
  linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE D...)
  linux-kernel@vger.kernel.org (open list)

Regards
Greg


> ---
>
> Changes:
>   - V2: reword commit message.
>
>   drivers/watchdog/m54xx_wdt.c |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/watchdog/m54xx_wdt.c b/drivers/watchdog/m54xx_wdt.c
> index 173494a..7466b4b 100644
> --- a/drivers/watchdog/m54xx_wdt.c
> +++ b/drivers/watchdog/m54xx_wdt.c
> @@ -29,6 +29,7 @@
>   #include <linux/bitops.h>
>   #include <linux/ioport.h>
>   #include <linux/uaccess.h>
> +#include <linux/io.h>
>
>   #include <asm/coldfire.h>
>   #include <asm/m54xxsim.h>
> --
> 1.7.9.5
>
>
>
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
