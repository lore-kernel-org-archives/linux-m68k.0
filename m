From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v3 21/77] ncr5380: Sleep when polling, if possible
Date: Tue, 22 Dec 2015 08:12:04 +0100
Message-ID: <5678F7C4.4070205@suse.de>
References: <20151222011737.980475848@telegraphics.com.au>
 <20151222011743.725252751@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42148 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750729AbbLVHMI (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 22 Dec 2015 02:12:08 -0500
In-Reply-To: <20151222011743.725252751@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@odin.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>

On 12/22/2015 02:17 AM, Finn Thain wrote:
> When in process context, sleep during polling if doing so won't add
> significant latency. In interrupt context or if the lock is held, pol=
l
> briefly then give up. Keep both core drivers in sync.
>
> Calibrate busy-wait iterations to allow for variation in chip registe=
r
> access times between different 5380 hardware implementations.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
