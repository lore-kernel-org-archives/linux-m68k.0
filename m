From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v3 41/77] ncr5380: Replace redundant flags with
 FLAG_NO_DMA_FIXUP
Date: Tue, 22 Dec 2015 08:39:07 +0100
Message-ID: <5678FE1B.8050302@suse.de>
References: <20151222011737.980475848@telegraphics.com.au>
 <20151222011749.175496389@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43244 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752620AbbLVHjJ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 22 Dec 2015 02:39:09 -0500
In-Reply-To: <20151222011749.175496389@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@odin.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>

On 12/22/2015 02:18 AM, Finn Thain wrote:
> The flags DMA_WORKS_RIGHT, FLAG_NCR53C400 and FLAG_HAS_LAST_BYTE_SENT
> all mean the same thing, i.e. the chip is not a 538[01]. (More recent
> devices such as the 53C80 have a 'Last Byte Sent' bit in the Target
> Command Register as well as other fixes for End-of-DMA errata.)
>
> These flags have no additional meanings since previous cleanup patche=
s
> eliminated the NCR53C400 macro, moved g_NCR5380-specific code out of =
the
> core driver and standardized interrupt handling.
>
> Use the FLAG_NO_DMA_FIXUP flag to suppress End-of-DMA errata workarou=
nds,
> for those cards and drivers that make use of the TCR_LAST_BYTE_SENT b=
it.
> Remove the old flags.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
>   drivers/scsi/NCR5380.c   |   68 +++++++++++++++--------------------=
------------
>   drivers/scsi/NCR5380.h   |    4 --
>   drivers/scsi/dtc.c       |    4 --
>   drivers/scsi/g_NCR5380.c |    2 -
>   4 files changed, 25 insertions(+), 53 deletions(-)
>
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
