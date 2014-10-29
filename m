From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v2 09/36] ncr5380: Remove duplicate comments
Date: Wed, 29 Oct 2014 16:59:20 +0100
Message-ID: <54510ED8.6020302@suse.de>
References: <20141027052607.105914311@telegraphics.com.au> <20141027052609.315420492@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46753 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933413AbaJ2P7X (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 29 Oct 2014 11:59:23 -0400
In-Reply-To: <20141027052609.315420492@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Sam Creasey <sammy@sammy.net>, linux-scsi@vger.kernel.org, linux-m68k@vger.kernel.org

On 10/27/2014 06:26 AM, Finn Thain wrote:
> The LIMIT_TRANSFERSIZE, PSEUDO_DMA, PARITY and UNSAFE options are all
> documented in the core drivers where they are used. The same goes for=
 the
> chip databook reference. Remove the duplicate comments.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
