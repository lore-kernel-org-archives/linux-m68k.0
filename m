From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v3 36/77] ncr5380: Use work_struct instead of delayed_work
Date: Tue, 22 Dec 2015 08:32:18 +0100
Message-ID: <5678FC82.9080706@suse.de>
References: <20151222011737.980475848@telegraphics.com.au>
 <20151222011747.805666887@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <20151222011747.805666887@telegraphics.com.au>
Sender: linux-scsi-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@odin.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-m68k@vger.kernel.org

On 12/22/2015 02:18 AM, Finn Thain wrote:
> Each host instance now has it's own work queue so the main() work ite=
m can
> sleep when necessary. That means we can use a simple work item rather=
 than
> a delayed work item. This brings NCR5380.c closer to atari_NCR5380.c.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
>   drivers/scsi/NCR5380.c |   12 +++++-------
>   drivers/scsi/NCR5380.h |    1 -
>   2 files changed, 5 insertions(+), 8 deletions(-)
>
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe linux-scsi" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
