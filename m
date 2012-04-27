From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 08/22] m68knommu: switch to GPIO init macros in ColdFire
 528x init code
Date: Fri, 27 Apr 2012 16:36:31 +1000
Message-ID: <4F9A3E6F.8080906@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com> <1335399962-10308-9-git-send-email-gerg@snapgear.com> <alpine.LNX.2.00.1204271240130.6685@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:51792 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278Ab2D0Ghb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 Apr 2012 02:37:31 -0400
In-Reply-To: <alpine.LNX.2.00.1204271240130.6685@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, sfking@fdwdc.com, Greg Ungerer <gerg@uclinux.org>

Hi Finn,

On 27/04/12 12:49, Finn Thain wrote:
> On Thu, 26 Apr 2012, gerg@snapgear.com wrote:
>
>> +	MCFGPS(QA, 24, 4, MCFQADC_DDRQA, MCFQADC_PORTQA, MCFQADC_PORTQA),
>> +	MCFGPS(QA, 32, 4, MCFQADC_DDRQB, MCFQADC_PORTQB, MCFQADC_PORTQB),
>
> I think the second label should be "QB".
>
> Also affected is "[PATCH 19/22] m68knommu: simplify the ColdFire 528x GPIO
> struct setup".

Good catch!
Thanks, I'll fix that up.

Regards
Greg

------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
