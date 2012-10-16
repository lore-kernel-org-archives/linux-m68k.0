From: "Stany MARCEL" <smarcel@pactenovation.fr>
Subject: RE: [PATCH 1/4 V2] Add linux/io.h to make m54xx_wdt.c compile with MMU enabled.
Date: Tue, 16 Oct 2012 12:47:17 +0200
Message-ID: <1512C13C0C5EA947AE50B9B9AC314F4701B00E1E@ATLAS.pactenovation.fr>
References: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com> <1350310101-17784-1-git-send-email-stany.marcel@novasys-ingenierie.com> <507CEAC0.2010107@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gpn92sys-242-163.cnt.nerim.net ([195.5.242.163]:50818 "EHLO
	ATLAS.pactenovation.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753528Ab2JPKnZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 16 Oct 2012 06:43:25 -0400
Content-class: urn:content-classes:message
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

Hi,

Ok I'll do a V3 soon.

Regards,


-----Original Message-----
From: Greg Ungerer [mailto:gerg@snapgear.com]
Sent: Tue 10/16/2012 7:04 AM
To: Stany MARCEL
Cc: linux-m68k@vger.kernel.org; gerg@uclinux.org
Subject: Re: [PATCH 1/4 V2] Add linux/io.h to make m54xx_wdt.c compile with MMU enabled.
 
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
