From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH 04/29] ncr5380: Remove unused macros
Date: Mon, 06 Oct 2014 11:21:54 +0200
Message-ID: <54325F32.4010804@suse.de>
References: <20141002065628.256592712@telegraphics.com.au> <20141002065629.216175491@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44776 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752149AbaJFJV6 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 6 Oct 2014 05:21:58 -0400
In-Reply-To: <20141002065629.216175491@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Sam Creasey <sammy@sammy.net>, linux-scsi@vger.kernel.org, linux-m68k@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

On 10/02/2014 08:56 AM, Finn Thain wrote:
> Some macros are never evaluated (i.e. FOO, USLEEP, SCSI2 and USE_WRAP=
PER; and=20
> in some drivers, NCR5380_intr and NCR5380_proc_info). DRIVER_SETUP se=
rves no
> purpose anymore. Remove these macro definitions.
>=20
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>=20
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)
