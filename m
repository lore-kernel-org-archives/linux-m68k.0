From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH] m68knommu: allow ColdFire CPUs to use unaligned
	accesses
Date: Tue, 12 Jun 2012 09:26:19 +0200
Message-ID: <20120612072619.GA17645@frolo.macqel>
References: <1339134180-13630-1-git-send-email-gerg@snapgear.com> <20120608103931.GA26964@frolo.macqel> <4FD1EDDF.1040101@snapgear.com> <20120608133503.GA12617@frolo.macqel> <4FD6A8A8.1070809@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay020.isp.belgacom.be ([195.238.6.95]:7455 "EHLO
	mailrelay020.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750733Ab2FLH0X (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 12 Jun 2012 03:26:23 -0400
Content-Disposition: inline
In-Reply-To: <4FD6A8A8.1070809@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Greg,

On Tue, Jun 12, 2012 at 12:25:44PM +1000, Greg Ungerer wrote:
> Hi Philippe,
>
> On 08/06/12 23:35, Philippe De Muyter wrote:
...
>>
>> I mentionned that only to make you able to soften the commit comment :)
>
> Ok, makes sense. I should probably have mentioned that this means
> the ColdFire processors currently support by Linux :-)
>
> Something like:
>
>   All of the current Linux supported ColdFire CPUs handle unaligned
>   memory accesses. So remove the CONFIG_CPU_HAS_NO_UNALIGNED option
>   selection for ColdFire. If we ever support a specific ColdFire CPU
>   that does not support unaligned accesses then we can insert the
>   CONFIG_CPU_HAS_NO_UNALIGNED for that specific CPU type.

That's perfect.  The line about dumb copying of the m68knommu settings
was too much self-flagellation for you to my eyes :)

Philippe
