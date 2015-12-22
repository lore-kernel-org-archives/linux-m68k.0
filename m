From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v3 67/77] ncr5380: Cleanup comments
Date: Tue, 22 Dec 2015 09:04:23 +0100
Message-ID: <56790407.70305@suse.de>
References: <20151222011737.980475848@telegraphics.com.au>
 <20151222011756.245494676@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44479 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753580AbbLVIEZ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 22 Dec 2015 03:04:25 -0500
In-Reply-To: <20151222011756.245494676@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@odin.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>

On 12/22/2015 02:18 AM, Finn Thain wrote:
> The CVS revision log is not nearly as useful as the history/history.g=
it
> repo, so remove it. Roman's commentary at the top of his driver repea=
ts
> the same information elsewhere in the file so remove it. Also remove
> some other redundant or obsolete comments.
>
> Both the driver and the datasheets confusingly refer to a DMA access
> for a SCSI WRITE command as a "DMA write". Similarly a SCSI READ comm=
and
> is called a "DMA read". This is the opposite of the usual convention.
> Thankfully, the chip documentation and driver code also use "DMA send=
" and
> "DMA receive", so adopt this terminology.
>
> This removes some unimportant discrepancies between the two core driv=
er
> forks so that 'diff' can be used to reveal the important ones, to
> facilitate reunification.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
>   drivers/scsi/NCR5380.c       |  154 ++++++++++---------------------=
------------
>   drivers/scsi/atari_NCR5380.c |   97 +++------------------------
>   2 files changed, 48 insertions(+), 203 deletions(-)
>
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
