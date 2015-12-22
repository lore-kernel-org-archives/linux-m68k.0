From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v3 74/77] ncr5380: Enable PDMA for NCR53C400A
Date: Tue, 22 Dec 2015 09:07:49 +0100
Message-ID: <567904D5.4020700@suse.de>
References: <20151222011737.980475848@telegraphics.com.au>
 <20151222011758.155997471@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44695 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753827AbbLVIHw (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 22 Dec 2015 03:07:52 -0500
In-Reply-To: <20151222011758.155997471@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@odin.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Ondrej Zary <linux@rainbow-software.org>

On 12/22/2015 02:18 AM, Finn Thain wrote:
> From: Ondrej Zary <linux@rainbow-software.org>
>
> Add I/O register mapping for NCR53C400A and enable PDMA mode to
> improve performance and fix non-working IRQ.
>
> Tested with HP C2502 (and user-space enabler).
>
> Signed-off-by: Ondrej Zary <linux@rainbow-software.org>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
>
> Changes to Ondrej's version:
> - An 'if' statement is now a 'switch' statement.
> - Throw an error if MMIO register locations are not known.
>
> ---
>   drivers/scsi/g_NCR5380.c |   23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
>
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
