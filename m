From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH 07/29] ncr5380: Cleanup TAG_NEXT and TAG_NONE macros
Date: Mon, 06 Oct 2014 11:19:23 +0200
Message-ID: <54325E9B.3050906@suse.de>
References: <20141002065628.256592712@telegraphics.com.au> <20141002065629.926686164@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44689 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751140AbaJFJTZ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 6 Oct 2014 05:19:25 -0400
In-Reply-To: <20141002065629.926686164@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Sam Creasey <sammy@sammy.net>, linux-scsi@vger.kernel.org, linux-m68k@vger.kernel.org

On 10/02/2014 08:56 AM, Finn Thain wrote:
> Both atari_NCR5380.c and sun3_NCR5380.c core drivers #undef TAG_NONE =
and then
> redefine it. But the original definition is unused because NCR5380.c =
lacks
> support for tagged queueing. So just define it once.
>=20
> The TAG_NEXT macro only appears in the arguments to NCR5380_select() =
calls.
> But that routine doesn't use its tag argument as the tag was already =
assigned
> in NCR5380_main(). So remove the unused argument and the macro.
>=20
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>=20
Why not use 'SCSI_NO_TAG' from include/scsi/scsi_tcq.h ?

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
