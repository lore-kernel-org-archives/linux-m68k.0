From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v3 54/77] ncr5380: Use dsprintk() for queue debugging
Date: Tue, 22 Dec 2015 08:50:11 +0100
Message-ID: <567900B3.9080809@suse.de>
References: <20151222011737.980475848@telegraphics.com.au>
 <20151222011752.645488138@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43775 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751166AbbLVHuN (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 22 Dec 2015 02:50:13 -0500
In-Reply-To: <20151222011752.645488138@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@odin.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>

On 12/22/2015 02:18 AM, Finn Thain wrote:
> Print the command pointers in the log messages for debugging queue da=
ta
> structures. The LIST and REMOVE macros can then be removed.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
>   drivers/scsi/NCR5380.c       |   36 ++++++++++++++++++++++++-------=
-----
>   drivers/scsi/atari_NCR5380.c |   43 +++++++++++++++++++++++--------=
------------
>   2 files changed, 47 insertions(+), 32 deletions(-)
>
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
