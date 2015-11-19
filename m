From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH 12/71] ncr5380: Remove unused hostdata->aborted flag
Date: Thu, 19 Nov 2015 15:13:29 +0100
Message-ID: <564DD909.3050205@suse.de>
References: <20151118083455.331768508@telegraphics.com.au> <20151118083458.411818911@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57174 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934174AbbKSONb (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 19 Nov 2015 09:13:31 -0500
In-Reply-To: <20151118083458.411818911@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@odin.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/18/2015 09:35 AM, Finn Thain wrote:
> The aborted flag was introduced in v1.1.38 but never used. Remove it.
>=20
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>=20
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		               zSeries & Storage
hare@suse.de			               +49 911 74053 688
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: F. Imend=F6rffer, J. Smithard, J. Guild, D. Upmanyu, G. Norton
HRB 21284 (AG N=FCrnberg)
