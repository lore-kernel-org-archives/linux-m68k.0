From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v3 43/77] ncr5380: Standardize reselection handling
Date: Tue, 22 Dec 2015 08:41:03 +0100
Message-ID: <5678FE8F.8020700@suse.de>
References: <20151222011737.980475848@telegraphics.com.au>
 <20151222011749.695503926@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43303 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752644AbbLVHlF (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 22 Dec 2015 02:41:05 -0500
In-Reply-To: <20151222011749.695503926@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@odin.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>

On 12/22/2015 02:18 AM, Finn Thain wrote:
> Bring the two NCR5380_reselect() implementations into agreement.
>
> Replace infinite loops in atari_NCR5380.c with timeouts, as per NCR53=
80.c.
>
> Remove 'abort' flag in NCR5380.c as per atari_NCR5380.c -- if reselec=
tion
> fails, there may be no MESSAGE IN phase so don't attempt data transfe=
r.
>
> During selection, don't interfere with the chip registers after a
> reselection interrupt intervenes.
>
> Clean up some trivial issues with code style, comments and printk.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
>   drivers/scsi/NCR5380.c       |  115 +++++++++++++++++++++++--------=
------------
>   drivers/scsi/atari_NCR5380.c |   50 ++++++++++--------
>   2 files changed, 93 insertions(+), 72 deletions(-)
>
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
